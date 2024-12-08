using System;
using System.IO;
using System.Linq;
using Ink.Runtime;
using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using Path = System.IO.Path;

namespace Components.SaveSystem
{
    public class SaveSystem : MonoBehaviour
    {
        private const int MaxSaves = 100;
        [SerializeField] private InkAtomsStory inkAtomsStory;
        [SerializeField] private SerializableInkListItemValueList tierState;

        [SerializeField] private Transform saveButtonContainer;
        [SerializeField] private GameObject saveButtonPrefab;
        [SerializeField] private GameObject loadStoryCanvas;

        private string _lastRoom;

        private void Awake()
        {
            Assert.IsNotNull(inkAtomsStory);
            Assert.IsNotNull(tierState);
            Assert.IsNotNull(saveButtonContainer);
            Assert.IsNotNull(saveButtonPrefab);
            Assert.IsNotNull(loadStoryCanvas);
        }

        public void OnStoryStep(StoryStep storyStep)
        {
            // check if the room has changed
            var ettoreLocation = inkAtomsStory.Call("getEttoreLocation", out _) as InkList;
            var newRoom = ettoreLocation?.ToString();
            if (_lastRoom == newRoom) return;
            _lastRoom = newRoom;
            // it has changed: deduce a filename
            var destinationPath = Application.persistentDataPath;
            var existingSaves = (
                from name in Directory.GetFiles(destinationPath)
                select int.Parse(Path.GetFileName(name).Split('-')[0])).ToList();
            var index = existingSaves.Count == 0 ? 0 : existingSaves.Max() + 1;
            var timestamp = DateTime.Now.ToFileTimeUtc();
            var tier = tierState.First().itemName;
            var filename = Path.Join(destinationPath, $"{index}-{timestamp}-{newRoom}-{tier}");
            // remove extra files
            while (existingSaves.Count > MaxSaves - 1)
            {
                var min = existingSaves.Min();
                var fileToRemove = Path.Join(destinationPath, min.ToString());
                File.Delete(fileToRemove);
            }

            // save
            var currentJson = inkAtomsStory.GetCurrentStateJson();
            using var sw = new StreamWriter(filename);
            sw.Write(currentJson);
            Debug.Log($"Save successfully made: {filename}");
        }

        public void OnLoadStoryClick()
        {
            loadStoryCanvas.SetActive(true);
            var destinationPath = Application.persistentDataPath;
            foreach (var filename in Directory.GetFiles(destinationPath))
            {
                var saveButtonGameObject = Instantiate(saveButtonPrefab, saveButtonContainer.transform);
                var saveButton = saveButtonGameObject.GetComponent<SaveButton>();
                var parts = Path.GetFileName(filename).Split('-');
                var date = DateTime.FromFileTimeUtc(long.Parse(parts[1])).ToString("f");
                var room = parts[2];
                var tier = parts[3];
                saveButton.SetUp(filename, LoadSaveFile, date, room, tier);
            }
        }

        private void LoadSaveFile(string filename)
        {
            using var sr = new StreamReader(filename);
            var json = sr.ReadToEnd();
            inkAtomsStory.LoadCurrentStateJson(json);
            loadStoryCanvas.SetActive(false);
        }
    }
}