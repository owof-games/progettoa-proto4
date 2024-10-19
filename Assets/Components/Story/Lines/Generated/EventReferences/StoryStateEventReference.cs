using System;
using Components.Story.Lines;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Event Reference of type `Components.Story.Lines.StoryState`. Inherits from `AtomEventReference&lt;
    ///     Components.Story.Lines.StoryState, StoryStateVariable, StoryStateEvent, StoryStateVariableInstancer,
    ///     StoryStateEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class StoryStateEventReference : AtomEventReference<
        StoryState,
        StoryStateVariable,
        StoryStateEvent,
        StoryStateVariableInstancer,
        StoryStateEventInstancer>, IGetEvent
    {
    }
}