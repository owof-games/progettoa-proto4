using System.Linq;
using Components.InteractionSelector;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Components.Notebook
{
    public class NotebookButton : MonoBehaviour
    {
        [SerializeField] private Image notebookImage;
        [SerializeField] private Button notebookButton;
        [SerializeField] private VoidEvent notebookClickedEvent;
        [SerializeField] private Sprite openNotebook;
        [SerializeField] private Sprite closedNotebook;
        private bool _activeNotebook;

        private void Awake()
        {
            Assert.IsNotNull(notebookClickedEvent);
        }

        private void Start()
        {
            UpdateActiveNotebook();
        }

        private void OnValidate()
        {
            if (!notebookImage) notebookImage = GetComponent<Image>();

            if (!notebookButton) notebookButton = GetComponent<Button>();
        }

        public void OnActiveNotebookChanged(bool newValue)
        {
            _activeNotebook = newValue;
            UpdateActiveNotebook();
        }

        private void UpdateActiveNotebook()
        {
            notebookImage.enabled = _activeNotebook;
            notebookButton.enabled = _activeNotebook;
        }

        public void RaiseNotebookClickedEvent()
        {
            notebookClickedEvent.Raise();
            notebookImage.sprite = openNotebook;
        }

        public void OnAvailableInteractionsChanged(AvailableInteractions availableInteractions)
        {
            notebookButton.interactable =
                availableInteractions.availableInteractions.Any(i => i.interaction == Interaction.Notebook);
        }

        public void OnNotebookClosed()
        {
            notebookImage.sprite = closedNotebook;
        }
    }
}