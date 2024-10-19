using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Event Reference Listener of type `Components.Story.Lines.StoryState`. Inherits from `AtomEventReferenceListener&lt;
    ///     Components.Story.Lines.StoryState, StoryStateEvent, StoryStateEventReference, StoryStateUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/StoryState Event Reference Listener")]
    public sealed class StoryStateEventReferenceListener : AtomEventReferenceListener<
        StoryState,
        StoryStateEvent,
        StoryStateEventReference,
        StoryStateUnityEvent>
    {
    }
}