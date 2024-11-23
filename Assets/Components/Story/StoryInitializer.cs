using Components.Story.Lines;
using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Components.Story
{
    public class StoryInitializer : MonoBehaviour
    {
        [SerializeField] private InkAtomsStory inkAtomsStory;
        [SerializeField] private TextAsset inkAtomsTextAsset;
        [SerializeField] private StringEvent continueEvent;
        [SerializeField] private bool startStoryImmediately;
        [SerializeField] private Button startStoryButton;
        [SerializeField] private StoryStepEvent storyStepEvent;
        [SerializeField] private LinesParser linesParser;

        private void Awake()
        {
            Assert.IsNotNull(inkAtomsStory);
            Assert.IsNotNull(inkAtomsTextAsset);
            Assert.IsNotNull(continueEvent);
            Assert.IsNotNull(storyStepEvent);
        }

        private void Start()
        {
            if (!startStoryImmediately)
            {
                // Debug.Log("Not starting story immediately");
                startStoryButton.onClick.AddListener(DoStart);
            }
            else
            {
                // Debug.Log("Starting story immediately");
                startStoryButton.gameObject.SetActive(false);
                DoStart();
            }
        }

        private void DoStart()
        {
            startStoryButton.gameObject.SetActive(false);
            linesParser.Initialize(storyStepEvent);
            inkAtomsStory.StartStory(inkAtomsTextAsset, exception => Debug.LogError(exception.ToString()));
            continueEvent.Raise(null);
        }
    }
}