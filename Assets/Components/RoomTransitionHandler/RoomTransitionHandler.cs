#nullable enable
using System;
using System.Collections.Generic;
using System.Linq;
using Cysharp.Threading.Tasks;
using Eflatun.SceneReference;
using LitMotion;
using LitMotion.Extensions;
using NUnit.Framework;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.SceneManagement;

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

        private string? _currentlyLoadedRoomName; // jumps directly to the new value at the beginning of transition
        private Dictionary<string, List<RoomConnections>> _roomConnectionsBySourceName = new();

        private Dictionary<string, RoomDescription> _roomDescriptionsByName = new();

        private void Awake()
        {
            // check data consistency and create intermediary data structures
            Assert.IsTrue(transitionDuration > 0);

            Assert.IsNotNull(roomTransitionHandlerGameObject);

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
                Debug.Log($"Examining {roomDescription.name}");
                var scene = roomDescription.scene.LoadedScene;
                if (!scene.IsValid()) continue;

                Debug.Log("Scene is valid");
                var unloadOperation = SceneManager.UnloadSceneAsync(scene.buildIndex);
                Debug.Log($"Unload operation: {unloadOperation}");
                if (unloadOperation == null)
                {
                    Debug.Log(
                        "Well, maybe the documentation is shit and it's not enough for LoadedScene to be valid in order to have, well, an actually loaded scene");
                    continue;
                }

                var task = unloadOperation.ToUniTask();
                Debug.Log($"Task: {task}");
                unloadTasks.Add(task);
            }

            if (unloadTasks.Count > 0) await UniTask.WhenAll(unloadTasks);
        }

        /// <summary>
        /// Load the given room
        /// </summary>
        /// <param name="roomName"></param>
        /// <returns></returns>
        public async UniTask LoadRoom(string roomName)
        {
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
            var newSceneReference = _roomDescriptionsByName[roomName].scene;
            await SceneManager.LoadSceneAsync(newSceneReference.BuildIndex, LoadSceneMode.Additive);
            var newSceneRootGameObjects = newSceneReference.LoadedScene.GetRootGameObjects();
            Assert.AreEqual(newSceneRootGameObjects.Length, 1);
            var newSceneRootGameObject = newSceneRootGameObjects[0];
            var deltaPosition = new Vector3(directionFlag * roomWidth, 0, 0); // TODO!
            newSceneRootGameObject.transform.position = deltaPosition;

            // transition and unload (if there's a previous room)
            if (previouslyLoadedRoomName != null)
            {
                var previousSceneReference = _roomDescriptionsByName[previouslyLoadedRoomName].scene;
                var previousSceneRootGameObjects = previousSceneReference.LoadedScene.GetRootGameObjects();
                Assert.AreEqual(previousSceneRootGameObjects.Length, 1);
                var previousSceneRootGameObject = previousSceneRootGameObjects[0];
                await UniTask.WhenAll(
                    LMotion
                        .Create(deltaPosition, Vector3.zero, transitionDuration)
                        .BindToPosition(newSceneRootGameObject.transform)
                        .ToUniTask(),
                    LMotion
                        .Create(Vector3.zero, -deltaPosition, transitionDuration)
                        .BindToPosition(previousSceneRootGameObject.transform)
                        .ToUniTask());

                // unload current room
                await SceneManager.UnloadSceneAsync(_roomDescriptionsByName[previouslyLoadedRoomName].scene.BuildIndex);
            }

            // assure that the new scene is now in the correct position
            newSceneRootGameObject.transform.position = Vector3.zero;
        }
    }
}