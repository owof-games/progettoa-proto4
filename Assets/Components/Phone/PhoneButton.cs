using System.Linq;
using Components.InteractionSelector;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Components.Phone
{
    public class PhoneButton : MonoBehaviour
    {
        [SerializeField] private Image phoneImage;
        [SerializeField] private Button phoneButton;
        [SerializeField] private VoidEvent phoneClickedEvent;
        private bool _activePhone;

        private void Awake()
        {
            Assert.IsNotNull(phoneClickedEvent);
        }

        private void Start()
        {
            UpdateActivePhone();
        }

        private void OnValidate()
        {
            if (!phoneImage) phoneImage = GetComponent<Image>();

            if (!phoneButton) phoneButton = GetComponent<Button>();
        }

        public void OnActivePhoneChanged(bool newValue)
        {
            _activePhone = newValue;
            UpdateActivePhone();
        }

        private void UpdateActivePhone()
        {
            phoneImage.enabled = _activePhone;
            phoneButton.enabled = _activePhone;
        }

        public void RaisePhoneClickedEvent()
        {
            phoneClickedEvent.Raise();
        }

        public void OnAvailableInteractionsChanged(AvailableInteractions availableInteractions)
        {
            phoneButton.interactable =
                availableInteractions.availableInteractions.Any(i => i.interaction == Interaction.Phone);
        }
    }
}