using TMPro;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Tests
{
    public class TemporaryPrintTime : MonoBehaviour
    {
        [SerializeField] private IntVariable currentTime;
        [SerializeField] private TextMeshProUGUI tmProText;

        private void Awake()
        {
            Assert.IsNotNull(currentTime);
            Assert.IsNotNull(tmProText);
        }

        private void OnEnable()
        {
            currentTime.Changed.Register(OnCurrentTimeChanged);
            UpdateTime();
        }

        private void OnDisable()
        {
            currentTime.Changed.Unregister(OnCurrentTimeChanged);
        }

        private void OnCurrentTimeChanged(int obj)
        {
            Debug.Log("new value:" + obj);
            UpdateTime();
        }

        private void UpdateTime()
        {
            var minutes = currentTime.Value / 60;
            var seconds = currentTime.Value % 60;
            tmProText.text = minutes.ToString("00") + ":" + seconds.ToString("00");
        }
    }
}