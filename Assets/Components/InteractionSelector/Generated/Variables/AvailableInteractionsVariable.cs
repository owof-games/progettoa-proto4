using Components.InteractionSelector;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Variable of type `Components.InteractionSelector.AvailableInteractions`. Inherits from `EquatableAtomVariable&lt;
    ///     Components.InteractionSelector.AvailableInteractions, AvailableInteractionsPair, AvailableInteractionsEvent,
    ///     AvailableInteractionsPairEvent, AvailableInteractionsAvailableInteractionsFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/AvailableInteractions",
        fileName = "AvailableInteractionsVariable")]
    public sealed class AvailableInteractionsVariable : EquatableAtomVariable<AvailableInteractions,
        AvailableInteractionsPair, AvailableInteractionsEvent, AvailableInteractionsPairEvent,
        AvailableInteractionsAvailableInteractionsFunction>
    {
    }
}