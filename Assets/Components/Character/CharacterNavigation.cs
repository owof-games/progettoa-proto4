using System.Linq;
using Components.NavigationNetwork;
using Cysharp.Threading.Tasks;
using LitMotion;
using LitMotion.Extensions;
using UnityEngine;
using UnityEngine.Assertions;

namespace Components.Character
{
    public enum RoomDirection
    {
        Left,
        Right
    }

    public class CharacterNavigation : MonoBehaviour
    {
        [SerializeField] private float movementJitter = 0.1f;
        [SerializeField] private float speed = 2f;

        /// <summary>
        ///     Current node index we are at on the navigation graph. null if the character must still be setup.
        ///     When moving, it jumps to the new value as soon as the animation starts.
        /// </summary>
        private int? _currentNodeIndex;

        private NavigationGraph _navigationGraph;

        private void Start()
        {
            _navigationGraph = FindObjectsByType
                    <NavigationGraph>(FindObjectsInactive.Exclude, FindObjectsSortMode.None)
                .First(ng => ng.gameObject.scene == gameObject.scene);
            Assert.IsNotNull(_navigationGraph);
        }

        /// <summary>
        ///     Sets up the character position and node assignment from given direction.
        /// </summary>
        /// <param name="direction"></param>
        public void SetUp(RoomDirection direction)
        {
            var nodeIndex = direction == RoomDirection.Left
                ? _navigationGraph.GetLeftmostNodeIndex()
                : _navigationGraph.GetRightmostNodeIndex();
            transform.position = _navigationGraph.GetNodePosition(nodeIndex);
            _currentNodeIndex = nodeIndex;
        }

        /// <summary>
        ///     Make the character exit in the given direction.
        /// </summary>
        /// <param name="direction"></param>
        public UniTask ExitTo(RoomDirection direction)
        {
            Debug.Assert(_currentNodeIndex.HasValue);
            var nodeIndex = direction == RoomDirection.Left
                ? _navigationGraph.GetLeftmostNodeIndex()
                : _navigationGraph.GetRightmostNodeIndex();
            var path = _navigationGraph.GetPath(_currentNodeIndex.Value, nodeIndex);
            return AnimateMovement(path);
        }

        private async UniTask AnimateMovement(int[] path)
        {
            for (var i = 1; i < path.Length; i++)
            {
                var from = (Vector2)transform.position;
                var to = _navigationGraph.GetNodePosition(path[i]);
                to += new Vector2(Random.Range(0, 1), Random.Range(0, 1)).normalized * movementJitter;
                await LMotion
                    .Create(from, to, (from - to).magnitude / speed)
                    .BindToPositionXY(transform);
            }
        }
    }
}