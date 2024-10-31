#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    ///     Event property drawer of type `Components.InteractionSelector.AvailableInteractions`. Inherits from `AtomDrawer&lt;
    ///     AvailableInteractionsEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(AvailableInteractionsEvent))]
    public class AvailableInteractionsEventDrawer : AtomDrawer<AvailableInteractionsEvent>
    {
    }
}
#endif