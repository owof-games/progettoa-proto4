using System;
using System.Collections;
using Components.RoomTransitionHandler;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Components.Balloon
{
    public class Balloon : MonoBehaviour
    {
        [SerializeField] private BalloonData balloonData;
        [SerializeField] private Image backgroundImage;
        [SerializeField] private TextMeshProUGUI textMeshProUGUI;

        private IEnumerator Start()
        {
            yield return new WaitForSeconds(1f);
            SetUp(Character.Character.Paola, Direction.Left);
            SetText("Questo è del testo dove sono <happy>felice</happy>!");
        }

        public void SetUp(Character.Character character, Direction direction)
        {
            var characterInfo = balloonData.GetCharacterInfo(character);
            backgroundImage.sprite = characterInfo.backgroundSprite;
            textMeshProUGUI.color = characterInfo.hasLightBackground
                ? balloonData.TextColorForLightBackground
                : balloonData.TextColorForDarkBackground;

            if (direction == Direction.Left)
            {
                // default is left; switch left and right margins
                var margin = textMeshProUGUI.margin;
                var leftMargin = margin.x;
                margin.z = margin.x;
                margin.z = leftMargin;
                textMeshProUGUI.margin = margin;
            }
        }

        public void SetText(string text)
        {
            textMeshProUGUI.text = text;
        }
    }
}