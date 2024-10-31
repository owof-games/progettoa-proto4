using Components.InteractionSelector;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Variable Instancer of type `Components.InteractionSelector.AvailableInteractions`. Inherits from
    ///     `AtomVariableInstancer&lt;AvailableInteractionsVariable, AvailableInteractionsPair,
    ///     Components.InteractionSelector.AvailableInteractions, AvailableInteractionsEvent, AvailableInteractionsPairEvent,
    ///     AvailableInteractionsAvailableInteractionsFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/AvailableInteractions Variable Instancer")]
    public class AvailableInteractionsVariableInstancer : AtomVariableInstancer<
        AvailableInteractionsVariable,
        AvailableInteractionsPair,
        AvailableInteractions,
        AvailableInteractionsEvent,
        AvailableInteractionsPairEvent,
        AvailableInteractionsAvailableInteractionsFunction>
    {
    }
}