using System;
using LemuRivolta.InkAtoms;
using NUnit.Framework;
using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace Components.InanimateObject
{
    public class InanimateObject : MonoBehaviour
    {
        [SerializeField] private InkAtomsStory inkStory;
        [SerializeField] private SerializableInkListItemEvent[] roomChangedEvents;
        private string _interactionKey;
        private SpriteRenderer _spriteRenderer;
        private bool _started;

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        private void Start()
        {
            var interactionSelector = GetComponent<InteractionSelector.InteractionSelector>();
            _interactionKey = interactionSelector.InteractionKey;
            _spriteRenderer = GetComponent<SpriteRenderer>();
            Assert.IsNotNull(_spriteRenderer);

            // re-create the polygon collider to reset the shape
            Destroy(GetComponent<PolygonCollider2D>());
            var pc = gameObject.AddComponent<PolygonCollider2D>();
            pc.useDelaunayMesh = true;

            // mark as started and update visibility
            _started = true;
            UpdateVisibility();
        }

        private void OnEnable()
        {
            foreach (var e in roomChangedEvents) e.Register(OnRoomContentsChanged);
        }

        private void OnDisable()
        {
            foreach (var e in roomChangedEvents) e.Unregister(OnRoomContentsChanged);
        }

        private void OnRoomContentsChanged(SerializableInkListItem obj)
        {
            UpdateVisibility();
        }

        public void OnStoryStepChanged(StoryStep step)
        {
            UpdateVisibility();
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
            Debug.Log($"object: is {objectListItem} here? {result}");
            _spriteRenderer.enabled = (bool)result;
        }
    }
}