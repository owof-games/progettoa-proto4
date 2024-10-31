using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Event of type `AvailableInteractionsPair`. Inherits from `AtomEvent&lt;AvailableInteractionsPair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/AvailableInteractionsPair",
        fileName = "AvailableInteractionsPairEvent")]
    public sealed class AvailableInteractionsPairEvent : AtomEvent<AvailableInteractionsPair>
    {
    }
}