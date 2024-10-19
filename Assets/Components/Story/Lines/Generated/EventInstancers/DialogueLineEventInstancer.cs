using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Instancer of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomEventInstancer&lt;Components.Story.Lines.DialogueLine, DialogueLineEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/DialogueLine Event Instancer")]
    public class DialogueLineEventInstancer : AtomEventInstancer<DialogueLine, DialogueLineEvent>
    {
    }
}