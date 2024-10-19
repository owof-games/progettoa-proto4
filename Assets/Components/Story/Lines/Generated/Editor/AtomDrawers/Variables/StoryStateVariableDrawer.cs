#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `Components.Story.Lines.StoryState`. Inherits from `AtomDrawer&lt;StoryStateVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(StoryStateVariable))]
    public class StoryStateVariableDrawer : VariableDrawer<StoryStateVariable>
    {
    }
}
#endif