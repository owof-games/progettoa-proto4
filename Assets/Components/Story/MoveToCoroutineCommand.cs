using System.Collections;
using Cysharp.Threading.Tasks;
using LemuRivolta.InkAtoms.CommandLineProcessors;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Story
{
    public class MoveToCoroutineCommand : CoroutineCommandLineProcessor
    {
        [SerializeField] private GameObjectVariable roomTransitionHandlerGameObject;

        public MoveToCoroutineCommand() : base("moveTo")
        {
        }

        protected override IEnumerator Process(CommandLineProcessorContext context)
        {
            // check we have a reference to the room transition handler game object
            Assert.IsNotNull(roomTransitionHandlerGameObject);

            // extract the room transition handler
            var roomTransitionHandler = roomTransitionHandlerGameObject.Value
                .GetComponent<RoomTransitionHandler.RoomTransitionHandler>();
            Assert.IsNotNull(roomTransitionHandler);

            // get the room we transition to
            var roomName = context["roomName"] as string;
            Assert.IsNotNull(roomName);

            // run the transition
            yield return roomTransitionHandler
                .LoadRoom(roomName)
                .ToCoroutine();
        }
    }
}