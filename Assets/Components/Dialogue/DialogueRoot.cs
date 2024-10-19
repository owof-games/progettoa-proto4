using System;
using System.Collections.Generic;
using System.Linq;
using Components.RoomTransitionHandler;
using Components.Story.Lines;
using JetBrains.Annotations;
using LitMotion;
using NUnit.Framework;
using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

namespace Components.Dialogue
{
    public class DialogueRoot : MonoBehaviour
    {
        [SerializeField] private RectTransform dialogueSlidingContainer;
        [SerializeField] private GameObject dialogueRowPrefab;
        [SerializeField] private float slideDuration = 0.1f;

        private readonly List<Character.Character>[] _characterColumns = { new(), new(), new() };

        private readonly Dictionary<int, int> _columnRemapper = new()
        {
            {
                0, 2
            },
            {
                1, 1
            },
            {
                2, 3
            }
        };

        private void Awake()
        {
            Assert.IsNotNull(dialogueSlidingContainer);
            Assert.IsNotNull(dialogueRowPrefab);
        }

        private void Update()
        {
            var dialoguesHeight =
                LayoutUtility.GetPreferredHeight(dialogueSlidingContainer); // dialogueSlidingContainer.rect.height;
            var myHeight = ((RectTransform)transform).rect.height;
            if (dialoguesHeight > myHeight)
            {
                var delta = dialoguesHeight - myHeight;
                var currY = dialogueSlidingContainer.anchoredPosition.y;
                LMotion.Create(currY, delta, slideDuration)
                    .WithEase(Ease.Linear)
                    .Bind(value => dialogueSlidingContainer.anchoredPosition = new Vector2(
                        dialogueSlidingContainer.anchoredPosition.x,
                        value))
                    .AddTo(dialogueSlidingContainer.gameObject);
            }
        }

        private void OnValidate()
        {
            if (!dialogueSlidingContainer) dialogueSlidingContainer = transform.GetChild(0) as RectTransform;

            if (!dialogueRowPrefab)
                dialogueRowPrefab =
                    AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Components/Dialogue/DialogueRow.prefab");
        }

        public void OnDialogueLine(DialogueLine dialogueLine)
        {
            var character = dialogueLine.character;

            int column;
            for (column = 0; column < _characterColumns.Length; column++)
                if (_characterColumns[column].Contains(character))
                    break;

            if (column >= _characterColumns.Length)
            {
                var selectedColumn = _characterColumns.MinBy(cc => cc.Count);
                selectedColumn.Add(character);
                column = Array.IndexOf(_characterColumns, selectedColumn);
            }

            OnText(character, dialogueLine.text, dialogueLine.canContinue, column,
                dialogueLine.choices.Select(c =>
                {
                    var text = c.text;
                    if (text.StartsWith("Ettore:")) text = text["Ettore:".Length..].Trim();

                    return text;
                }).ToArray());
        }

        private void OnText(Character.Character character, string text, bool showAdvance, int column,
            [CanBeNull] string[] choices = null)
        {
            var dialogueRowGameObject = Instantiate(dialogueRowPrefab, dialogueSlidingContainer);
            var dialogueRow = dialogueRowGameObject.GetComponent<DialogueRow>();
            dialogueRow.SetUp(character, Direction.Right, _columnRemapper[column], text, showAdvance, choices);
        }
    }
}