using System;
using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// Variable of type `Components.Story.Lines.DialogueLine`. Inherits from `AtomVariable&lt;Components.Story.Lines.DialogueLine, DialogueLinePair, DialogueLineEvent, DialogueLinePairEvent, DialogueLineDialogueLineFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/DialogueLine", fileName = "DialogueLineVariable")]
    public sealed class DialogueLineVariable : AtomVariable<DialogueLine, DialogueLinePair, DialogueLineEvent,
        DialogueLinePairEvent, DialogueLineDialogueLineFunction>
    {
        protected override bool ValueEquals(DialogueLine other)
        {
            throw new NotImplementedException();
        }
    }
}