#nullable enable

using System;
using System.Collections;
using System.Linq;
using Components;
using Components.InteractionSelector;
using LemuRivolta.InkAtoms;
using LemuRivolta.InkAtoms.CommandLineProcessors;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

public class InteractCoroutineCommand : CoroutineCommandLineProcessor
{
    [SerializeField] private StringEvent interactExitEvent;

    [SerializeField] private StringEvent interactCharacterEvent;

    [SerializeField] private StringEvent interactObjectEvent;

    [SerializeField] private VoidEvent advanceTimeEvent;

    [SerializeField] private StoryStateConstant storyStateInteracting;
    [SerializeField] private StoryStateConstant storyStateTalking;
    [SerializeField] private StoryStateVariable currentStoryState;
    [SerializeField] private AvailableInteractionsEvent availableInteractionsEvent;

    public InteractCoroutineCommand() : base("interact")
    {
    }

    private void Awake()
    {
        Assert.IsNotNull(interactExitEvent);
        Assert.IsNotNull(interactCharacterEvent);
        Assert.IsNotNull(advanceTimeEvent);
        Assert.IsNotNull(storyStateInteracting);
        Assert.IsNotNull(storyStateTalking);
        Assert.IsNotNull(currentStoryState);
    }

    protected override IEnumerator Process(CommandLineProcessorContext context)
    {
        var previousStoryState = currentStoryState.Value;
        currentStoryState.Value = storyStateInteracting.Value;

        var choices = context.Choices.Select(c => (c.Index, c.Text)).ToArray();

        // declare which interactions are available
        availableInteractionsEvent.Raise(new AvailableInteractions
        {
            availableInteractions = context.Choices.Select(choice =>
                {
                    var parts = choice.Text.Split(':');
                    if (parts.Length != 2)
                    {
                        return null;
                    }

                    return parts[0] switch
                    {
                        "exit" => new AvailableInteraction(Interaction.Exit, parts[1]),
                        "character" => new AvailableInteraction(Interaction.Character, parts[1]),
                        "object" => new AvailableInteraction(Interaction.Object, parts[1]),
                        _ => null
                    };
                })
                .WhereNotNull()
                .ToArray()
        });

        yield return AtomAwaiter.Await(
            interactExitEvent,
            onEvent1: moveToRoomName =>
            {
                // asked to move to room: take the given choice
                var choice = choices.FirstOrDefault(choice => choice.Text == $"exit:{moveToRoomName}");
                if (choice.Text == null)
                    throw new Exception($"Cannot find an interaction choice in Ink to exit to room {moveToRoomName}");

                currentStoryState.Value = previousStoryState;
                availableInteractionsEvent.Raise(AvailableInteractions.EmptyAvailableInteractions);
                context.TakeChoice(choice.Index);
            },
            atom2: advanceTimeEvent,
            onEvent2: _ =>
            {
                var choice = choices.FirstOrDefault(choice => choice.Text == "debug:advance_time");
                if (choice.Text == null)
                    throw new Exception(
                        "Cannot find an interaction choice in Ink to advance time for debug with name debug:advance_time");

                currentStoryState.Value = previousStoryState;
                availableInteractionsEvent.Raise(AvailableInteractions.EmptyAvailableInteractions);
                context.TakeChoice(choice.Index);
            },
            atom3: interactCharacterEvent,
            onEvent3: characterName =>
            {
                // asked to interact with character: take the given choice
                var choice = choices.FirstOrDefault(choice => choice.Text == $"character:{characterName}");
                if (choice.Text == null)
                    throw new Exception(
                        $"Cannot find an interaction choice in Ink to interact with character {characterName}; available choices are: " +
                        string.Join(", ", choices.Select(c => c.Text)));

                currentStoryState.Value = previousStoryState;
                availableInteractionsEvent.Raise(AvailableInteractions.EmptyAvailableInteractions);
                context.TakeChoice(choice.Index);
            },
            atom4: interactObjectEvent,
            onEvent4: objectName =>
            {
                // asked to interact with an object: take the given choice
                var choice = choices.FirstOrDefault(choice => choice.Text == $"object:{objectName}");
                if (choice.Text == null)
                    throw new Exception(
                        $"Cannot find an interaction choice in Ink to interact with object {objectName}; available choices are: " +
                        string.Join(", ", choices.Select(c => c.Text)));

                currentStoryState.Value = previousStoryState;
                availableInteractionsEvent.Raise(AvailableInteractions.EmptyAvailableInteractions);
                context.TakeChoice(choice.Index);
            }
        );

        Debug.Log("@interact command ended, whose choices are:");
        foreach (var choice in choices) Debug.Log("_ " + choice.Text);
    }
}