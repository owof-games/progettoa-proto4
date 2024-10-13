using Components.Balloon;
using Components.RoomTransitionHandler;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace Components.Dialogue
{
    public class Balloon : MonoBehaviour
    {
        [SerializeField] private BalloonData balloonData;
        [SerializeField] private Image backgroundImage;
        [SerializeField] private TextMeshProUGUI textMeshProUGUI;

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
                (margin.x, margin.z) = (margin.z, margin.x);
                textMeshProUGUI.margin = margin;
                // also reflect the sprite
                backgroundImage.transform.localScale = new Vector3(-1, 1, 1);
            }
        }

        public void SetText(string text)
        {
            textMeshProUGUI.text = text;
        }
    }
}