#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    ///     Event property drawer of type `AvailableInteractionsPair`. Inherits from `AtomEventEditor&lt;
    ///     AvailableInteractionsPair, AvailableInteractionsPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(AvailableInteractionsPairEvent))]
    public sealed class
        AvailableInteractionsPairEventEditor : AtomEventEditor<AvailableInteractionsPair,
        AvailableInteractionsPairEvent>
    {
    }
}
#endif