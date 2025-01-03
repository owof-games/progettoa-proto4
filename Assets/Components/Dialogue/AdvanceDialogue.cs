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
        [SerializeField] private IntReference numCharactersMoving;


        // Update is called once per frame
        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.Space) && storyStateTalking.Value.Equals(currentStoryState.Value) &&
                numCharactersMoving.Value == 0)
            {
                var s = storyStep.Value;
                if (s.CanContinue)
                    continueEvent.Raise(null);
                else if (Balloon.CurrentBalloonWithChoices != null)
                    Balloon.CurrentBalloonWithChoices.TakeChoice(0);
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