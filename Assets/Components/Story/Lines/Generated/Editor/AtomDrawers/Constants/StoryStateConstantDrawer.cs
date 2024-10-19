#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Constant property drawer of type `Components.Story.Lines.StoryState`. Inherits from `AtomDrawer&lt;StoryStateConstant&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(StoryStateConstant))]
    public class StoryStateConstantDrawer : VariableDrawer<StoryStateConstant>
    {
    }
}
#endif