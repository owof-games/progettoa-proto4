#nullable enable
using NUnit.Framework;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Serialization;

namespace Scenes.RootScene
{
    public class TestLoadRoom2 : MonoBehaviour
    {
        [FormerlySerializedAs("moveToRoomEvent")] [SerializeField]
        private StringEvent? interactExitEvent;

        private void Awake()
        {
            Assert.IsNotNull(interactExitEvent);
        }

        public void OnClick()
        {
            Assert.IsNotNull(interactExitEvent);
            interactExitEvent!.Raise("room2");
        }
    }
}