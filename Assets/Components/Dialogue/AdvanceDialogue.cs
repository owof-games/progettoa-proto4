using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEditor;
using UnityEngine;

namespace Components.Dialogue
{
    public class AdvanceDialogue : MonoBehaviour
    {
        [SerializeField] private StoryStateConstant storyStateTalking;
        [SerializeField] private StoryStateVariable currentStoryState;
        [SerializeField] private StringEvent continueEvent;
        [SerializeField] private ChosenChoiceEvent chosenChoiceEvent;
        [SerializeField] private StoryStepVariable storyStep;


        // Update is called once per frame
        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.Space) && storyStateTalking.Value.Equals(currentStoryState.Value))
            {
                var s = storyStep.Value;
                if (s.CanContinue)
                    continueEvent.Raise(null);
                else if (s.Choices.Length > 0)
                    chosenChoiceEvent.Raise(new ChosenChoice
                    {
                        FlowName = null,
                        ChoiceIndex = s.Choices[0].Index
                    });
                else
                    Debug.LogError("Cannot advance after story end");
            }
        }

#if UNITY_EDITOR
        private void OnValidate()
        {
            if (!storyStateTalking)
                storyStateTalking =
                    AssetDatabase.LoadAssetAtPath<StoryStateConstant>(
                        "Assets/Components/Story/Lines/StoryStateTalking.asset");

            if (!currentStoryState)
                currentStoryState =
                    AssetDatabase.LoadAssetAtPath<StoryStateVariable>(
                        "Assets/Components/Story/Lines/CurrentStoryState.asset");

            if (!continueEvent)
                continueEvent =
                    AssetDatabase.LoadAssetAtPath<StringEvent>(
                        "Assets/Components/Story/Ink Atoms Story - Continue Event.asset");
        }
#endif
    }
}