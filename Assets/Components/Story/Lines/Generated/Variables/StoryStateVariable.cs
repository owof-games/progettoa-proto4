using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable of type `Components.Story.Lines.StoryState`. Inherits from `EquatableAtomVariable&lt;Components.Story.Lines.StoryState, StoryStatePair, StoryStateEvent, StoryStatePairEvent, StoryStateStoryStateFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/StoryState", fileName = "StoryStateVariable")]
    public sealed class StoryStateVariable : EquatableAtomVariable<StoryState, StoryStatePair, StoryStateEvent,
        StoryStatePairEvent, StoryStateStoryStateFunction>
    {
    }
}