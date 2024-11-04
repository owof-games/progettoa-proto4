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
        }

        private void UpdateVisibility()
        {
            var listValue =
                inkStory.unsafeStory.listDefinitions.FindSingleItemListWithName("objects." + _interactionKey);
            var result = inkStory.Call("isObjectWithEttore", out _, listValue.value);
            _spriteRenderer.enabled = (bool)result;
        }

        public void OnStoryStepChanged(StoryStep step)
        {
            UpdateVisibility();
        }
    }
}