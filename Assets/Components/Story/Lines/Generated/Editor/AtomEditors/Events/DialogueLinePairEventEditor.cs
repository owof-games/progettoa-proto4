#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `DialogueLinePair`. Inherits from `AtomEventEditor&lt;DialogueLinePair, DialogueLinePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(DialogueLinePairEvent))]
    public sealed class DialogueLinePairEventEditor : AtomEventEditor<DialogueLinePair, DialogueLinePairEvent>
    {
    }
}
#endif