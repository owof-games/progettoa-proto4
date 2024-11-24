using System;
using Components.Balloon;
using Components.RoomTransitionHandler;
using JetBrains.Annotations;
using TMPro;
using UnityAtoms.BaseAtoms;
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
        [SerializeField] private BalloonData balloonData;
        [SerializeField] private Image backgroundImage;
        [SerializeField] private TextMeshProUGUI textMeshProUGUI;
        [SerializeField] private GameObject advanceButton;
        [SerializeField] private StringEvent continueEvent;
        [SerializeField] private GameObject singleChoicePrefab;
        [SerializeField] private RectTransform choicesContainer;
        [SerializeField] private RectTransform container;
        [SerializeField] private LayoutElement layoutElement;
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
        }
#endif

        public void SetUp(Character.Character character, Direction direction, [CanBeNull] string[] choices = null,
            bool smallChoices = true)
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
                foreach (var choice in choices)
                {
                    CreateSingleChoice(choice, choiceIndex);
                    choiceIndex++;
                }

                _showAdvance = false;
                CurrentBalloonWithChoices = this;
            }
            else
            {
                _showAdvance = true;
                CurrentBalloonWithChoices = null;
            }
        }

        private void CreateSingleChoice(string choice, int choiceIndex)
        {
            var singleChoiceInstance = Instantiate(singleChoicePrefab, choicesContainer);
            var singleChoice = singleChoiceInstance.GetComponent<SingleChoice>();
            singleChoice.SetText(choice);
            singleChoice.Register(() => TakeChoice(choiceIndex));
            if (choiceIndex == 0) singleChoice.Focus();
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
            advanceButton.SetActive(show);
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