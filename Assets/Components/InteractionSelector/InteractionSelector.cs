using System.Linq;
using UnityAtoms.BaseAtoms;
using UnityEditor;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.InteractionSelector
{
    public enum Interaction
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
        [SerializeField] private StoryStateVariable currentStoryState;
        [SerializeField] private StoryStateConstant storyStateInteracting;
        private int _hoveredHash = -1;
        private bool _isInteractionEnabled = false;
        private bool _mouseInside = false;

        private void Awake()
        {
            _hoveredHash = Animator.StringToHash("Hovered");
            Assert.IsNotNull(animator);
            Assert.IsNotNull(interactionExitEvent);
            Assert.IsNotNull(interactionCharacterEvent);
            Assert.IsNotNull(currentStoryState);
            Assert.IsNotNull(storyStateInteracting);
            Assert.IsFalse(string.IsNullOrWhiteSpace(interactionKey));
        }

        private void OnMouseEnter()
        {
            if (currentStoryState.Value.Equals(storyStateInteracting.Value))
                _mouseInside = true; //animator.SetBool(_hoveredHash, true);
            UpdateAnimationStatus();
        }

        private void OnMouseExit()
        {
            if (currentStoryState.Value.Equals(storyStateInteracting.Value))
                _mouseInside = false; // animator.SetBool(_hoveredHash, false);
            UpdateAnimationStatus();
        }

        private void OnMouseUp()
        {
            if (!_isInteractionEnabled) return;
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

        public void OnAvailableInteractionsChanged(AvailableInteractions availableInteractions)
        {
            _isInteractionEnabled = availableInteractions.availableInteractions.Any(availableInteraction =>
                availableInteraction.interaction == interaction &&
                availableInteraction.key == interactionKey);
            UpdateAnimationStatus();
        }

        private void UpdateAnimationStatus()
        {
            animator.SetBool(_hoveredHash, _mouseInside && _isInteractionEnabled);
        }

#if UNITY_EDITOR
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

            if (!currentStoryState)
                currentStoryState =
                    AssetDatabase.LoadAssetAtPath<StoryStateVariable>(
                        "Assets/Components/Story/Lines/Current Story State.asset");

            if (!storyStateInteracting)
                storyStateInteracting =
                    AssetDatabase.LoadAssetAtPath<StoryStateConstant>(
                        "Assets/Components/Story/Lines/Story State Interacting.asset");
        }
#endif
    }
}