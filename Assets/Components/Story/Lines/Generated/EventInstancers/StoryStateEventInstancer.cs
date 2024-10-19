using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     Event Instancer of type `Components.Story.Lines.StoryState`. Inherits from `AtomEventInstancer&lt;
    ///     Components.Story.Lines.StoryState, StoryStateEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/StoryState Event Instancer")]
    public class StoryStateEventInstancer : AtomEventInstancer<StoryState, StoryStateEvent>
    {
    }
}