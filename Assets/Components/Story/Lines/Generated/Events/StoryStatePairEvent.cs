using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `StoryStatePair`. Inherits from `AtomEvent&lt;StoryStatePair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/StoryStatePair", fileName = "StoryStatePairEvent")]
    public sealed class StoryStatePairEvent : AtomEvent<StoryStatePair>
    {
    }
}