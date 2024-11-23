using System;
using System.Linq;
using Components.RoomTransitionHandler;
using Components.Story.Rooms;
using Ink.Runtime;
using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;

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

            // check if this object is in the same room as Ettore; if not, don't update its visibility, because the
            // visibility is always only valid for the room ettore is in
            var myRoom = CurrentRoom.GetRoomOf(gameObject);
            var ettoreLocation = inkStory.Call("getEttoreLocation", out _) as InkList;
            Debug.Assert(ettoreLocation != null);
            var ettoreRoom = Enum.Parse<Room>(ettoreLocation!.Single().Key.itemName);
            if (myRoom != ettoreRoom)
            {
                Debug.Log(
                    $"Object {_interactionKey} in room {myRoom} is not in ettore's room {ettoreRoom}, skipping visibility update");
                return;
            }

            // check if the object is together with Ettore
            var objectListItem = "objects." + _interactionKey;
            var listValue =
                inkStory.unsafeStory.listDefinitions.FindSingleItemListWithName(objectListItem);
            if (listValue == null)
            {
                throw new Exception($"cannot find list item with name '{objectListItem}'");
            }

            var result = inkStory.Call("isObjectWithEttore", out _, listValue.value);
            // Debug.Log($"object: is {objectListItem} here? {result}");
            _spriteRenderer.enabled = (bool)result;
        }
    }
}