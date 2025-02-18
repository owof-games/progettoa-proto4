using LemuRivolta.InkAtoms;
using TMPro;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Tests
{
    public class TemporaryPrintTime : MonoBehaviour
    {
        [SerializeField] private IntVariable currentTime;
        [SerializeField] private InkAtomsStoryVariable inkAtomsStoryChanged;
        [SerializeField] private TextMeshProUGUI tmProText;

        private InkAtomsStory _inkAtomsStory;

        private void Awake()
        {
            Assert.IsNotNull(currentTime);
            Assert.IsNotNull(inkAtomsStoryChanged);
            Assert.IsNotNull(tmProText);
        }

        private void OnEnable()
        {
            currentTime.Changed.Register(OnCurrentTimeChanged);
            inkAtomsStoryChanged.Changed.Register(OnInkAtomsStoryChanged);
            UpdateTime();
        }

        private void OnDisable()
        {
            currentTime.Changed.Unregister(OnCurrentTimeChanged);
        }

        private void OnInkAtomsStoryChanged(InkAtomsStory inkAtomsStory)
        {
            _inkAtomsStory = inkAtomsStory;
            UpdateTime();
        }

        private void OnCurrentTimeChanged(int obj)
        {
            UpdateTime();
        }

        private void UpdateTime()
        {
            if (!_inkAtomsStory) return;
            var time = (string)_inkAtomsStory.Call("print_time", out _);
            tmProText.text = time;
        }
    }
}