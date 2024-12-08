using System;
using TMPro;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.SaveSystem
{
    public class SaveButton : MonoBehaviour
    {
        [SerializeField] private TextMeshProUGUI dateTextField;
        [SerializeField] private TextMeshProUGUI roomTextField;
        [SerializeField] private TextMeshProUGUI tierTextField;

        private string _filename;
        private Action<string> _loadSaveFileAction;

        private void Awake()
        {
            Assert.IsNotNull(dateTextField);
            Assert.IsNotNull(roomTextField);
            Assert.IsNotNull(tierTextField);
        }

        public void SetUp(string filename, Action<string> loadSaveFileAction, string date, string room, string tier)
        {
            _filename = filename;
            _loadSaveFileAction = loadSaveFileAction;
            dateTextField.text = date;
            roomTextField.text = room;
            tierTextField.text = tier;
        }

        public void OnClick()
        {
            if (_filename == null || _loadSaveFileAction == null)
                throw new Exception("Save file button was not set up - call Setup() first");

            _loadSaveFileAction(_filename);
        }
    }
}