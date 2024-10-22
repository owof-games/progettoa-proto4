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
        [SerializeField] private StoryStateVariable currentStoryState;
        [SerializeField] private StoryStateConstant storyStateInteracting;
        private int _hoveredHash = -1;

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
            if (currentStoryState.Value.Equals(storyStateInteracting.Value)) animator.SetBool(_hoveredHash, true);
        }

        private void OnMouseExit()
        {
            if (currentStoryState.Value.Equals(storyStateInteracting.Value)) animator.SetBool(_hoveredHash, false);
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