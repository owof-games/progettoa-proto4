#nullable enable
using System;
using System.Collections.Generic;
using System.Linq;
using Components.Character;
using Components.NavigationNetwork;
using Components.Story.Rooms;
using Cysharp.Threading.Tasks;
using Eflatun.SceneReference;
using LitMotion;
using LitMotion.Extensions;
using NUnit.Framework;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.SceneManagement;
using Debug = System.Diagnostics.Debug;
using InvalidOperationException = System.InvalidOperationException;
using Random = UnityEngine.Random;

namespace Components.RoomTransitionHandler
{
    public enum Direction
    {
        Left,
        Right
    }

    [Serializable]
    public struct RoomDescription
    {
        /// <summary>
        /// Unique room name.
        /// </summary>
        public string name;

        /// <summary>
        /// Reference to the scene containing the room
        /// </summary>
        public SceneReference scene;
    }

    [Serializable]
    public struct RoomConnections
    {
        public string sourceRoomName;
        public Direction direction;
        public string destinationRoomName;
    }

    public class RoomTransitionHandler : MonoBehaviour
    {
        [SerializeField] private float transitionDuration;
        [SerializeField] private float roomWidth = 19.27f;
        [SerializeField] private List<RoomDescription> roomDescriptions = new();
        [SerializeField] private List<RoomConnections> roomConnections = new();
        [SerializeField] private GameObjectVariable? roomTransitionHandlerGameObject;
        [SerializeField] private RoomContents? roomContents;
        [SerializeField] private CharacterMappings? characterMappings;

        private string? _currentlyLoadedRoomName; // jumps directly to the new value at the beginning of transition
        private GameObject? _currentSceneRootGameObject;

        /// <summary>
        /// A map between characters and the last room they were removed from (which indicates where they come from
        /// at the next Add)
        /// </summary>
        private Dictionary<Character.Character, Room> _lastRemovedFrom = new();

        private Dictionary<string, List<RoomConnections>> _roomConnectionsBySourceName = new();

        private Dictionary<string, RoomDescription> _roomDescriptionsByName = new();

        private void Awake()
        {
            // check data consistency and create intermediary data structures
            Assert.IsTrue(transitionDuration > 0);

            Assert.IsNotNull(roomTransitionHandlerGameObject);

            Debug.Assert(roomContents != null, nameof(roomContents) + " != null");
            roomContents.RoomContentAdded += OnRoomContentAdded;
            roomContents.RoomContentRemoved += OnRoomContentRemoved;
            Assert.IsNotNull(characterMappings);

            Assert.IsNotNull(roomDescriptions);
            Assert.IsNotNull(roomConnections);
            Assert.IsTrue(roomDescriptions.Select(r => r.name).ToHashSet().Count == roomDescriptions.Count,
                "room description names are not unique");
            _roomDescriptionsByName = roomDescriptions.ToDictionary(r => r.name, r => r);

            Assert.IsTrue(roomConnections.All(c =>
                    _roomDescriptionsByName.ContainsKey(c.sourceRoomName) &&
                    _roomDescriptionsByName.ContainsKey(c.destinationRoomName)),
                "there's at least one room in the connections that is not in the descriptions");
            _roomConnectionsBySourceName = new Dictionary<string, List<RoomConnections>>();
            foreach (var roomConnection in roomConnections)
            {
                var sourceRoomConnectionsList = _roomConnectionsBySourceName
                    .GetValueOrDefault(roomConnection.sourceRoomName, new List<RoomConnections>());
                sourceRoomConnectionsList.Add(roomConnection);
                _roomConnectionsBySourceName[roomConnection.sourceRoomName] = sourceRoomConnectionsList;

                var destRoomConnectionsList = _roomConnectionsBySourceName
                    .GetValueOrDefault(roomConnection.destinationRoomName, new List<RoomConnections>());
                destRoomConnectionsList.Add(new RoomConnections
                {
                    sourceRoomName = roomConnection.destinationRoomName,
                    direction = roomConnection.direction == Direction.Left ? Direction.Right : Direction.Left,
                    destinationRoomName = roomConnection.sourceRoomName
                });
                _roomConnectionsBySourceName[roomConnection.destinationRoomName] = destRoomConnectionsList;
            }

            // save the room transition handler game object at the end of the checks and data structure creation
            roomTransitionHandlerGameObject!.Value = gameObject;
        }

