using System.Linq;
using Components.Character;
using Components.NavigationNetwork;
using Cysharp.Threading.Tasks;
using UnityEngine;

public class NavigationChecks : MonoBehaviour
{
    [SerializeField] private CharacterNavigation _characterNavigation;
    private int fromIndex;
    private NavigationGraph graph;
    private int toIndex;

    private void Start()
    {
        graph = FindObjectsByType
                <NavigationGraph>(FindObjectsInactive.Exclude, FindObjectsSortMode.None)
            .First(ng => ng.gameObject.scene == gameObject.scene);
    }

    public void OnFromValueChanged(string newValue)
    {
        int.TryParse(newValue, out fromIndex);
    }

    public void OnToValueChanged(string newValue)
    {
        int.TryParse(newValue, out toIndex);
    }

    public void OnGo()
    {
        Debug.Log($"Finding path from {fromIndex} to {toIndex}");
        var path = graph.GetPath(fromIndex, toIndex);
        Debug.Log("Path found is:");
        foreach (var index in path) Debug.Log(index);
    }

    public void OnCharacterNavigation()
    {
        OnCharacterNavigationInternal().Forget();
    }

    private async UniTaskVoid OnCharacterNavigationInternal()
    {
        _characterNavigation.SetUp(RoomDirection.Left);
        await _characterNavigation.ExitTo(RoomDirection.Right);
        Debug.Log("Navigation completed");
    }
}