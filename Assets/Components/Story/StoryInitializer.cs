using LemuRivolta.InkAtoms;
using NUnit.Framework;
using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace Components.Story
{
    public class StoryInitializer : MonoBehaviour
    {
        [SerializeField] private InkAtomsStory inkAtomsStory;
        [SerializeField] private TextAsset inkAtomsTextAsset;
        [SerializeField] private StringEvent continueEvent;

        private void Awake()
        {
            Assert.IsNotNull(inkAtomsStory);
            Assert.IsNotNull(inkAtomsTextAsset);
            Assert.IsNotNull(continueEvent);
        }

        private void Start()
        {
            inkAtomsStory.StartStory(inkAtomsTextAsset, exception => Debug.LogError(exception.ToString()));
            continueEvent.Raise(null);
        }
    }
}