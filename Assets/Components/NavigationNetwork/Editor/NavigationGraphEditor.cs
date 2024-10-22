using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Components.NavigationNetwork.Editor
{
    [CustomEditor(typeof(NavigationGraph))]
    public class NavigationGraphEditor : UnityEditor.Editor
    {
        private void OnSceneGUI()
        {
            var navigationGraph = (NavigationGraph)target;

            // draw handles for the nodes
            var i = 0;
            var nodes = navigationGraph.EditorGetNodePositions();
            foreach (var node in nodes)
            {
                var position = new Vector3(node.x, node.y, 0);
                var guiStyle = new GUIStyle
                {
                    fontSize = 20,
                    normal =
                    {
                        textColor = navigationGraph.NodesInScene.Contains(i) ? Color.black : Color.gray
                    }
                };
                Handles.Label(position + new Vector3(0.1f, 0.2f, 0), i.ToString(), guiStyle);
                var newPosition = (Vector2)Handles.PositionHandle(position, Quaternion.identity);
                if (node != newPosition) navigationGraph.EditorSetNodePosition(i, newPosition);

                i++;
            }

            // draw connections
            foreach (var connection in navigationGraph.EditorGetConnections())
            {
                Handles.color = Color.red;
                Handles.DrawLine(nodes[connection.fromIndex], nodes[connection.toIndex]);
            }
        }
    }
}