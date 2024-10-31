#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    ///     Variable property drawer of type `Components.InteractionSelector.AvailableInteractions`. Inherits from `AtomDrawer
    ///     &lt;AvailableInteractionsVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(AvailableInteractionsVariable))]
    public class AvailableInteractionsVariableDrawer : VariableDrawer<AvailableInteractionsVariable>
    {
    }
}
#endif