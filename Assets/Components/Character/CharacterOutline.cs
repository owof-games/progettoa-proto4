using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Character
{
    public class CharacterOutline : MonoBehaviour
    {
        [SerializeField] private OutlineFx.OutlineFx outlineFx;

        [SerializeField] private float alpha;
        [SerializeField] private Color color;

        private void Awake()
        {
            Assert.IsNotNull(outlineFx);
        }

        private void Update()
        {
            outlineFx._color = new Color(color.r, color.g, color.b, alpha);
        }
    }
}