using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;

namespace Components.DebugCanvas
{
    public class DebugCanvas : MonoBehaviour
    {
        [SerializeField] private GameObject container;
        [SerializeField] private TextMeshProUGUI versionTextMeshPro;

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        private void Start()
        {
            container.SetActive(false);
        }

        public void OnDebugToggle(InputAction.CallbackContext _)
        {
            container.SetActive(!container.activeSelf);
            versionTextMeshPro.text = $"Version: {Application.version}";
        }
    }
}