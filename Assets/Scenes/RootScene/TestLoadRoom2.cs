#nullable enable

using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

namespace Scenes.RootScene
{
    public class TestLoadRoom2 : MonoBehaviour
    {
        [SerializeField] private StringEvent? interactExitEvent;

        private void Awake()
        {
            Assert.IsNotNull(interactExitEvent);
        }

        public void OnClickRoom1()
        {
            Assert.IsNotNull(interactExitEvent);
            interactExitEvent!.Raise("room1");
        }

        public void OnClickRoom2()
        {
            Assert.IsNotNull(interactExitEvent);
            interactExitEvent!.Raise("room2");
        }

        public void OnClickRoom(string roomName)
        {
            Assert.IsNotNull(interactExitEvent);
            interactExitEvent!.Raise(roomName);
        }
    }
}