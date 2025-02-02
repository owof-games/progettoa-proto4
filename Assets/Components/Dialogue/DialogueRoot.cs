using System;
using System.Collections.Generic;
using System.Linq;
using Components.Character;
using Components.RoomTransitionHandler;
using Components.Story.Lines;
using LemuRivolta.InkAtoms;
using LitMotion;
using UnityAtoms.BaseAtoms;
using UnityEditor;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Components.Dialogue
{
    public class DialogueRoot : MonoBehaviour
    {
        [SerializeField] private RectTransform dialogueSlidingContainer;
        [SerializeField] private GameObject dialogueRowPrefab;
        [SerializeField] private float slideDuration = 0.1f;
        [SerializeField] private ChosenChoiceEvent chosenChoiceEvent;
        [SerializeField] private RoomTransitionHandler.RoomTransitionHandler roomTransitionHandler;
        [SerializeField] private CanvasGroup canvasGroup;

        [SerializeField] private StoryStateConstant storyStateTalking;
        [SerializeField] private int choicesTotalLengthBreakpoint = 180;

        private readonly List<Character.Character>[] _characterColumns =
            { new(), new(), new() };

        private readonly Dictionary<int, int> _columnRemapper = new()
        {
            {
                0, 2
            },
            {
                1, 1
            },
            {
                2, 3
            },
            {
                -1, 0
            },
            {
                3, 4
            }
        };

        private void Awake()
        {
            Assert.IsNotNull(dialogueSlidingContainer);
            Assert.IsNotNull(dialogueRowPrefab);
            Assert.IsNotNull(chosenChoiceEvent);
            Assert.IsNotNull(roomTransitionHandler);
        }

        private void Update()
        {
            var dialoguesHeight =
                LayoutUtility.GetPreferredHeight(dialogueSlidingContainer); // dialogueSlidingContainer.rect.height;
            var myHeight = ((RectTransform)transform).rect.height;
            if (dialoguesHeight > myHeight)
            {
                var delta = dialoguesHeight - myHeight;
                SlideDialogueContainer(delta);
            }
        }

#if UNITY_EDITOR
        private void OnValidate()
        {
            if (!dialogueSlidingContainer) dialogueSlidingContainer = transform.GetChild(0) as RectTransform;

            if (!dialogueRowPrefab)
                dialogueRowPrefab =
                    AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Components/Dialogue/DialogueRow.prefab");

            if (!roomTransitionHandler)
                roomTransitionHandler =
                    FindObjectsByType<RoomTransitionHandler.RoomTransitionHandler>(FindObjectsInactive.Exclude,
                        FindObjectsSortMode.None)[0];
        }
#endif

        private void SlideDialogueContainer(float delta)
        {
            var currY = dialogueSlidingContainer.anchoredPosition.y;
            LMotion.Create(currY, delta, slideDuration)
                .WithEase(Ease.Linear)
                .Bind(value => dialogueSlidingContainer.anchoredPosition = new Vector2(
                    dialogueSlidingContainer.anchoredPosition.x,
                    value))
                .AddTo(dialogueSlidingContainer.gameObject);
        }

        public void OnDialogueLine(DialogueLine dialogueLine)
        {
            var character = dialogueLine.character;

            int column;
            for (column = 0; column < _characterColumns.Length; column++)
                if (_characterColumns[column].Contains(character))
                    break;

            if (column >= _characterColumns.Length)
            {
                // skip column with the nearest x as this character, otherwise the balloon looks weird when it's directly
                // over a character's head
                var characterGameObject =
                    FindObjectsByType<CharacterName>(FindObjectsInactive.Exclude, FindObjectsSortMode.None)
                        .FirstOrDefault(characterName => characterName.Character == character)
                        ?.gameObject;
                var skippedColumn = -1;
                var skippedColumnDistanceFromCharacter = float.MaxValue;
                if (characterGameObject || character == Character.Character.Anonymous
                   )
                {
                    if (character != Character.Character.Anonymous)
                    {
                        var thisCharacterGameObjectXCenter =
                            Camera.main!.WorldToScreenPoint(characterGameObject.transform.position).x;
                        for (var tentativeColumn = 0; tentativeColumn < 3; tentativeColumn++)
                        {
                            var thisBalloonXCenter =
                                Screen.width * _columnRemapper[tentativeColumn] / 5 + Screen.width / 10;
                            var distance = Mathf.Abs(thisCharacterGameObjectXCenter - thisBalloonXCenter);
                            if (distance < skippedColumnDistanceFromCharacter)
                            {
                                skippedColumn = tentativeColumn;
                                skippedColumnDistanceFromCharacter = distance;
                            }
                        }
                    }

                    // find a free column
                    var selectedColumn = _characterColumns
                        .Where((_, index) => index != skippedColumn)
                        .MinBy(cc => cc.Count);
                    selectedColumn.Add(character);
                    column = Array.IndexOf(_characterColumns, selectedColumn);
                }
                else
                {
                    Debug.Log("Character not in scene");
                    var direction = roomTransitionHandler.GetDirection(character);
                    column = direction == Direction.Left ? -1 : 3;
                }
            }

            OnText(character, dialogueLine.text, dialogueLine.canContinue, column, dialogueLine.choices);
        }

        private void OnText(Character.Character character, string text, bool showAdvance, int column,
            Choice[] choices = null)
        {
            // if (!string.IsNullOrEmpty(text))
            // {
            var dialogueRow = CreateAndGetDialogueRow();

            void OnDone()
            {
                if (choices is not { Length: > 0 }) return;
                var choicesDialogueRow = CreateAndGetDialogueRow();
                var choicesArray = (from choice in choices
                    let choiceText = choice.text
                    let finalText = (choiceText.ToLower().StartsWith("ettore:")
                        ? choiceText["ettore:".Length..]
                        : choiceText).Trim()
                    select finalText).ToArray();
                choicesDialogueRow.SetUp(Character.Character.Ettore, 2, null, false, choicesArray,
                    choicesArray.Select(c => c.Length).Sum() < choicesTotalLengthBreakpoint);
                choicesDialogueRow.ChoiceTaken += choiceIndex =>
                {
                    var choice = choices[choiceIndex];
                    chosenChoiceEvent.Raise(new ChosenChoice { ChoiceIndex = choice.index, FlowName = null });
                };
            }

            if (text == "")
                OnDone();
            else
                dialogueRow.SetUp(character, _columnRemapper[column], text, showAdvance, onDone: OnDone);
            // }
        }

        private DialogueRow CreateAndGetDialogueRow()
        {
            // should not be necessary, but it is
            if (dialogueSlidingContainer.childCount == 0)
                dialogueSlidingContainer.anchoredPosition = new Vector2(
                    dialogueSlidingContainer.anchoredPosition.x,
                    0);

            var dialogueRowGameObject = Instantiate(dialogueRowPrefab, dialogueSlidingContainer);
            var dialogueRow = dialogueRowGameObject.GetComponent<DialogueRow>();
            return dialogueRow;
        }

        public void StoryStateChanged(StoryState newStoryState)
        {
            if (newStoryState.Equals(storyStateTalking.Value)) return;

            foreach (RectTransform row in dialogueSlidingContainer) Destroy(row.gameObject);

            SlideDialogueContainer(0);
        }

        public void OnNumCharactersMovingChanged(int numCharactersMoving)
        {
            canvasGroup.interactable = numCharactersMoving == 0;
        }
    }
}