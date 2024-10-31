#if UNITY_2019_1_OR_NEWER
using Components.InteractionSelector;
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    ///     Event property drawer of type `Components.InteractionSelector.AvailableInteractions`. Inherits from
    ///     `AtomEventEditor&lt;Components.InteractionSelector.AvailableInteractions, AvailableInteractionsEvent&gt;`. Only
    ///     availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(AvailableInteractionsEvent))]
    public sealed class
        AvailableInteractionsEventEditor : AtomEventEditor<AvailableInteractions, AvailableInteractionsEvent>
    {
    }
}
#endif