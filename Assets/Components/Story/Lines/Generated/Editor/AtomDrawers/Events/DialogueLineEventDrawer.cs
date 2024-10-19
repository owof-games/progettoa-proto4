#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomDrawer&lt;DialogueLineEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(DialogueLineEvent))]
    public class DialogueLineEventDrawer : AtomDrawer<DialogueLineEvent>
    {
    }
}
#endif