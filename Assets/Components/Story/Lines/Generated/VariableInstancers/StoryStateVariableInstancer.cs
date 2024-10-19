using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Variable Instancer of type `Components.Story.Lines.StoryState`. Inherits from `AtomVariableInstancer&lt;
    ///     StoryStateVariable, StoryStatePair, Components.Story.Lines.StoryState, StoryStateEvent, StoryStatePairEvent,
    ///     StoryStateStoryStateFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/StoryState Variable Instancer")]
    public class StoryStateVariableInstancer : AtomVariableInstancer<
        StoryStateVariable,
        StoryStatePair,
        StoryState,
        StoryStateEvent,
        StoryStatePairEvent,
        StoryStateStoryStateFunction>
    {
    }
}