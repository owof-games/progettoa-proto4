using System.Collections;
using Components.RoomTransitionHandler;
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

        private IEnumerator Start()
        {
            yield return new WaitForSeconds(1f);
            SetUp(Character.Character.Paola, Direction.Left, 3, "Questo è del testo dove sono <happy>felice</happy>!");
        }

        private void OnValidate()
        {
            gridLayoutGroup = GetComponent<GridLayoutGroup>();
        }

        public void SetUp(Character.Character character, Direction direction, int column, string text)
        {
            InsertEmpty(column);
            InsertBalloon(character, direction, text);
            InsertEmpty(5 - column - 1);
        }

        private void InsertBalloon(Character.Character character, Direction direction, string text)
        {
            var balloonGameObject = Instantiate(balloonPrefab, transform);
            var balloon = balloonGameObject.GetComponent<Balloon>();
            balloon.SetUp(character, direction);
            balloon.SetText(text);
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