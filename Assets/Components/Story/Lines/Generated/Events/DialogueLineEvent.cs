using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomEvent&lt;Components.Story.Lines.DialogueLine&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/DialogueLine", fileName = "DialogueLineEvent")]
    public sealed class DialogueLineEvent : AtomEvent<DialogueLine>
    {
    }
}