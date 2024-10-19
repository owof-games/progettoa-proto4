using System.Collections;
using UnityEngine;

namespace Components.Dialogue
{
    public class Choices : MonoBehaviour
    {
        [SerializeField] private GameObject singleChoicePrefab;
        [SerializeField] private RectTransform choicesContainer;

        private IEnumerator Start()
        {
            yield return new WaitForSeconds(1);
            Initialize(new[]
            {
                "Prima scelta",
                "Seconda scelta, dove c'è davvero molto testo e quindi va su una seconda riga",
                "Terza scelta"
            });
        }

        public void Initialize(string[] choices)
        {
            var choiceIndex = 0;
            foreach (var choice in choices)
            {
                CreateSingleChoice(choice, choiceIndex);
                choiceIndex++;
            }
        }

        private void CreateSingleChoice(string choice, int choiceIndex)
        {
            var singleChoiceInstance = Instantiate(singleChoicePrefab, choicesContainer);
            var singleChoice = singleChoiceInstance.GetComponent<SingleChoice>();
            singleChoice.SetText(choice);
            singleChoice.Register(() => TakeChoice(choiceIndex));
        }

        public void TakeChoice(int choiceIndex)
        {
            Debug.Log($"Choice taken: {choiceIndex}");
        }
    }
}