        // ReSharper disable once Unity.IncorrectMethodSignature
        private async UniTaskVoid Start()
        {
            // unload all room scenes and wait for the unload operation to complete (useful in debug)
            var unloadTasks = new List<UniTask>();
            foreach (var roomDescription in roomDescriptions)
            {
                var scene = roomDescription.scene.LoadedScene;
                if (!scene.IsValid()) continue;

                var unloadOperation = SceneManager.UnloadSceneAsync(scene.buildIndex);
                if (unloadOperation == null)
                {
                    UnityEngine.Debug.Log(
                        "Well, maybe the documentation is shit and it's not enough for LoadedScene to be valid in order to have, well, an actually loaded scene");
                    continue;
                }

                var task = unloadOperation.ToUniTask();
                unloadTasks.Add(task);
            }

            if (unloadTasks.Count > 0) await UniTask.WhenAll(unloadTasks);
        }

        private void OnRoomContentRemoved(object sender, RoomContentEventArgs e)
        {
            // get the character (if it's a character, otherwise just ignore)
            if (!Enum.TryParse<Character.Character>(e.SerializableInkListItem.itemName, out var character))
            {
                return;
            }

            // save
            _lastRemovedFrom[character] = e.Room;
        }

        private void OnRoomContentAdded(object sender, RoomContentEventArgs e)
        {
            if (_currentlyLoadedRoomName == null)
            {
                UnityEngine.Debug.Log("room contents changed when no room was loaded");
                return;
            }

            if (!Enum.TryParse<Character.Character>(e.SerializableInkListItem.itemName, out var character))
            {
                // not interested if the entity added is not a character
                return;
            }

            if (e.Room.ToString() != _currentlyLoadedRoomName)
            {
                if (_lastRemovedFrom.ContainsKey(character) &&
                    _lastRemovedFrom[character].ToString() == _currentlyLoadedRoomName)
                {
                    // this character is moving away from this room: show the transition animation
                    // TODO: refactor with code below that does exactly the same
                    var sourceRoom2 = _lastRemovedFrom[character];
                    var connections2 = _roomConnectionsBySourceName[sourceRoom2.ToString()];
                    var connection2 = connections2.Single(c =>
                        c.destinationRoomName == e.Room.ToString());
                    var direction2 = connection2.direction;

                    // navigate the character
                    var navigationGraph2 = GetCurrentNavigationGraph();
                    // different from here on
                    // var destinationNodeIndex2 = direction2 == Direction.Left
                    //     ? navigationGraph2.GetLeftmostNodeIndex() // inverted
                    //     : navigationGraph2.GetRightmostNodeIndex();
                    var destination = direction2 == Direction.Left ? RoomDirection.Left : RoomDirection.Right;
                    var characterNavigation2 = GetCharacterNavigation(_currentSceneRootGameObject!.scene, character);
                    characterNavigation2.ExitTo(destination).ContinueWith(() =>
                    {
                        Destroy(characterNavigation2.gameObject);
                    }).Forget();
                }

                // will immediately get to this return if the character neither comes or arrives in the current room
                return;
            }

            Debug.Assert(characterMappings != null, nameof(characterMappings) + " != null");
            Debug.Assert(_currentSceneRootGameObject != null,
                nameof(_currentSceneRootGameObject) + " != null");

            // find direction
            var sourceRoom = _lastRemovedFrom[character];
            var connections = _roomConnectionsBySourceName[sourceRoom.ToString()];
            var connection = connections.Single(c => c.destinationRoomName == e.Room.ToString());
            var direction = connection.direction;

            // navigate the character
            var navigationGraph = GetCurrentNavigationGraph();
            var source = direction == Direction.Left
                ? navigationGraph.GetRightmostNodeIndex()
                : navigationGraph.GetLeftmostNodeIndex();
            var characterPrefab = characterMappings.GetCharacterPrefab(character);
            var instantiatedCharacter = Instantiate(characterPrefab, _currentSceneRootGameObject.transform);
            var characterNavigation = instantiatedCharacter.GetComponent<CharacterNavigation>();
            characterNavigation.SetUp(source);
            var destinationNodeIndex = navigationGraph.GetRandomFreeNode();
            characterNavigation.EnterTo(destinationNodeIndex).Forget();
        }

        private NavigationGraph GetCurrentNavigationGraph()
        {
            Debug.Assert(_currentlyLoadedRoomName != null,
                nameof(_currentlyLoadedRoomName) + " != null");
            var newSceneReference = _roomDescriptionsByName[_currentlyLoadedRoomName].scene;
            return FindObjectsByType<NavigationGraph>(FindObjectsInactive.Exclude, FindObjectsSortMode.None)
                .First(gn => gn.gameObject.scene == newSceneReference.LoadedScene);
        }

