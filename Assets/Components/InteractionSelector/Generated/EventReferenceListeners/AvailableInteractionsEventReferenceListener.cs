using Components.InteractionSelector;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Event Reference Listener of type `Components.InteractionSelector.AvailableInteractions`. Inherits from
    ///     `AtomEventReferenceListener&lt;Components.InteractionSelector.AvailableInteractions, AvailableInteractionsEvent,
    ///     AvailableInteractionsEventReference, AvailableInteractionsUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/AvailableInteractions Event Reference Listener")]
    public sealed class AvailableInteractionsEventReferenceListener : AtomEventReferenceListener<
        AvailableInteractions,
        AvailableInteractionsEvent,
        AvailableInteractionsEventReference,
        AvailableInteractionsUnityEvent>
    {
    }
}