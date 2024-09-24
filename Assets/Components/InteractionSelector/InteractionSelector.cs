using NUnit.Framework;
using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace Components.InteractionSelector
{
    enum Interaction
    {
        Exit
    }
    
    public class InteractionSelector : MonoBehaviour
    {
        [SerializeField] private Animator animator;
        [SerializeField] private Interaction interaction;
        [SerializeField] private string interactionKey;
        [SerializeField] private StringEvent interactionExitEvent;
        private int _hoveredHash = -1;

        private void Awake()
        {
            _hoveredHash = Animator.StringToHash("Hovered");
            Assert.IsNotNull(animator);
            Assert.IsNotNull(interactionExitEvent);
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
                default:
                    Debug.LogError($"Unknown interaction {interaction}");
                    break;
            }
        }
    }
}
