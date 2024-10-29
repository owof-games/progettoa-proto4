using Components.Story.Lines;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Character
{
    public class CharacterTalkingOutline : MonoBehaviour
    {
        [SerializeField] private CharacterName characterName;
        [SerializeField] private Animator animator;
        [SerializeField] private StoryStateConstant storyStateTalking;

        private int _talkingHash = -1;

        private void Awake()
        {
            Assert.IsNotNull(characterName);
            Assert.IsNotNull(animator);
            Assert.IsNotNull(storyStateTalking);
            _talkingHash = Animator.StringToHash("Talking");
        }

#if UNITY_EDITOR
        private void OnValidate()
        {
            characterName = GetComponent<CharacterName>();
        }
#endif

        public void OnDialogueLine(DialogueLine dialogueLine)
        {
            // highlight this character as talking only when a dialogue line is emitted from this character
            animator.SetBool(_talkingHash, dialogueLine.character == characterName.Character);
        }

        public void OnStoryState(StoryState storyState)
        {
            // disable any talking outline when we exit the dialogue state
            if (!storyState.Equals(storyStateTalking.Value)) animator.SetBool(_talkingHash, false);
        }
    }
}