using System;
using System.Collections.Generic;
using System.Linq;
using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Story.Lines
{
    [CreateAssetMenu(fileName = "LinesParser", menuName = "Scriptable Objects/LinesParser")]
    public class LinesParser : ScriptableObject
    {
        [SerializeField] private StoryStateVariable currentStoryState;

        [SerializeField] private StoryStateConstant storyStateTalking;
        [SerializeField] private StoryStateConstant storyStateInteracting;

        [SerializeField] private DialogueLineEvent dialogueLineEvent;

        [SerializeField] private StringEvent unparsableLineEvent;

        [SerializeField] private StringEvent continueEvent;

        private Dictionary<string, Character.Character> _charactersByLowercaseName;

        public void Initialize(StoryStepEvent storyStepEvent)
        {
            currentStoryState.Value = storyStateTalking.Value;
            Debug.Log(
                $"Ho impostato; currentStoryState.Value.Name={currentStoryState.Value.Name}, storyStateTalking.Value.Name={storyStateTalking.Value.Name}");

            Assert.IsNotNull(currentStoryState);
            Assert.IsNotNull(storyStateTalking);
            Assert.IsNotNull(storyStateInteracting);
            Assert.IsNotNull(dialogueLineEvent);
            Assert.IsNotNull(continueEvent);

            _charactersByLowercaseName = Enum
                .GetValues(typeof(Character.Character))
                .Cast<Character.Character>()
                .ToDictionary(character => character.ToString().ToLower(), character => character);

            storyStepEvent.Register(OnStoryStep);
        }

        public void OnStoryStep(StoryStep step)
        {
            if (step.CanContinue && string.IsNullOrWhiteSpace(step.Text))
            {
                Unparsable(step, "empty line");
                return;
            }

            if (currentStoryState.Value.Equals(storyStateTalking.Value))
            {
                var text = step.Text;
                var colonIndex = text.IndexOf(':');
                if (colonIndex < 0)
                {
                    Unparsable(step, "cannot find colon");
                    return;
                }

                var lowercaseCharacterName = text[..colonIndex].Trim().ToLower();
                if (!_charactersByLowercaseName.TryGetValue(lowercaseCharacterName, out var character))
                {
                    Unparsable(step, $"cannot find character {lowercaseCharacterName}");
                }

                var dialogueText = text[(colonIndex + 1)..].Trim();
                dialogueLineEvent.Raise(new DialogueLine
                {
                    character = character,
                    text = dialogueText,
                    canContinue = step.CanContinue,
                    choices = step.Choices.Select(c => new Choice
                    {
                        text = c.Text,
                        index = c.Index
                    }).ToArray()
                });
            }
        }

        private void Unparsable(StoryStep step, string reason)
        {
            var error = $"parse error: {reason} => {step.Text}";
            Debug.LogWarning(error);
            if (step.CanContinue)
                continueEvent.Raise(null);
            else if (step.Choices.Length > 0)
                // "fake" choice
                dialogueLineEvent.Raise(new DialogueLine
                {
                    character = Character.Character.Ettore,
                    text = "",
                    canContinue = step.CanContinue,
                    choices = step.Choices.Select(c => new Choice
                    {
                        text = c.Text,
                        index = c.Index
                    }).ToArray()
                });
            else
                Debug.LogWarning("Cannot skip unparsable line because story can't continue");

            if (!unparsableLineEvent) return;
            unparsableLineEvent.Raise(error);
        }
    }
}