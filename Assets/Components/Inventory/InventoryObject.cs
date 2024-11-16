using System.Linq;
using Components.Configuration.InanimateObjects;
using Components.InteractionSelector;
using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Components.Inventory
{
    public class InventoryObject : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
    {
        [SerializeField] private InanimateObjectDescriptions inanimateObjectDescriptions;
        [SerializeField] private GameObject dropIcon;
        [SerializeField] private StringEvent dropObjectEvent;
        private Button _button;

        private string _currentName;
        private Image _image;

        private bool _inside;

        private bool _interactable;

        private void Start()
        {
            _image = GetComponent<Image>();
            Assert.IsNotNull(_image);

            _button = GetComponent<Button>();
            Assert.IsNotNull(_button);

            Assert.IsNotNull(dropIcon);

            Assert.IsNotNull(inanimateObjectDescriptions);

            Assert.IsNotNull(dropObjectEvent);
        }

        public void OnPointerEnter(PointerEventData eventData)
        {
            _inside = true;
            UpdateDropIcon();
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            _inside = false;
            UpdateDropIcon();
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
            _button.interactable = false;
        }

        public void OnAvailableInteractionsChanged(AvailableInteractions availableInteractions)
        {
            _interactable = availableInteractions.availableInteractions.Any(i =>
                i.interaction == Interaction.DropObject && i.key == _currentName);
            _button.interactable = _interactable;
            UpdateDropIcon();
        }

        private void UpdateDropIcon()
        {
            dropIcon.SetActive(_inside && _interactable);
        }

        public void OnClick()
        {
            dropObjectEvent.Raise(_currentName);
        }
    }
}