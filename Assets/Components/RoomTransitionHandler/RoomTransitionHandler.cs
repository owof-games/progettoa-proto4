#nullable enable
using System;
using System.Collections.Generic;
using System.Linq;
using Cysharp.Threading.Tasks;
using Eflatun.SceneReference;
using LitMotion;
using LitMotion.Extensions;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.Serialization;

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
        [SerializeField] private List<RoomDescription> roomDescriptions = new();
        [SerializeField] private List<RoomConnections> roomConnections = new();
        [SerializeField] private float transitionDuration;

        private Dictionary<string, RoomDescription> _roomDescriptionsByName = new();
        private Dictionary<string, RoomConnections> _roomConnectionsBySourceName = new();

        private string? _currentlyLoadedRoomName; // jumps directly to the new value at the beginning of transition

        private void Awake()
        {
            // check data consistency and create intermediary data structures
            Assert.IsTrue(transitionDuration > 0);
            
            Assert.IsNotNull(roomDescriptions);
            Assert.IsNotNull(roomConnections);
            Assert.IsTrue(roomDescriptions.Select(r => r.name).ToHashSet().Count == roomDescriptions.Count,
                "room description names are not unique");
            _roomDescriptionsByName = roomDescriptions.ToDictionary(r => r.name, r => r);

            Assert.IsTrue(roomConnections.All(c =>
                    _roomDescriptionsByName.ContainsKey(c.sourceRoomName) &&
                    _roomDescriptionsByName.ContainsKey(c.destinationRoomName)),
                "there's at least one room in the connections that is not in the descriptions");
            _roomConnectionsBySourceName = roomConnections.ToDictionary(c => c.sourceRoomName, c => c);
        }

        // ReSharper disable once Unity.IncorrectMethodSignature
        private async UniTaskVoid Start()
        {
            // unload all room scenes and wait for the unload operation to complete (useful in debug)
            await UniTask.WhenAll(from roomDescription in roomDescriptions
                let scene = roomDescription.scene.LoadedScene
                where scene.IsValid()
                select SceneManager.UnloadSceneAsync(scene).ToUniTask());
        }

        /// <summary>
        /// Load the given room
        /// </summary>
        /// <param name="roomName"></param>
        /// <returns></returns>
        public async UniTaskVoid LoadRoom(string roomName)
        {
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
            var deltaPosition = new Vector3(-19.27f, 0, 0); // TODO!
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
                        .Create(deltaPosition, Vector3.zero, (float)transitionDuration)
                        .BindToPosition(newSceneRootGameObject.transform)
                        .ToUniTask(),
                    LMotion
                        .Create(Vector3.zero, -deltaPosition, (float)transitionDuration)
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