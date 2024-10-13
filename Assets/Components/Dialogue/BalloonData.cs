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

        public Color TextColorForLightBackground => textColorForLightBackground;
        public Color TextColorForDarkBackground => textColorForDarkBackground;

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