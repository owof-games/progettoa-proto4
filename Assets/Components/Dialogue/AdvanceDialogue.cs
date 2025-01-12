using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace Components.Dialogue
{
    public class AdvanceDialogue : MonoBehaviour
    {
        [SerializeField] private StringEvent continueEvent;
        [SerializeField] private ChosenChoiceEvent chosenChoiceEvent;
        [SerializeField] private StoryStepVariable storyStep;


        // Update is called once per frame
        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.Space))
            {
                Balloon.MoveNext();
            }
        }
    }
}