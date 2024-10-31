using Components.InteractionSelector;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Event of type `Components.InteractionSelector.AvailableInteractions`. Inherits from `AtomEvent&lt;
    ///     Components.InteractionSelector.AvailableInteractions&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/AvailableInteractions", fileName = "AvailableInteractionsEvent")]
    public sealed class AvailableInteractionsEvent : AtomEvent<AvailableInteractions>
    {
    }
}