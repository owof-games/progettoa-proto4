using System;
using LemuRivolta.InkAtoms;
using NUnit.Framework;
using UnityEngine;

namespace Components.InanimateObject
{
    public class InanimateObject : MonoBehaviour
    {
        [SerializeField] private InkAtomsStory inkStory;
        private string _interactionKey;
        private SpriteRenderer _spriteRenderer;
        private bool _started = false;

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        private void Start()
        {
            var interactionSelector = GetComponent<InteractionSelector.InteractionSelector>();
            _interactionKey = interactionSelector.InteractionKey;
            _spriteRenderer = GetComponent<SpriteRenderer>();
            Assert.IsNotNull(_spriteRenderer);
            UpdateVisibility();

            // re-create the polygon collider to reset the shape
            Destroy(GetComponent<PolygonCollider2D>());
            var pc = gameObject.AddComponent<PolygonCollider2D>();
            pc.useDelaunayMesh = true;

            // mark as started
            _started = true;
        }

        private void UpdateVisibility()
        {
            // visibility will be updated on Start anyway
            if (!_started) return;
            
            var objectListItem = "objects." + _interactionKey;
            var listValue =
                inkStory.unsafeStory.listDefinitions.FindSingleItemListWithName(objectListItem);
            if (listValue == null)
            {
                throw new Exception($"cannot find list item with name '{objectListItem}'");
            }

            var result = inkStory.Call("isObjectWithEttore", out _, listValue.value);
            _spriteRenderer.enabled = (bool)result;
        }

        public void OnStoryStepChanged(StoryStep step)
        {
            UpdateVisibility();
        }
    }
}