#if UNITY_2019_1_OR_NEWER
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `StoryStatePair`. Inherits from `AtomEventEditor&lt;StoryStatePair, StoryStatePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(StoryStatePairEvent))]
    public sealed class StoryStatePairEventEditor : AtomEventEditor<StoryStatePair, StoryStatePairEvent>
    {
    }
}
#endif