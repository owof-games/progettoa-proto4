using System;
using Components.InteractionSelector;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Event Reference of type `Components.InteractionSelector.AvailableInteractions`. Inherits from `AtomEventReference
    ///     &lt;Components.InteractionSelector.AvailableInteractions, AvailableInteractionsVariable,
    ///     AvailableInteractionsEvent, AvailableInteractionsVariableInstancer, AvailableInteractionsEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class AvailableInteractionsEventReference : AtomEventReference<
        AvailableInteractions,
        AvailableInteractionsVariable,
        AvailableInteractionsEvent,
        AvailableInteractionsVariableInstancer,
        AvailableInteractionsEventInstancer>, IGetEvent
    {
    }
}