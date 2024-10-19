using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event of type `DialogueLinePair`. Inherits from `AtomEvent&lt;DialogueLinePair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/DialogueLinePair", fileName = "DialogueLinePairEvent")]
    public sealed class DialogueLinePairEvent : AtomEvent<DialogueLinePair>
    {
    }
}