using System.Linq;
using UnityEngine;

namespace Components.Balloon
{
    [CreateAssetMenu(fileName = "BalloonData", menuName = "Scriptable Objects/BalloonData")]
    public class BalloonData : ScriptableObject
    {
        [System.Serializable]
        public struct CharacterInfo
        {
            public Character.Character character;
            public bool hasLightBackground;
            public Sprite backgroundSprite;
        }

        [SerializeField] private CharacterInfo[] allCharacterInfo;
        [SerializeField] private Color textColorForLightBackground = Color.black;
        [SerializeField] private Color textColorForDarkBackground = Color.white;

        public CharacterInfo GetCharacterInfo(Character.Character character)
        {
            return allCharacterInfo.Single(characterInfo => characterInfo.character == character);
        }

        public Color TextColorForLightBackground => textColorForLightBackground;
        public Color TextColorForDarkBackground => textColorForDarkBackground;
    }
}
