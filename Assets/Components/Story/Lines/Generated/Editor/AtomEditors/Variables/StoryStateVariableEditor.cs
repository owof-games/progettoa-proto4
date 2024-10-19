using Components.Story.Lines;
using UnityAtoms.Editor;
using UnityEditor;

namespace UnityAtoms.BaseAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `Components.Story.Lines.StoryState`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(StoryStateVariable))]
    public sealed class StoryStateVariableEditor : AtomVariableEditor<StoryState, StoryStatePair>
    {
    }
}