        /// <summary>
        /// Load the given room
        /// </summary>
        /// <param name="roomName"></param>
        /// <returns></returns>
        public async UniTask LoadRoom(string roomName)
        {
            Debug.Assert(roomContents != null, nameof(roomContents) + " != null");
            Debug.Assert(characterMappings != null, nameof(characterMappings) + " != null");

            if (!Enum.TryParse<Room>(roomName, out var newRoom))
            {
                throw new InvalidOperationException($"Cannot find room {roomName}");
            }

            // determine the direction of the movement (if there's a movement)
            var direction = Direction.Left;
            if (_currentlyLoadedRoomName != null)
                direction = _roomConnectionsBySourceName[_currentlyLoadedRoomName]
                    .First(c => c.destinationRoomName == roomName)
                    .direction;

            var directionFlag = direction == Direction.Left ? -1 : 1;

            // immediately update the loaded room
            var previouslyLoadedRoomName = _currentlyLoadedRoomName;
            _currentlyLoadedRoomName = roomName;

            // load the new room and immediately move it out of sight
            Assert.IsTrue(_roomDescriptionsByName.ContainsKey(roomName));
            var newSceneReference = _roomDescriptionsByName[_currentlyLoadedRoomName].scene;
            await SceneManager.LoadSceneAsync(newSceneReference.BuildIndex, LoadSceneMode.Additive);
            var newSceneRootGameObjects = newSceneReference.LoadedScene.GetRootGameObjects();
            Assert.AreEqual(newSceneRootGameObjects.Length, 1);
            _currentSceneRootGameObject = newSceneRootGameObjects[0];
            var deltaPosition = new Vector3(directionFlag * roomWidth, 0, 0); // TODO!
            _currentSceneRootGameObject.transform.position = deltaPosition;

            // instantiate characters that are present in that scene in random positions
            var characters = roomContents.GetCharacters(newRoom);
            var newSceneNavigationGraph = GetCurrentNavigationGraph();
            var availableNodes = newSceneNavigationGraph.NodesInScene.ToList();
            foreach (var character in characters)
            {
                var prefab = characterMappings.GetCharacterPrefab(character);
                var instantiatedCharacter = Instantiate(prefab, _currentSceneRootGameObject.transform);
                var characterNavigation = instantiatedCharacter.GetComponent<CharacterNavigation>();
                var idx = Random.Range(0, availableNodes.Count);
                var nodeIndex = availableNodes[idx];
                availableNodes.Remove(nodeIndex);
                characterNavigation.SetUp(nodeIndex);
            }

            // transition and unload (if there's a previous room)
            if (previouslyLoadedRoomName != null)
            {
                var previousSceneReference = _roomDescriptionsByName[previouslyLoadedRoomName].scene;
                var previousSceneRootGameObjects = previousSceneReference.LoadedScene.GetRootGameObjects();
                Assert.AreEqual(previousSceneRootGameObjects.Length, 1);
                var previousSceneRootGameObject = previousSceneRootGameObjects[0];
                // animate Ettore going out
                var mainCharacterNavigation =
                    GetCharacterNavigation(previousSceneRootGameObject.scene, Character.Character.Ettore);
                await mainCharacterNavigation.ExitTo(direction == Direction.Left
                    ? RoomDirection.Left
                    : RoomDirection.Right);
                // animate room transition
                await UniTask.WhenAll(
                    LMotion
                        .Create(deltaPosition, Vector3.zero, transitionDuration)
                        .BindToPosition(_currentSceneRootGameObject.transform)
                        .ToUniTask(),
                    LMotion
                        .Create(Vector3.zero, -deltaPosition, transitionDuration)
                        .BindToPosition(previousSceneRootGameObject.transform)
                        .ToUniTask());

                // unload current room
                await SceneManager.UnloadSceneAsync(_roomDescriptionsByName[previouslyLoadedRoomName].scene.BuildIndex);
            }

            // assure that the new scene is now in the correct position
            _currentSceneRootGameObject.transform.position = Vector3.zero;
        }

        private static CharacterNavigation GetCharacterNavigation(Scene scene, Character.Character character)
        {
            return (from characterName in FindObjectsByType<CharacterName>(
                    FindObjectsInactive.Exclude,
                    FindObjectsSortMode.None)
                where characterName.Character == character &&
                      characterName.gameObject.scene == scene
                select characterName.gameObject.GetComponent<CharacterNavigation>()).Single();
        }
    }
}