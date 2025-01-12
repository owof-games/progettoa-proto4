using System;
using Cysharp.Threading.Tasks;
using LemuRivolta.InkAtoms;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;

namespace Components.DebugCanvas
{
    public class DebugCanvas : MonoBehaviour
    {
        [SerializeField] private GameObject container;
        [SerializeField] private TextMeshProUGUI gameNameTextMeshPro;
        [SerializeField] private TextMeshProUGUI versionTextMeshPro;
        [SerializeField] private TextMeshProUGUI sessionGuidTextMeshPro;
        [SerializeField] private Button copySessionGuidButton;
        [SerializeField] private TextMeshProUGUI copySessionGuidTextMeshProUGUI;
        [SerializeField] private TMP_InputField remoteLoggerInputField;

        private string _originalCopySessionGuidText;

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        private void Start()
        {
            container.SetActive(false);
            copySessionGuidButton.onClick.AddListener(OnCopySessionGuidClicked);
            remoteLoggerInputField.onValueChanged.AddListener(OnRemoteLoggerInputFieldValueChanged);
            _originalCopySessionGuidText = copySessionGuidTextMeshProUGUI.text;
        }

        private void OnRemoteLoggerInputFieldValueChanged(string text)
        {
            RemoteLogger.RemoteLogger.RemoteLoggerUrl = text;
        }

        private void OnCopySessionGuidClicked()
        {
            GUIUtility.systemCopyBuffer = RemoteLogger.RemoteLogger.SessionGuid;
            copySessionGuidTextMeshProUGUI.text = "session guid copied";
        }

        public void OnDebugToggle(InputAction.CallbackContext _)
        {
            if (container.activeSelf)
            {
                container.SetActive(false);
            }
            else
            {
                container.SetActive(true);
                gameNameTextMeshPro.text = "Game name: " + RemoteLogger.RemoteLogger.GameName;
                versionTextMeshPro.text = $"Version: {Application.version}";
                sessionGuidTextMeshPro.text = "Session GUID: " + RemoteLogger.RemoteLogger.SessionGuid;
                copySessionGuidButton.GetComponentInChildren<TextMeshProUGUI>().text = _originalCopySessionGuidText;
                remoteLoggerInputField.text = RemoteLogger.RemoteLogger.RemoteLoggerUrl;
            }
        }

        public void OnContinue(string flowName)
        {
            OnContinueAsync(flowName).Forget();
        }

        private static string GetFlowName(string flowName)
        {
            return string.IsNullOrWhiteSpace(flowName) ? "DEFAULT" : flowName;
        }

        private static async UniTaskVoid OnContinueAsync(string flowName)
        {
            try
            {
                await RemoteLogger.RemoteLogger.Log($"Continue on flow '{GetFlowName(flowName)}'", new[]
                    {
                        ("operation", "continue"),
                        ("flowName", flowName)
                    },
                    "ink");
            }
            catch (Exception e)
            {
                Debug.LogError(e);
            }
        }

        public void OnChoice(ChosenChoice choice)
        {
            OnChoiceAsync(choice).Forget();
        }

        private static async UniTaskVoid OnChoiceAsync(ChosenChoice choice)
        {
            try
            {
                await RemoteLogger.RemoteLogger.Log(
                    $"Take choice {choice.ChoiceIndex} on flow {GetFlowName(choice.FlowName)}", new[]
                    {
                        ("operation", "choice"),
                        ("flowName", choice.FlowName),
                        ("choiceIndex", choice.ChoiceIndex.ToString())
                    },
                    "ink");
            }
            catch (Exception e)
            {
                Debug.LogError(e);
            }
        }
    }
}