using System;
using System.Linq;
using Components.Character;
using Components.RoomTransitionHandler;
using JetBrains.Annotations;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.UI;

namespace Components.Dialogue
{
    public class DialogueRow : MonoBehaviour
    {
        [SerializeField] private GameObject balloonPrefab;
        [SerializeField] private GridLayoutGroup gridLayoutGroup;

        private void Awake()
        {
            Assert.IsNotNull(balloonPrefab);
        }

        private void OnValidate()
        {
            gridLayoutGroup = GetComponent<GridLayoutGroup>();
        }

        public void SetUp(Character.Character character, int column, string text, bool showAdvance,
            [CanBeNull] string[] choices = null)
        {
            InsertEmpty(column);
            InsertBalloon(character, column, text, showAdvance, choices);
            InsertEmpty(5 - column - 1);
        }

        public event Action<int> ChoiceTaken;

        private void InsertBalloon(Character.Character character, int column, [CanBeNull] string text,
            bool showAdvance,
            [CanBeNull] string[] choices = null)
        {
            var characterGameObject =
                FindObjectsByType<CharacterName>(FindObjectsInactive.Exclude, FindObjectsSortMode.None)
                    .FirstOrDefault(characterName => characterName.Character == character)
                    ?.gameObject;
            var direction = Direction.Left;
            if (characterGameObject)
            {
                var thisCharacterGameObjectXCenter =
                    Camera.main!.WorldToScreenPoint(characterGameObject.transform.position).x;
                var thisBalloonXCenter = Screen.width * column / 5 + Screen.width / 10;
                Debug.Log(
                    $"comparing game object X center = {thisCharacterGameObjectXCenter} vs balloon x center = {thisBalloonXCenter}");
                direction = thisCharacterGameObjectXCenter < thisBalloonXCenter ? Direction.Left : Direction.Right;
            }
            else
            {
                Debug.LogError("Probably a whispered line, not implemented yet");
            }

            var balloonGameObject = Instantiate(balloonPrefab, transform);
            var balloon = balloonGameObject.GetComponent<Balloon>();
            balloon.SetUp(character, direction, choices);
            balloon.SetText(text);
            balloon.ShowAdvanceButton(showAdvance);
            balloon.ChoiceTaken += choiceIndex =>
            {
                ChoiceTaken?.Invoke(choiceIndex);
                Destroy(gameObject);
            };
            var rectTransform = balloonGameObject.GetComponent<RectTransform>();
            var height = LayoutUtility.GetPreferredHeight(rectTransform);
            gridLayoutGroup.cellSize = new Vector2(gridLayoutGroup.cellSize.x, height);
        }

        private void InsertEmpty(int column)
        {
            for (var i = 0; i < column; i++)
            {
                var o = new GameObject
                {
                    name = "Empty Object",
                    transform =
                    {
                        parent = transform,
                        // shouldn't be necessary, but without this it takes on a weird scale of 2.3something
                        // why? who knows!
                        localScale = Vector3.one
                    }
                };
                o.AddComponent<RectTransform>();
            }
        }
    }
}