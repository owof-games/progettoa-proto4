#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    ///     Event property drawer of type `AvailableInteractionsPair`. Inherits from `AtomDrawer&lt;
    ///     AvailableInteractionsPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(AvailableInteractionsPairEvent))]
    public class AvailableInteractionsPairEventDrawer : AtomDrawer<AvailableInteractionsPairEvent>
    {
    }
}
#endif