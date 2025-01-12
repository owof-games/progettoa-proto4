using System;
using Components.Balloon;
using Components.RoomTransitionHandler;
using Febucci.UI.Core;
using JetBrains.Annotations;
using TMPro;
using UnityAtoms.BaseAtoms;
using UnityEditor;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Components.Dialogue
{
    public class Balloon : MonoBehaviour
    {
        // the current balloon if it has choices, or null if there's no current balloon or if it has no choices
        // see AdvanceDialogue
        [CanBeNull] public static Balloon CurrentBalloonWithChoices;
        [CanBeNull] public static Balloon CurrentBalloon;
        [SerializeField] private BalloonData balloonData;
        [SerializeField] private Image backgroundImage;
        [SerializeField] private TextMeshProUGUI textMeshProUGUI;
        [SerializeField] private GameObject advanceButton;
        [SerializeField] private StringEvent continueEvent;
        [SerializeField] private GameObject singleChoicePrefab;
        [SerializeField] private RectTransform choicesContainer;
        [SerializeField] private RectTransform container;
        [SerializeField] private LayoutElement layoutElement;
        [SerializeField] private StoryStateConstant storyStateTalking;
        [SerializeField] private StoryStateVariable currentStoryState;
        [SerializeField] private IntReference numCharactersMoving;
        private SingleChoice _currentChoice;

        private bool _isWriting;
        private Action _onDone;

        private bool _shouldShowAdvanceButton;
        private bool _showAdvance;

        private void Awake()
        {
            Assert.IsNotNull(advanceButton);
            Assert.IsNotNull(continueEvent);
            Assert.IsNotNull(container);
            Assert.IsNotNull(layoutElement);
        }

#if UNITY_EDITOR
        private void OnValidate()
        {
            if (!advanceButton) advanceButton = transform.Find("Advance Button").gameObject;
            if (!layoutElement) layoutElement = GetComponent<LayoutElement>();

            if (!storyStateTalking)
                storyStateTalking =
                    AssetDatabase.LoadAssetAtPath<StoryStateConstant>(
                        "Assets/Components/Story/Lines/StoryStateTalking.asset");

            if (!currentStoryState)
                currentStoryState =
                    AssetDatabase.LoadAssetAtPath<StoryStateVariable>(
                        "Assets/Components/Story/Lines/CurrentStoryState.asset");

            if (!continueEvent)
                continueEvent =
                    AssetDatabase.LoadAssetAtPath<StringEvent>(
                        "Assets/Components/Story/Ink Atoms Story - Continue Event.asset");
        }
#endif

        public void SetUp(Character.Character character, Direction direction, [CanBeNull] string[] choices = null,
            bool smallChoices = true, Action onDone = null)
        {
            var characterInfo = balloonData.GetCharacterInfo(character);
            var hasChoices = choices is { Length: > 0 };
            backgroundImage.sprite = hasChoices && smallChoices ? balloonData.SmallChoiceBackgroundSprite :
                hasChoices /* && !smallChoices */ ? balloonData.BigChoiceBackgroundSprite :
                characterInfo.backgroundSprite;
            textMeshProUGUI.color = characterInfo.hasLightBackground
                ? balloonData.TextColorForLightBackground
                : balloonData.TextColorForDarkBackground;
            var height = hasChoices && !smallChoices ? balloonData.BigHeight : balloonData.SmallHeight;
            layoutElement.minHeight = height;
            layoutElement.preferredHeight = height;
            layoutElement.flexibleHeight = height;

            // NOTE: this is a demo, let's ignore balloon flipping
            // if (direction == Direction.Left)
            // {
            //     // default is left; switch left and right margins (it's enough to reflect anchored position)
            //     var anchoredPosition = container.anchoredPosition;
            //     anchoredPosition.x = -container.anchoredPosition.x;
            //     container.anchoredPosition = anchoredPosition;
            //     // also reflect the sprite
            //     backgroundImage.transform.localScale = new Vector3(-1, 1, 1);
            // }

            if (hasChoices)
            {
                var choiceIndex = 0;
                SingleChoice sc = null;
                foreach (var choice in choices)
                {
                    var singleChoice = CreateSingleChoice(choice, choiceIndex);
                    if (sc == null) sc = singleChoice;

                    choiceIndex++;
                }

                _showAdvance = false;
                CurrentBalloonWithChoices = this;
                _currentChoice = sc;
            }
            else
            {
                _showAdvance = true;
                CurrentBalloonWithChoices = null;
                _currentChoice = null;
            }

            _onDone = onDone;
            CurrentBalloon = this;
        }

        /// <summary>
        ///     Called to ask the current balloon (if any) to go to the end of the current balloon (if the text is running),
        ///     to move to the next balloon (if the text is at the end) or to pick the first choice (if there's a choice)
        /// </summary>
        public static void MoveNext()
        {
            CurrentBalloon?.MoveNextInternal();
        }

        public void MoveNextInternal()
        {
            if (!storyStateTalking.Value.Equals(currentStoryState.Value) || numCharactersMoving.Value > 0) return;

            if (_isWriting)
                GetComponentInChildren<TypewriterCore>().SkipTypewriter();
            else if (_currentChoice != null)
                _currentChoice.OnClick();
            else
                OnAdvanceButtonClick();
        }

        public void OnTextShowed()
        {
            _isWriting = false;
            _onDone?.Invoke();
            UpdateShowAdvanceButton();
        }

        public void OnTypewriterStart()
        {
            _isWriting = true;
        }

        private SingleChoice CreateSingleChoice(string choice, int choiceIndex)
        {
            var singleChoiceInstance = Instantiate(singleChoicePrefab, choicesContainer);
            var singleChoice = singleChoiceInstance.GetComponent<SingleChoice>();
            singleChoice.SetText(choice);
            singleChoice.Register(() => TakeChoice(choiceIndex));
            if (choiceIndex == 0) singleChoice.Focus();
            return singleChoice;
        }

        public void SetText(string text)
        {
            if (!string.IsNullOrEmpty(text))
                textMeshProUGUI.text = text;
            else
                textMeshProUGUI.gameObject.SetActive(false);
        }

        public void ShowAdvanceButton(bool show = true)
        {
            if (!_showAdvance && show) return;
            _shouldShowAdvanceButton = show;
        }

        private void UpdateShowAdvanceButton()
        {
            advanceButton.SetActive(_shouldShowAdvanceButton);
        }

        public void OnAdvanceButtonClick()
        {
            ShowAdvanceButton(false);
            continueEvent.Raise(null);
        }

        public event Action<int> ChoiceTaken;

        public void TakeChoice(int choiceIndex)
        {
            // Debug.Log($"Choice taken: {choiceIndex}");
            CurrentBalloonWithChoices = null;
            ChoiceTaken?.Invoke(choiceIndex);
        }
    }
}