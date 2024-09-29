using UnityEngine;

namespace Components.Character
{
    public class CharacterName : MonoBehaviour
    {
        [SerializeField] private Character character;

        public Character Character => character;
    }
}