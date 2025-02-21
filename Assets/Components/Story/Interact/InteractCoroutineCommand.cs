#nullable enable

using System;
using System.Collections;
using System.Linq;
using System.Threading;
using Components;
using Components.InteractionSelector;
using Cysharp.Threading.Tasks;
using LemuRivolta.InkAtoms.CommandLineProcessors;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

public class InteractCoroutineCommand : CoroutineCommandLineProcessor
{
    [SerializeField] private StringEvent interactExitEvent;

    [SerializeField] private StringEvent interactCharacterEvent;

    [SerializeField] private StringEvent interactObjectEvent;

    [SerializeField] private StringEvent dropObjectEvent;

    [SerializeField] private VoidEvent advanceTimeEvent;

    [SerializeField] private VoidEvent phoneClickedEvent;

    [SerializeField] private VoidEvent notebookClickedEvent;

    [SerializeField] private StoryStateConstant storyStateInteracting;
    [SerializeField] private StoryStateConstant storyStateTalking;
    [SerializeField] private StoryStateVariable currentStoryState;
    [SerializeField] private StoryStateConstant notebookStoryState;
    [SerializeField] private AvailableInteractionsEvent availableInteractionsEvent;

    public InteractCoroutineCommand() : base("interact")
    {
    }

    private void Awake()
    {
        Assert.IsNotNull(interactExitEvent);
        Assert.IsNotNull(interactCharacterEvent);
        Assert.IsNotNull(interactObjectEvent);
        Assert.IsNotNull(dropObjectEvent);
        Assert.IsNotNull(advanceTimeEvent);
        Assert.IsNotNull(storyStateInteracting);
        Assert.IsNotNull(storyStateTalking);
        Assert.IsNotNull(currentStoryState);
        Assert.IsNotNull(phoneClickedEvent);
        Assert.IsNotNull(notebookClickedEvent);
        Assert.IsNotNull(notebookStoryState);
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
                    if (parts.Length != 2 && parts[0] != "phone" && parts[0] != "notebook")
                    {
                        return null;
                    }

                    return parts[0] switch
                    {
                        "exit" => new AvailableInteraction(Interaction.Exit, parts[1]),
                        "character" => new AvailableInteraction(Interaction.Character, parts[1]),
                        "object" => new AvailableInteraction(Interaction.Object, parts[1]),
                        "dropobject" => new AvailableInteraction(Interaction.DropObject, parts[1]),
                        "phone" => new AvailableInteraction(Interaction.Phone, ""),
                        "notebook" => new AvailableInteraction(Interaction.Notebook, ""),
                        _ => null
                    };
                })
                .WhereNotNull()
                .ToArray()
        });

        var cancellationTokenSource = new CancellationTokenSource();

        var moveToRoomTask = interactExitEvent.ToUniTask(cancellationTokenSource.Token)
            .ContinueWith(moveToRoomName => TakeChoice($"exit:{moveToRoomName}", storyStateTalking));

        var takeChoiceTask = advanceTimeEvent.ToUniTask(cancellationTokenSource.Token)
            .ContinueWith(_ => TakeChoice("debug:advance_time"));

        var interactCharacterTask = interactCharacterEvent.ToUniTask(cancellationTokenSource.Token).ContinueWith(
            characterName => TakeChoice($"character:{characterName}", storyStateTalking));

        var interactObjectTask = interactObjectEvent.ToUniTask(cancellationTokenSource.Token).ContinueWith(
            objectName => TakeChoice($"object:{objectName}", storyStateTalking));

        var dropObjectTask = dropObjectEvent.ToUniTask(cancellationTokenSource.Token).ContinueWith(
            objectName => TakeChoice($"dropobject:{objectName}"));

        var phoneClickedTask = phoneClickedEvent.ToUniTask(cancellationTokenSource.Token).ContinueWith(
            _ => TakeChoice("phone", storyStateTalking));

        var notebookClickedTask = notebookClickedEvent.ToUniTask(cancellationTokenSource.Token).ContinueWith(
            _ => TakeChoice("notebook", notebookStoryState));

        yield return UniTask.WhenAny(moveToRoomTask, takeChoiceTask, interactCharacterTask, interactObjectTask,
                dropObjectTask, phoneClickedTask, notebookClickedTask)
            .ToCoroutine();
        cancellationTokenSource.Cancel();

        Debug.Log("@interact command ended, whose choices are:");
        foreach (var choice in choices) Debug.Log("_ " + choice.Text);
        yield break;

        void TakeChoice(string choiceText, StoryStateConstant? storyState = null)
        {
            // asked to interact with character: take the given choice
            var choice = choices.FirstOrDefault(choice => choice.Text == choiceText);
            if (choice.Text == null)
                throw new Exception(
                    $"Cannot find an interaction choice in Ink named {choiceText}; available choices are: " +
                    string.Join(", ", choices.Select(c => c.Text)));

            // if (storyState != null) currentStoryState.Value = storyState.Value;
            currentStoryState.Value = storyState != null ? storyState.Value : previousStoryState;

            availableInteractionsEvent.Raise(AvailableInteractions.EmptyAvailableInteractions);
            context.TakeChoice(choice.Index);
        }
    }
}