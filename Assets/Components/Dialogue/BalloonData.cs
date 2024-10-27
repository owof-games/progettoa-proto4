using System;
using System.Linq;
using UnityEngine;

namespace Components.Balloon
{
    [CreateAssetMenu(fileName = "BalloonData", menuName = "Scriptable Objects/BalloonData")]
    public class BalloonData : ScriptableObject
    {
        [SerializeField] private CharacterInfo[] allCharacterInfo;
        [SerializeField] private Color textColorForLightBackground = Color.black;
        [SerializeField] private Color textColorForDarkBackground = Color.white;
        [SerializeField] private Sprite smallChoiceBackgroundSprite;
        [SerializeField] private Sprite bigChoiceBackgroundSprite;
        [SerializeField] private float smallHeight = 260;

        public Color TextColorForLightBackground => textColorForLightBackground;
        public Color TextColorForDarkBackground => textColorForDarkBackground;

        public Sprite SmallChoiceBackgroundSprite => smallChoiceBackgroundSprite;
        public Sprite BigChoiceBackgroundSprite => bigChoiceBackgroundSprite;
        public float SmallHeight => smallHeight;

        public float BigHeight => bigChoiceBackgroundSprite.bounds.size.y *
            smallHeight / smallChoiceBackgroundSprite.bounds.size.y;

        public CharacterInfo GetCharacterInfo(Character.Character character)
        {
            return allCharacterInfo.Single(characterInfo => characterInfo.character == character);
        }

        [Serializable]
        public struct CharacterInfo
        {
            public Character.Character character;
            public bool hasLightBackground;
            public Sprite backgroundSprite;
        }
    }
}