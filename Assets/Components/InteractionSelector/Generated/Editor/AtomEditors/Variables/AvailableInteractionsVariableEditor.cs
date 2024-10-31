using Components.InteractionSelector;
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    ///     Variable Inspector of type `Components.InteractionSelector.AvailableInteractions`. Inherits from
    ///     `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(AvailableInteractionsVariable))]
    public sealed class
        AvailableInteractionsVariableEditor : AtomVariableEditor<AvailableInteractions, AvailableInteractionsPair>
    {
    }
}