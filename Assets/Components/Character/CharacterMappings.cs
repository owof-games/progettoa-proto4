using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace Components.Character
{
    public enum Character
    {
        Paola,
        Elia,
        Zeca,
        Matteo,
        Greta,
        Ettore
    }

    [CreateAssetMenu(fileName = "CharacterMappings", menuName = "Scriptable Objects/CharacterMappings")]
    public class CharacterMappings : ScriptableObject
    {
        [SerializeField] private List<CharacterMapping> characterMappings;

        public GameObject GetCharacterPrefab(Character character)
        {
            return characterMappings.Single(ch => ch.character == character).prefab;
        }

        [Serializable]
        public struct CharacterMapping
        {
            public Character character;
            public GameObject prefab;
        }
    }
}