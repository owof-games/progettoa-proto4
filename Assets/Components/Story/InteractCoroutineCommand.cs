#nullable enable
using System.Collections;
using System.Linq;
using LemuRivolta.InkAtoms;
using LemuRivolta.InkAtoms.CommandLineProcessors;
using NUnit.Framework;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Serialization;

public class InteractCoroutineCommand : CoroutineCommandLineProcessor
{
    [FormerlySerializedAs("moveToRoomEvent")] [SerializeField]
    private StringEvent interactExitEvent;

    public InteractCoroutineCommand() : base("interact")
    {
    }

    private void Awake()
    {
        Assert.IsNotNull(interactExitEvent);
    }

    protected override IEnumerator Process(CommandLineProcessorContext context)
    {
        string? moveToRoomName = null;

        yield return interactExitEvent.Await(onEvent: result => { moveToRoomName = result; });

        if (moveToRoomName != null)
        {
            // asked to move to room: take the given choice
            var choice = context.Choices.First(choice => choice.Text == $"exit:{moveToRoomName}");
            Assert.IsNotNull(choice);
            context.TakeChoice(choice.Index);
        }
    }
}