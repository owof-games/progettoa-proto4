using Components.Configuration.InanimateObjects;
using LemuRivolta.InkAtoms;
using UnityEngine;
using UnityEngine.Assertions;
using UnityEngine.UI;

namespace Components.Inventory
{
    public class InventoryObject : MonoBehaviour
    {
        [SerializeField] private InanimateObjectDescriptions inanimateObjectDescriptions;
        private Image _image;

        private void Start()
        {
            _image = GetComponent<Image>();
            Assert.IsNotNull(_image);
        }

        public void OnInventoryObjectAdded(SerializableInkListItem obj)
        {
            _image.sprite = inanimateObjectDescriptions[obj.itemName].Sprite;
            _image.enabled = true;
        }

        public void OnInventoryObjectRemoved(SerializableInkListItem obj)
        {
            _image.enabled = false;
        }
    }
}