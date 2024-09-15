#nullable enable
using System;
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
            var choice = context.Choices.FirstOrDefault(choice => choice.Text == $"exit:{moveToRoomName}");
            if (choice.Text == null)
                throw new Exception($"Cannot find an interaction choice in Ink to exit to room {moveToRoomName}");

            context.TakeChoice(choice.Index);
        }
    }
}