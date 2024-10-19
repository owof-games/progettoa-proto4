using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference Listener of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomEventReferenceListener&lt;Components.Story.Lines.DialogueLine, DialogueLineEvent, DialogueLineEventReference, DialogueLineUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/DialogueLine Event Reference Listener")]
    public sealed class DialogueLineEventReferenceListener : AtomEventReferenceListener<
        DialogueLine,
        DialogueLineEvent,
        DialogueLineEventReference,
        DialogueLineUnityEvent>
    {
    }
}