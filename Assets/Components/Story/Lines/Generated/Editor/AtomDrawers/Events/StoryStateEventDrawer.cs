#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `Components.Story.Lines.StoryState`. Inherits from `AtomDrawer&lt;StoryStateEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(StoryStateEvent))]
    public class StoryStateEventDrawer : AtomDrawer<StoryStateEvent>
    {
    }
}
#endif