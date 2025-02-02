using System;
using System.Linq;
using Components.Character;
using Components.RoomTransitionHandler;
using JetBrains.Annotations;
using UnityEngine;
using UnityEngine.Assertions;
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

#if UNITY_EDITOR
        private void OnValidate()
        {
            gridLayoutGroup = GetComponent<GridLayoutGroup>();
        }
#endif

        /// <summary>
        ///     This method can be called with both choices and text, but it's actually only called with choices OR with
        ///     text, but not with both.
        /// </summary>
        /// <param name="character"></param>
        /// <param name="column"></param>
        /// <param name="text">If it's <c>null</c>, just displays the choices and no text box.</param>
        /// <param name="showAdvance"></param>
        /// <param name="choices">If it's <c>null</c>, don't display any choice.</param>
        /// <param name="smallChoices"></param>
        /// <param name="onDone">
        ///     Method called once the text is completely displayed (if text is different from
        ///     <c>null</c>, but including when it's empty string)
        /// </param>
        public void SetUp(Character.Character character, int column, string text, bool showAdvance,
            [CanBeNull] string[] choices = null, bool smallChoices = true, Action onDone = null)
        {
            InsertEmpty(column);
            InsertBalloon(character, column, text, showAdvance, choices, smallChoices, onDone);
            InsertEmpty(5 - column - 1);
        }

        public event Action<int> ChoiceTaken;

        private void InsertBalloon(Character.Character character, int column, [CanBeNull] string text,
            bool showAdvance, [CanBeNull] string[] choices = null, bool smallChoices = true, Action onDone = null)
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
                direction = thisCharacterGameObjectXCenter < thisBalloonXCenter ? Direction.Left : Direction.Right;
            }
            else
            {
                Debug.Log("Whispered line or anonymous");
            }

            var balloonGameObject = Instantiate(balloonPrefab, transform);
            var balloon = balloonGameObject.GetComponent<Balloon>();
            balloon.SetUp(character, direction, choices, smallChoices, onDone);
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