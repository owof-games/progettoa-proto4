using System;
using Components.Story.Lines;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Event Reference of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomEventReference&lt;Components.Story.Lines.DialogueLine, DialogueLineVariable, DialogueLineEvent, DialogueLineVariableInstancer, DialogueLineEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class DialogueLineEventReference : AtomEventReference<
        DialogueLine,
        DialogueLineVariable,
        DialogueLineEvent,
        DialogueLineVariableInstancer,
        DialogueLineEventInstancer>, IGetEvent
    {
    }
}