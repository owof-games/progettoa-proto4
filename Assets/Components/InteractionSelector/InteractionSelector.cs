using UnityAtoms.BaseAtoms;
using UnityEditor;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.InteractionSelector
{
    internal enum Interaction
    {
        Exit,
        Character
    }

    public class InteractionSelector : MonoBehaviour
    {
        [SerializeField] private Animator animator;
        [SerializeField] private Interaction interaction;
        [SerializeField] private string interactionKey;
        [SerializeField] private StringEvent interactionExitEvent;
        [SerializeField] private StringEvent interactionCharacterEvent;
        private int _hoveredHash = -1;

        private void Awake()
        {
            _hoveredHash = Animator.StringToHash("Hovered");
            Assert.IsNotNull(animator);
            Assert.IsNotNull(interactionExitEvent);
            Assert.IsNotNull(interactionCharacterEvent);
            Assert.IsFalse(string.IsNullOrWhiteSpace(interactionKey));
        }

        private void OnMouseEnter()
        {
            animator.SetBool(_hoveredHash, true);
        }

        private void OnMouseExit()
        {
            animator.SetBool(_hoveredHash, false);
        }

        private void OnMouseUp()
        {
            switch (interaction)
            {
                case Interaction.Exit:
                    interactionExitEvent.Raise(interactionKey);
                    break;
                case Interaction.Character:
                    interactionCharacterEvent.Raise(interactionKey);
                    break;
                default:
                    Debug.LogError($"Unknown interaction {interaction}");
                    break;
            }
        }

        private void OnValidate()
        {
            if (!interactionExitEvent)
                interactionExitEvent =
                    AssetDatabase.LoadAssetAtPath<StringEvent>(
                        "Assets/Components/Story/Interact/InteractExitEvent.asset");

            if (!interactionCharacterEvent)
                interactionCharacterEvent =
                    AssetDatabase.LoadAssetAtPath<StringEvent>(
                        "Assets/Components/Story/Interact/InteractCharacterEvent.asset");
        }
    }
}