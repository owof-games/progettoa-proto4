using UnityEngine;
using UnityEngine.Assertions;

[ExecuteInEditMode]
public class CharacterScaling : MonoBehaviour
{
    [SerializeField] private float yFar;
    [Range(0.2f, 1f)] [SerializeField] private float scaleFar;
    [SerializeField] private float yNear;
    [Range(0.2f, 1f)] [SerializeField] private float scaleNear;

    private void Awake()
    {
        Assert.IsTrue(yFar >= yNear);
        Assert.IsTrue(scaleFar <= scaleNear);
    }

    // Update is called once per frame
    private void Update()
    {
        var currY = transform.position.y;
        var t = Mathf.InverseLerp(yNear, yFar, currY);
        var currScale = Mathf.Lerp(scaleNear, scaleFar, t);
        transform.localScale = new Vector3(currScale, currScale, currScale);
    }
}