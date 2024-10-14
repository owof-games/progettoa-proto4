#nullable enable
using System;
using System.Collections;
using System.Linq;
using LemuRivolta.InkAtoms;
using LemuRivolta.InkAtoms.CommandLineProcessors;
using NUnit.Framework;
using UnityAtoms.BaseAtoms;
using UnityEngine;

public class InteractCoroutineCommand : CoroutineCommandLineProcessor
{
    [SerializeField] private StringEvent interactExitEvent;

    [SerializeField] private StringEvent interactCharacterEvent;

    [SerializeField] private VoidEvent advanceTimeEvent;

    public InteractCoroutineCommand() : base("interact")
    {
    }

    private void Awake()
    {
        Assert.IsNotNull(interactExitEvent);
        Assert.IsNotNull(interactCharacterEvent);
        Assert.IsNotNull(advanceTimeEvent);
    }

    protected override IEnumerator Process(CommandLineProcessorContext context)
    {
        yield return AtomAwaiter.Await(
            interactExitEvent,
            onEvent1: moveToRoomName =>
            {
                // asked to move to room: take the given choice
                var choice = context.Choices.FirstOrDefault(choice => choice.Text == $"exit:{moveToRoomName}");
                if (choice.Text == null)
                    throw new Exception($"Cannot find an interaction choice in Ink to exit to room {moveToRoomName}");

                context.TakeChoice(choice.Index);
            },
            atom2: advanceTimeEvent,
            onEvent2: _ =>
            {
                var choice = context.Choices.FirstOrDefault(choice => choice.Text == "debug:advance_time");
                if (choice.Text == null)
                    throw new Exception(
                        "Cannot find an interaction choice in Ink to advance time for debug with name debug:advance_time");

                context.TakeChoice(choice.Index);
            },
            atom3: interactCharacterEvent,
            onEvent3: characterName =>
            {
                // asked to interact with character: take the given choice
                var choice = context.Choices.FirstOrDefault(choice => choice.Text == $"character:{characterName}");
                if (choice.Text == null)
                    throw new Exception(
                        $"Cannot find an interaction choice in Ink to interact with character {characterName}");

                context.TakeChoice(choice.Index);
            }
        );
    }
}