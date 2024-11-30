using UnityEngine;
using UnityEngine.UI;

namespace Components.Phone
{
    public class PhoneButton : MonoBehaviour
    {
        [SerializeField] private Image phoneImage;
        [SerializeField] private Button phoneButton;
        private bool _activePhone;

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
    }
}