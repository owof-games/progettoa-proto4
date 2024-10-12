#nullable enable
using System.Linq;
using System.Threading;
using Components.NavigationNetwork;
using Cysharp.Threading.Tasks;
using LitMotion;
using LitMotion.Extensions;
using UnityEngine;
using UnityEngine.Assertions;
using Debug = System.Diagnostics.Debug;
using Random = UnityEngine.Random;

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

        private readonly CancellationTokenSource _navigationAnimationCancellationSource = new();

        private NavigationGraph? _cachedNavigationGraph;

        private int? _currentNodeIndex;

        /// <summary>
        ///     Current node index we are at on the navigation graph. null if the character must still be setup.
        ///     When moving, it jumps to the new value as soon as the animation starts.
        /// </summary>
        public int? CurrentNodeIndex => _currentNodeIndex;

        private void Start()
        {
            // force obtaining the navigation graph
            GetNavigationGraph();
        }

        private void OnDestroy()
        {
            _navigationAnimationCancellationSource.Cancel();
        }

        private NavigationGraph GetNavigationGraph()
        {
            if (_cachedNavigationGraph == null)
            {
                _cachedNavigationGraph = GetNavigationGraphUncached();
            }

            return _cachedNavigationGraph;
        }

        private NavigationGraph GetNavigationGraphUncached()
        {
            var navigationGraph = FindObjectsByType
                    <NavigationGraph>(FindObjectsInactive.Exclude, FindObjectsSortMode.None)
                .First(ng => ng.gameObject.scene == gameObject.scene);
            Assert.IsNotNull(navigationGraph);
            return navigationGraph;
        }

        /// <summary>
        ///     Sets up the character position and node assignment from given direction.
        /// </summary>
        /// <param name="direction"></param>
        public void SetUp(RoomDirection direction)
        {
            var nodeIndex = direction == RoomDirection.Left
                ? GetNavigationGraph().GetLeftmostNodeIndex()
                : GetNavigationGraph().GetRightmostNodeIndex();
            SetUp(nodeIndex);
        }

        /// <summary>
        ///     Sets up the character position and node assigned from a given node index.
        /// </summary>
        /// <param name="nodeIndex"></param>
        public void SetUp(int nodeIndex)
        {
            var navigationGraph = GetNavigationGraph();
            transform.position =
                navigationGraph.GetNodePosition(nodeIndex) + (Vector2)navigationGraph.transform.position;
            _currentNodeIndex = nodeIndex;
        }

        /// <summary>
        ///     Make the character exit in the given direction.
        /// </summary>
        /// <param name="direction"></param>
        public UniTask ExitTo(RoomDirection direction)
        {
            Debug.Assert(_currentNodeIndex != null, nameof(_currentNodeIndex) + " != null");
            var navigationGraph = GetNavigationGraph();
            var nodeIndex = direction == RoomDirection.Left
                ? navigationGraph.GetLeftmostNodeIndex()
                : navigationGraph.GetRightmostNodeIndex();
            var path = navigationGraph.GetPath(_currentNodeIndex.Value, nodeIndex);
            return AnimateMovement(path);
        }

        public UniTask EnterTo(int nodeIndex)
        {
            Debug.Assert(_currentNodeIndex != null, nameof(_currentNodeIndex) + " != null");
            var navigationGraph = GetNavigationGraph();
            var path = navigationGraph.GetPath(_currentNodeIndex.Value, nodeIndex);
            return AnimateMovement(path);
        }

        private async UniTask AnimateMovement(int[] path)
        {
            // immediately update the current index to the destination node
            UnityEngine.Debug.Log(
                $"Animating {GetComponent<CharacterName>().Character} movement in scene {gameObject.scene.name}, currently {_currentNodeIndex} and already jumping to index {path[^1]}");
            _currentNodeIndex = path[^1];
            var navigationGraph = GetNavigationGraph();
            for (var i = 1; i < path.Length; i++)
            {
                var from = (Vector2)transform.position;
                var to = navigationGraph.GetNodePosition(path[i]);
                to += new Vector2(Random.Range(0, 1), Random.Range(0, 1)).normalized * movementJitter;
                await LMotion
                    .Create(from, to, (from - to).magnitude / speed)
                    .BindToPositionXY(transform)
                    .AddTo(transform)
                    .ToUniTask(_navigationAnimationCancellationSource.Token);
            }
        }
    }
}