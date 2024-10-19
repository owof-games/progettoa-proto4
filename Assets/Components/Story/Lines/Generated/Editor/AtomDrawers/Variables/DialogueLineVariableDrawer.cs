#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomDrawer&lt;DialogueLineVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(DialogueLineVariable))]
    public class DialogueLineVariableDrawer : VariableDrawer<DialogueLineVariable>
    {
    }
}
#endif