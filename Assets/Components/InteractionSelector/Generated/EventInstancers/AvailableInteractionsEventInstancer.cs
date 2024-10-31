using Components.InteractionSelector;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Event Instancer of type `Components.InteractionSelector.AvailableInteractions`. Inherits from `AtomEventInstancer
    ///     &lt;Components.InteractionSelector.AvailableInteractions, AvailableInteractionsEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/AvailableInteractions Event Instancer")]
    public class
        AvailableInteractionsEventInstancer : AtomEventInstancer<AvailableInteractions, AvailableInteractionsEvent>
    {
    }
}