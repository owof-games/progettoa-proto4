using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `Components.Story.Lines.StoryState`. Inherits from `AtomEvent&lt;Components.Story.Lines.StoryState&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/StoryState", fileName = "StoryStateEvent")]
    public sealed class StoryStateEvent : AtomEvent<StoryState>
    {
    }
}