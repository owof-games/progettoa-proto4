using System;
using Components.InteractionSelector;
using UnityEngine.Events;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     None generic Unity Event of type `Components.InteractionSelector.AvailableInteractions`. Inherits from `UnityEvent
    ///     &lt;Components.InteractionSelector.AvailableInteractions&gt;`.
    /// </summary>
    [Serializable]
    public sealed class AvailableInteractionsUnityEvent : UnityEvent<AvailableInteractions>
    {
    }
}