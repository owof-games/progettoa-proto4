using System.Linq;
using Components.Configuration.InanimateObjects;
using Components.InteractionSelector;
using LemuRivolta.InkAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Components.Inventory
{
    public class InventoryObject : MonoBehaviour
    {
        [SerializeField] private InanimateObjectDescriptions inanimateObjectDescriptions;
        [SerializeField] private Color interactableColor = Color.white;
        [SerializeField] private Color nonInteractableColor = new(1, 1, 1, 0);

        private string _currentName;
        private Image _image;

        private void Start()
        {
            _image = GetComponent<Image>();
            Assert.IsNotNull(_image);
        }

        public void OnInventoryObjectAdded(SerializableInkListItem obj)
        {
            _currentName = obj.itemName;
            _image.sprite = inanimateObjectDescriptions[_currentName].Sprite;
            _image.enabled = true;
        }

        public void OnInventoryObjectRemoved(SerializableInkListItem obj)
        {
            _currentName = null;
            _image.enabled = false;
        }

        public void OnAvailableInteractionsChanged(AvailableInteractions availableInteractions)
        {
            var isInteractable = availableInteractions.availableInteractions.Any(i =>
                i.interaction == Interaction.DropObject && i.key == _currentName);
            _image.color = isInteractable ? interactableColor : nonInteractableColor;
        }
    }
}