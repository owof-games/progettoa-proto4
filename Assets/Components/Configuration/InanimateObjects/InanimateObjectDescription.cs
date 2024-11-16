using UnityEngine;

namespace Components.Configuration.InanimateObjects
{
    [CreateAssetMenu(fileName = "Object", menuName = "Scriptable Objects/InanimateObjectDescription")]
    public class InanimateObjectDescription : ScriptableObject
    {
        [SerializeField] private string inkObjectName;

        [SerializeField] private Sprite sprite;

        public string InkObjectName => inkObjectName;

        public Sprite Sprite => sprite;

        private void OnValidate()
        {
            if (string.IsNullOrWhiteSpace(inkObjectName)) inkObjectName = name;
        }
    }
}