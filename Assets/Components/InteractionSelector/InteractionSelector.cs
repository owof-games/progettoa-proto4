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
        Character,
        Object
    }

    public class InteractionSelector : MonoBehaviour
    {
        [SerializeField] private Animator animator;
        [SerializeField] private Interaction interaction;
        [SerializeField] private string interactionKey;
        [SerializeField] private StringEvent interactionExitEvent;
        [SerializeField] private StringEvent interactionCharacterEvent;
        [SerializeField] private StringEvent interactionObjectEvent;
        [SerializeField] private StoryStateVariable currentStoryState;
        [SerializeField] private StoryStateConstant storyStateInteracting;
        private int _hoveredHash = -1;
        private bool _isInteractionEnabled = false;
        private bool _mouseInside = false;
        public string InteractionKey => interactionKey;

        private void Awake()
        {
            _hoveredHash = Animator.StringToHash("Hovered");
            Assert.IsNotNull(animator);
            Assert.IsNotNull(interactionExitEvent);
            Assert.IsNotNull(interactionCharacterEvent);
            Assert.IsNotNull(interactionObjectEvent);
            Assert.IsNotNull(currentStoryState);
            Assert.IsNotNull(storyStateInteracting);
            Assert.IsFalse(string.IsNullOrWhiteSpace(interactionKey));
        }

        private void OnMouseEnter()
        {
            if (currentStoryState.Value.Equals(storyStateInteracting.Value))
                _mouseInside = true;
            UpdateAnimationStatus();
        }

        private void OnMouseExit()
        {
            if (currentStoryState.Value.Equals(storyStateInteracting.Value))
                _mouseInside = false;
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
                case Interaction.Object:
                    interactionObjectEvent.Raise(interactionKey);
                    break;
                default:
                    Debug.LogError($"Unknown interaction {interaction}");
                    break;
            }
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

            if (!interactionObjectEvent)
                interactionObjectEvent =
                    AssetDatabase.LoadAssetAtPath<StringEvent>(
                        "Assets/Components/Story/Interact/InteractObjectEvent.asset");

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

        public void OnAvailableInteractionsChanged(AvailableInteractions availableInteractions)
        {
            _isInteractionEnabled = availableInteractions.availableInteractions.Any(availableInteraction =>
                availableInteraction.interaction == interaction &&
                availableInteraction.key == interactionKey);
            Debug.Log($"interaction selector di {gameObject.name} vale {_isInteractionEnabled}", this);
            UpdateAnimationStatus();
        }

        private void UpdateAnimationStatus()
        {
            animator.SetBool(_hoveredHash, _mouseInside && _isInteractionEnabled);
        }
    }
}