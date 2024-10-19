using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable Instancer of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomVariableInstancer&lt;DialogueLineVariable, DialogueLinePair, Components.Story.Lines.DialogueLine, DialogueLineEvent, DialogueLinePairEvent, DialogueLineDialogueLineFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/DialogueLine Variable Instancer")]
    public class DialogueLineVariableInstancer : AtomVariableInstancer<
        DialogueLineVariable,
        DialogueLinePair,
        DialogueLine,
        DialogueLineEvent,
        DialogueLinePairEvent,
        DialogueLineDialogueLineFunction>
    {
    }
}