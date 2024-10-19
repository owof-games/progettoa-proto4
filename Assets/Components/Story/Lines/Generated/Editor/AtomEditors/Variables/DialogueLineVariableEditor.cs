using Components.Story.Lines;
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(DialogueLineVariable))]
    public sealed class DialogueLineVariableEditor : AtomVariableEditor<DialogueLine, DialogueLinePair>
    {
    }
}