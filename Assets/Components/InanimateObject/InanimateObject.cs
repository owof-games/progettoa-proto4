using UnityEngine;

namespace Components.InanimateObject
{
    public class InanimateObject : MonoBehaviour
    {
        private SpriteRenderer spriteRenderer;

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        private void Start()
        {
            Destroy(GetComponent<PolygonCollider2D>());
            var pc = gameObject.AddComponent<PolygonCollider2D>();
            pc.useDelaunayMesh = true;
        }

        // Update is called once per frame
        private void Update()
        {
        }
    }
}