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
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.SceneManagement;
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
    public class RoomConnections
    {
        public string sourceRoomName = "";
        public Direction direction;
        public string destinationRoomName = "";
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

        /// <summary>
        ///     A map between characters and the last room they were removed from (which indicates where they come from
        ///     at the next Add)
        /// </summary>
        private readonly Dictionary<Character.Character, Room> _lastRemovedFrom = new();

        private string? _currentlyLoadedRoomName; // jumps directly to the new value at the beginning of transition
        private GameObject? _currentSceneRootGameObject;

        /// <summary>
        ///     Asynchronous operation representing the last time a room was loaded.
        ///     It's lazy so that it can be awaited multiple times.
        ///     (from the sparse documentation, Preserve() should do the same, but it actually throws the error
        ///     corresponding to the behaviour of waiting twice on a normal task, so... who knows, lazy works, it's ok, not
        ///     wasting time on this)
        /// </summary>
        private AsyncLazy? _lastSceneLoadingOperation;

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
                    Debug.Log(
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
            Debug.Log($"lastRemovedFrom: save that {character} was removed from {e.Room}");
            _lastRemovedFrom[character] = e.Room;
        }

        private void OnRoomContentAdded(object sender, RoomContentEventArgs e)
        {
            if (_currentlyLoadedRoomName == null)
            {
                // Debug.Log("room contents changed when no room was loaded");
                return;
            }

            if (!Enum.TryParse<Character.Character>(e.SerializableInkListItem.itemName, out var character))
                // not interested if the entity added is not a character
                return;

            if (character == Character.Character.Ettore)
                // ettore is handled separately through moveToRoom
                return;

            OnRoomContentAddedAsync(e, character).Forget();
        }

        private async UniTaskVoid OnRoomContentAddedAsync(RoomContentEventArgs e, Character.Character character)
        {
            // we need this await to be sure that we process room removal BEFORE room add
            // for reasons not investigated, sometimes we receive the remove before the add,
            // sometimes vice versa (and this would break this code, which relies on knowing
            // where the character was)
            // alternative solution: keep track of where the character _is_, not where it's
            // removed from
            await UniTask.NextFrame();

            // in loops, the other room is loaded, and we are asked to immediately move characters
            // this would cause characters to move to non-loaded rooms
            // wait for the current loading operation to be completed
            if (_lastSceneLoadingOperation != null)
            {
                await _lastSceneLoadingOperation;
            }

            if (e.Room.ToString() != _currentlyLoadedRoomName)
            {
                if (_lastRemovedFrom.ContainsKey(character) &&
                    _lastRemovedFrom[character].ToString() == _currentlyLoadedRoomName)
                {
                    /*
                     * CASE: NPC MOVING OUT OF THE CURRENT ROOM
                     */
                    Debug.Log(
                        $"lastRemovedFrom: [moving out] found {character} was last removed from {_lastRemovedFrom[character]}");
                    // TODO: refactor with code below that does exactly the same
                    var sourceRoom2 = _lastRemovedFrom[character];
                    _lastRemovedFrom.Remove(character);
                    if (sourceRoom2 == e.Room)
                    {
                        // the character is not actually moving anywhere
                        return;
                    }

                    var connections2 = _roomConnectionsBySourceName[sourceRoom2.ToString()];
                    var connection2 = connections2.SingleOrDefault(c =>
                        c.destinationRoomName == e.Room.ToString());
                    if (connection2 == null)
                        throw new Exception(
                            $"Moving NPC {character}: cannot find connection from ${sourceRoom2} to ${e.Room}");

                    var direction2 = connection2.direction;

                    // navigate the character
                    // different from here on
                    var destination = direction2 == Direction.Left ? RoomDirection.Left : RoomDirection.Right;
                    var characterNavigation2 = GetCharacterNavigation(_currentSceneRootGameObject!.scene, character);
                    await characterNavigation2.ExitTo(destination);
                    Destroy(characterNavigation2.gameObject);
                }

                // will immediately get to this return if the character neither comes nor arrives in the current room
                return;
            }

            System.Diagnostics.Debug.Assert(characterMappings != null, nameof(characterMappings) + " != null");
            System.Diagnostics.Debug.Assert(_currentSceneRootGameObject != null,
                nameof(_currentSceneRootGameObject) + " != null");

            /*
             * CASE: NPC MOVING IN THE CURRENT ROOM
             */
            // if we move to a room at the same time some character is added, skip the animation
            var characterAlreadyPresentInScene =
                FindObjectsByType
                        <CharacterName>(FindObjectsInactive.Exclude, FindObjectsSortMode.None)
                    .Any(characterName => characterName.gameObject.scene == _currentSceneRootGameObject.scene &&
                                          characterName.Character == character);
            if (characterAlreadyPresentInScene)
            {
                // could actually perform the entrance animation
                return;
            }

            // find direction
            var sourceRoom = _lastRemovedFrom[character];
            Debug.Log(
                $"lastRemovedFrom: [moving in] found {character} was last removed from {_lastRemovedFrom[character]}");
            _lastRemovedFrom.Remove(character);
            if (sourceRoom == e.Room)
            {
                // the character is not actually moving anywhere
                return;
            }

            var connections = _roomConnectionsBySourceName[sourceRoom.ToString()];
            // TODO: this could error with .Single during loop reset (characters jump from far away rooms)
            // how to solve this?
            var connection = connections.SingleOrDefault(c => c.destinationRoomName == e.Room.ToString());
            var direction = connection?.direction ?? Direction.Left;

            // navigate the character
            var navigationGraph = GetCurrentNavigationGraph();
            var source = direction == Direction.Left
                ? navigationGraph.GetRightmostNodeIndex()
                : navigationGraph.GetLeftmostNodeIndex();
            var characterPrefab = characterMappings.GetCharacterPrefab(character);
            // Debug.Log($"Instantiating {character} at position {source} when adding to room");
            var instantiatedCharacter = Instantiate(characterPrefab, _currentSceneRootGameObject.transform);
            var characterNavigation = instantiatedCharacter.GetComponent<CharacterNavigation>();
            characterNavigation.SetUp(source);
            var destinationNodeIndex = navigationGraph.GetRandomFreeNode();
            await characterNavigation.EnterTo(destinationNodeIndex);
        }

        private NavigationGraph GetCurrentNavigationGraph()
        {
            System.Diagnostics.Debug.Assert(_currentlyLoadedRoomName != null,
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
            System.Diagnostics.Debug.Assert(roomContents != null, nameof(roomContents) + " != null");
            System.Diagnostics.Debug.Assert(characterMappings != null, nameof(characterMappings) + " != null");

            if (!Enum.TryParse<Room>(roomName, out var newRoom))
            {
                throw new InvalidOperationException($"Cannot find room {roomName}");
            }

            // nothing to do if we are already in the room
            if (_currentlyLoadedRoomName == roomName)
            {
                return;
            }

            // determine the direction of the movement (if there's a movement)
            var direction = Direction.Left;
            if (_currentlyLoadedRoomName != null)
                direction = _roomConnectionsBySourceName[_currentlyLoadedRoomName]
                    .First(c => c.destinationRoomName == roomName)
                    .direction;

            var directionFlag = direction == Direction.Left ? -1 : 1;

            // save the current ettore
            var prevEttoreGameObject = !_currentSceneRootGameObject
                ? null
                : FindObjectsByType<CharacterName>(FindObjectsInactive.Exclude, FindObjectsSortMode.None)
                    .Single(cn => cn.Character == Character.Character.Ettore &&
                                  cn.gameObject.scene == _currentSceneRootGameObject.scene)
                    .gameObject;

            // immediately update the loaded room
            var previouslyLoadedRoomName = _currentlyLoadedRoomName;
            _currentlyLoadedRoomName = roomName;

            // load the new room: immediately move it out of sight and hide ettore
            Assert.IsTrue(_roomDescriptionsByName.ContainsKey(roomName));
            var newSceneReference = _roomDescriptionsByName[_currentlyLoadedRoomName].scene;
            var lastSceneLoadingOperation = UniTask.Lazy(() =>
                SceneManager.LoadSceneAsync(newSceneReference.BuildIndex, LoadSceneMode.Additive).ToUniTask());
            _lastSceneLoadingOperation = lastSceneLoadingOperation;
            await lastSceneLoadingOperation;
            var newSceneRootGameObjects = newSceneReference.LoadedScene.GetRootGameObjects();
            Assert.AreEqual(newSceneRootGameObjects.Length, 1);
            _currentSceneRootGameObject = newSceneRootGameObjects[0];
            var deltaPosition = new Vector3(directionFlag * roomWidth, 0, 0); // TODO!
            _currentSceneRootGameObject.transform.position = deltaPosition;

            // instantiate characters that are present in that scene in random positions
            var characters = roomContents.GetCharacters(newRoom);
            var newSceneNavigationGraph = GetCurrentNavigationGraph();
            var availableNodes = newSceneNavigationGraph.NodesInScene.ToList();
            var ettoreNodeIndex = -1;
            GameObject newEttoreGameObject = null!;
            foreach (var character in characters)
            {
                var prefab = characterMappings.GetCharacterPrefab(character);
                var instantiatedCharacter = Instantiate(prefab, _currentSceneRootGameObject.transform);
                var characterNavigation = instantiatedCharacter.GetComponent<CharacterNavigation>();
                var idx = Random.Range(0, availableNodes.Count);
                var nodeIndex = availableNodes[idx];

                availableNodes.Remove(nodeIndex);
                if (character == Character.Character.Ettore && previouslyLoadedRoomName != null)
                {
                    // special case for ettore: since we must animate him moving in, he starts from an external point
                    // this is true only if we are not in the initial loading
                    ettoreNodeIndex = nodeIndex;
                    nodeIndex = direction == Direction.Left
                        ? newSceneNavigationGraph.GetRightmostNodeIndex()
                        : newSceneNavigationGraph.GetLeftmostNodeIndex();
                    newEttoreGameObject = instantiatedCharacter;
                }

                // Debug.Log($"Instantiating {character} at position {nodeIndex} for load room");
                characterNavigation.SetUp(nodeIndex);
            }

            // transition and unload (if there's a previous room)
            if (previouslyLoadedRoomName != null)
            {
                newEttoreGameObject.SetActive(false);

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
                prevEttoreGameObject?.SetActive(false);
                await UniTask.WhenAll(
                    LMotion
                        .Create(deltaPosition, Vector3.zero, transitionDuration)
                        .BindToPosition(_currentSceneRootGameObject.transform)
                        .AddTo(_currentSceneRootGameObject.transform)
                        .ToUniTask(),
                    LMotion
                        .Create(Vector3.zero, -deltaPosition, transitionDuration)
                        .BindToPosition(previousSceneRootGameObject.transform)
                        .AddTo(previousSceneRootGameObject.transform)
                        .ToUniTask());

                // animate Ettore coming in
                newEttoreGameObject.SetActive(true);
                mainCharacterNavigation =
                    GetCharacterNavigation(_currentSceneRootGameObject.scene, Character.Character.Ettore);
                await mainCharacterNavigation.EnterTo(ettoreNodeIndex);

                // unload current room
                await SceneManager.UnloadSceneAsync(_roomDescriptionsByName[previouslyLoadedRoomName].scene.BuildIndex);
            }

            // assure that the new scene is now in the correct position
            _currentSceneRootGameObject.transform.position = Vector3.zero;
        }

        private static CharacterNavigation GetCharacterNavigation(Scene scene, Character.Character character)
        {
            var result = (from characterName in FindObjectsByType<CharacterName>(
                    FindObjectsInactive.Exclude,
                    FindObjectsSortMode.None)
                where characterName.Character == character &&
                      characterName.gameObject.scene == scene
                select characterName.gameObject.GetComponent<CharacterNavigation>()).SingleOrDefault();
            if (result == null) throw new Exception($"Cannot find character {character} in scene {scene.name}");

            return result;
        }

        /// <summary>
        /// Temporary method to reset the current room's contents without animations or anything
        /// </summary>
        public void ResetRoom(int loopNumber)
        {
            if (loopNumber == 0)
            {
                // first loop is handled by standard initialization code
                return;
            }

            // immediately removes all characters
            var currentCharactersGameObjects =
                (from characterName in FindObjectsByType<CharacterName>(FindObjectsInactive.Exclude,
                        FindObjectsSortMode.None)
                    let gameObject = characterName.gameObject
                    where gameObject.scene == _currentSceneRootGameObject.scene
                    select gameObject).ToList();
            foreach (var obj in currentCharactersGameObjects)
            {
                DestroyImmediate(obj);
            }

            // recreate them
            var characters = roomContents!.GetCharacters(Enum.Parse<Room>(_currentlyLoadedRoomName!));
            var newSceneNavigationGraph = GetCurrentNavigationGraph();
            var availableNodes = newSceneNavigationGraph.NodesInScene.ToList();
            foreach (var character in characters)
            {
                var prefab = characterMappings!.GetCharacterPrefab(character);
                var instantiatedCharacter = Instantiate(prefab, _currentSceneRootGameObject!.transform);
                var characterNavigation = instantiatedCharacter.GetComponent<CharacterNavigation>();
                var idx = Random.Range(0, availableNodes.Count);
                var nodeIndex = availableNodes[idx];

                availableNodes.Remove(nodeIndex);
                characterNavigation.SetUp(nodeIndex);
            }
        }

        /// <summary>
        ///     Get in which direction is a character from current room.
        /// </summary>
        /// <param name="character">The character to look for.</param>
        /// <returns>The direction this character is relative to the current room.</returns>
        public Direction GetDirection(Character.Character character)
        {
            // get character's current room
            var destinationRoom = roomContents!.GetCharacterRoom(character);
            var destinationRoomName = destinationRoom.ToString();
            // try both directions
            for (var direction = Direction.Left; direction <= Direction.Right; direction++)
            {
                var currentRoom = _currentlyLoadedRoomName;
                if (currentRoom == destinationRoomName)
                {
                    throw new InvalidOperationException(
                        "Cannot get a left/right direction for character wrt the current room: the character is in the current room!");
                }
                for (;;)
                {
                    var roomConnection = roomConnections.FirstOrDefault(rc =>
                        rc.direction == direction && rc.sourceRoomName == currentRoom);
                    if (roomConnection == null) break;

                    if (roomConnection.destinationRoomName == destinationRoomName) return direction;
                }
            }

            throw new Exception("Cannot find character in any room");
        }
    }
}