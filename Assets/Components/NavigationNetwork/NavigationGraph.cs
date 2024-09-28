using System;
using System.Collections.Generic;
using UnityEngine;

namespace Components.NavigationNetwork
{
    public class NavigationGraph : MonoBehaviour
    {
        [SerializeField] private Vector2[] nodes;

        [SerializeField] private List<Connection> connections;

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

        [Serializable]
        public struct Connection
        {
            public int fromIndex;
            public int toIndex;
        }
    }
}