#if UNITY_2019_1_OR_NEWER
using Components.Story.Lines;
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomEventEditor&lt;Components.Story.Lines.DialogueLine, DialogueLineEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(DialogueLineEvent))]
    public sealed class DialogueLineEventEditor : AtomEventEditor<DialogueLine, DialogueLineEvent>
    {
    }
}
#endif