#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `StoryStatePair`. Inherits from `AtomDrawer&lt;StoryStatePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(StoryStatePairEvent))]
    public class StoryStatePairEventDrawer : AtomDrawer<StoryStatePairEvent>
    {
    }
}
#endif