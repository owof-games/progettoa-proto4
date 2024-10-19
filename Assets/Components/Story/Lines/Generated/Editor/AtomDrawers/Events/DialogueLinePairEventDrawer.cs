#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `DialogueLinePair`. Inherits from `AtomDrawer&lt;DialogueLinePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(DialogueLinePairEvent))]
    public class DialogueLinePairEventDrawer : AtomDrawer<DialogueLinePairEvent>
    {
    }
}
#endif