using System.Linq;
using UnityEngine;

namespace Components.Configuration.InanimateObjects
{
    [CreateAssetMenu(fileName = "InanimateObjectDescriptions",
        menuName = "Scriptable Objects/InanimateObjectDescriptions")]
    public class InanimateObjectDescriptions : ScriptableObject
    {
        [SerializeField] private InanimateObjectDescription[] descriptions;

        public InanimateObjectDescription this[string inkObjectName]
        {
            get { return descriptions.FirstOrDefault(d => d.InkObjectName == inkObjectName); }
        }
    }
}