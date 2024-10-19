using System;
using Components.Story.Lines;
using UnityEngine.Events;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     None generic Unity Event of type `Components.Story.Lines.StoryState`. Inherits from `UnityEvent&lt;
    ///     Components.Story.Lines.StoryState&gt;`.
    /// </summary>
    [Serializable]
    public sealed class StoryStateUnityEvent : UnityEvent<StoryState>
    {
    }
}