using System;
using System.Collections.Generic;
using System.Linq;
using Components.Character;
using UnityEngine;
using Random = UnityEngine.Random;

namespace Components.NavigationNetwork
{
    public class NavigationGraph : MonoBehaviour
    {
        [SerializeField] private Vector2[] nodes;

        [SerializeField] private List<Connection> connections;

        [SerializeField] private List<int> nodesInScene;

        public IEnumerable<int> NodesInScene => nodesInScene.AsReadOnly();

        public void EditorSetNodePosition(int index, Vector2 value)
        {
            nodes[index] = value;
        }

        public Vector2[] EditorGetNodePositions()
        {
            return nodes;
        }

        public List<Connection> EditorGetConnections()
        {
            return connections;
        }

        /// <summary>
        ///     Get the index of the leftmost node.
        /// </summary>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int GetLeftmostNodeIndex()
        {
            return GetNodeIndex(i => nodes[i].x);
        }

        /// <summary>
        ///     Get the index of the rightmost node.
        /// </summary>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int GetRightmostNodeIndex()
        {
            return GetNodeIndex(i => -nodes[i].x);
        }

        private int GetNodeIndex(Func<int, float> getKey)
        {
            var index = 0;
            var value = getKey(index);
            for (var i = 1; i < nodes.Length; i++)
            {
                var value2 = getKey(i);
                if (value2 < value)
                {
                    index = i;
                    value = value2;
                }
            }

            return index;
        }

        /// <summary>
        ///     Get the path between two nodes.
        /// </summary>
        /// <param name="fromNode">Index of the starting node.</param>
        /// <param name="toNode">Index of the ending node.</param>
        /// <returns>List of nodes to follow, starting from fromNode and ending in toNode</returns>
        /// <exception cref="NotImplementedException"></exception>
        public int[] GetPath(int fromNode, int toNode)
        {
            // keep a list of all the paths explored
            List<Path> foundPaths = new()
            {
                new Path
                {
                    NavigationGraph = this,
                    Nodes = new[] { fromNode }
                }
            };
            for (;;)
            {
                // take out the shortest path yet found
                var shortestPath = foundPaths.MinBy(path => path.Length());
                foundPaths.Remove(shortestPath);
                // if it connects to the destination, return it
                var lastNodeIndex = shortestPath.Nodes[^1];
                if (lastNodeIndex == toNode) return shortestPath.Nodes;

                // otherwise add all possible connections to the path that don't create loops
                foreach (var conn in connections)
                {
                    if (conn.fromIndex == lastNodeIndex && !shortestPath.Nodes.Contains(conn.toIndex))
                        foundPaths.Add(shortestPath.AddNode(conn.toIndex));

                    if (conn.toIndex == lastNodeIndex && !shortestPath.Nodes.Contains(conn.fromIndex))
                        foundPaths.Add(shortestPath.AddNode(conn.fromIndex));
                }
            }
        }

        /// <summary>
        ///     Get the node position of given node index.
        /// </summary>
        /// <param name="nodeIndex"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public Vector2 GetNodePosition(int nodeIndex)
        {
            return nodes[nodeIndex];
        }

        public int GetNumNodes()
        {
            return nodes.Length;
        }

        /// <summary>
        /// Get a free node at random between all nodes in the scene.
        /// </summary>
        /// <returns>the index of the randomly chosen free node.</returns>
        public int GetRandomFreeNode()
        {
            var usedNodeIndices = (from characterNavigation in FindObjectsByType<CharacterNavigation>(
                    FindObjectsInactive.Exclude,
                    FindObjectsSortMode.None)
                where characterNavigation.gameObject.scene == gameObject.scene &&
                      characterNavigation.CurrentNodeIndex != null
                select characterNavigation.CurrentNodeIndex!).ToList();
            var nodesSet = new HashSet<int>(nodesInScene);
            nodesSet.RemoveWhere(nodeIndex => usedNodeIndices.Contains(nodeIndex));
            var nodesList = nodesSet.ToList();
            if (nodesList.Count == 0) throw new InvalidOperationException("There are no free nodes");

            var nodesListIndex = Random.Range(0, nodesList.Count);
            var randomFreeNode = nodesList[nodesListIndex];
            return randomFreeNode;
        }

        [Serializable]
        public struct Connection
        {
            public int fromIndex;
            public int toIndex;
        }

        private class Path
        {
            public NavigationGraph NavigationGraph;
            public int[] Nodes;

            public float Length()
            {
                float length = 0;
                for (var i = 0; i < Nodes.Length - 1; i++)
                    length += (NavigationGraph.nodes[Nodes[i]] - NavigationGraph.nodes[Nodes[i + 1]]).magnitude;

                return length;
            }

            public Path AddNode(int nodeIndex)
            {
                var nodes = new List<int>(Nodes);
                nodes.Add(nodeIndex);
                return new Path
                {
                    NavigationGraph = NavigationGraph,
                    Nodes = nodes.ToArray()
                };
            }
        }
    }
}