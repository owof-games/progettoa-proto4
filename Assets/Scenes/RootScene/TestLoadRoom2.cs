using System;
using Components.RoomTransitionHandler;
using Cysharp.Threading.Tasks;
using JetBrains.Annotations;
using NUnit.Framework;
using UnityEngine;

namespace Scenes.RootScene
{
    public class TestLoadRoom2 : MonoBehaviour
    {
        [SerializeField] [CanBeNull] private RoomTransitionHandler roomTransitionHandler;

        private void Awake()
        {
            Assert.IsNotNull(roomTransitionHandler);
        }

        private UniTaskVoid Start()
        {
            Assert.IsNotNull(roomTransitionHandler);
            return roomTransitionHandler.LoadRoom("room1");
        }

        public void OnClick()
        {
            Assert.IsNotNull(roomTransitionHandler);
            roomTransitionHandler.LoadRoom("room2").Forget();
        }
    }
}