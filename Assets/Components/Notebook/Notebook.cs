using System;
using System.Collections.Generic;
using System.Linq;
using LemuRivolta.InkAtoms;
using TMPro;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;
using Debug = System.Diagnostics.Debug;

namespace Components.Notebook
{
    public class Notebook : MonoBehaviour
    {
        private static readonly int Opened = Animator.StringToHash("Opened");
        [SerializeField] private StoryStateConstant notebookStoryState;
        [SerializeField] private StoryStateConstant dialogueStoryState;
        [SerializeField] private StoryStateVariable currentStoryState;
        [SerializeField] private Animator animator;
        [SerializeField] private StringEvent continueEvent;
        [SerializeField] private Button nextButton;
        [SerializeField] private Button prevButton;
        [SerializeField] private VoidEvent notebookClosed;
        [SerializeField] private IntReference notebookPage;

        [SerializeField] private SlotData[] slots;

        private readonly Dictionary<int, Dictionary<string, string>> _notebookContents = new();

        private int _page;
        private int? NextPage => _notebookContents.Keys.Where(k => k > _page).MinOrNull();

        private int? PrevPage => _notebookContents.Keys.Where(k => k < _page).MaxOrNull();

        private void Awake()
        {
            Assert.IsNotNull(notebookStoryState);
            Assert.IsNotNull(dialogueStoryState);
            Assert.IsNotNull(currentStoryState);
            Assert.IsNotNull(animator);
            Assert.IsNotNull(continueEvent);
            Assert.IsNotNull(prevButton);
            Assert.IsNotNull(nextButton);
            Assert.IsNotNull(notebookClosed);
            Assert.IsNotNull(notebookPage);
        }

        private void OnValidate()
        {
            if (!animator) animator = GetComponent<Animator>();
        }

        public void OnNotebookStart()
        {
            _notebookContents.Clear();
            _page = 0;
            animator.SetBool(Opened, true);
        }

        public void OnNotebookClose()
        {
            animator.SetBool(Opened, false);
            currentStoryState.Value = dialogueStoryState.Value;
            notebookClosed.Raise();
        }

        public void OnNotebookEnd()
        {
            UpdateNotesContents();
        }

        private void UpdateNotesContents()
        {
            var page = _notebookContents[_page];
            var slotsWithContent = new HashSet<string>();
            foreach (var key in page.Keys)
            {
                var slot = slots.FirstOrDefault(s => s.name == key);
                if (slot == null)
                    throw new Exception(
                        $"Cannot find a slot in NotebookCanvas.slots with name ${key}, but there's a #slot-${key} in the notebook.");

                slot.root.SetActive(true);
                slot.root.GetComponentInChildren<TextMeshProUGUI>().text = page[key].Trim();
                slotsWithContent.Add(key);
            }

            foreach (var slot in slots) slot.root.SetActive(slotsWithContent.Contains(slot.name));

            nextButton.interactable = NextPage.HasValue;
            prevButton.interactable = PrevPage.HasValue;
        }

        public void OnStoryStep(StoryStep storyStep)
        {
            // check if we're reading in notebook mode
            if (!currentStoryState.Value.Equals(notebookStoryState.Value)) return;

            try
            {
                // get the slot and page to put the line into
                const string slotPrefix = "slot-";
                var slotName = (from tag in storyStep.Tags
                        where tag.StartsWith(slotPrefix)
                        select tag[slotPrefix.Length..])
                    .SingleOrDefault();
                if (slotName == null) return;

                var page = notebookPage.Value - 1;

                // add or create the slot
                var currentPage = _notebookContents.GetValueOrDefault(page, new Dictionary<string, string>());
                var currentContent = currentPage.GetValueOrDefault(slotName, "");
                currentContent += "\n" + storyStep.Text.Trim();
                currentPage[slotName] = currentContent;
                _notebookContents[page] = currentPage;
            }
            finally
            {
                continueEvent.Raise(null);
            }
        }

        public void OnNextPage()
        {
            Debug.Assert(NextPage != null, nameof(NextPage) + " != null");
            _page = NextPage.Value;
            UpdateNotesContents();
        }

        public void OnPrevPage()
        {
            Debug.Assert(PrevPage != null, nameof(PrevPage) + " != null");
            _page = PrevPage.Value;
            UpdateNotesContents();
        }

        [Serializable]
        public class SlotData
        {
            public string name;
            public GameObject root;
        }
    }
}