#if UNITY_2019_1_OR_NEWER
using Components.Story.Lines;
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `Components.Story.Lines.StoryState`. Inherits from `AtomEventEditor&lt;Components.Story.Lines.StoryState, StoryStateEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(StoryStateEvent))]
    public sealed class StoryStateEventEditor : AtomEventEditor<StoryState, StoryStateEvent>
    {
    }
}
#endif