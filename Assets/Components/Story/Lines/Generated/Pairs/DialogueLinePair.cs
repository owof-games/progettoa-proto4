using System;
using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// IPair of type `&lt;Components.Story.Lines.DialogueLine&gt;`. Inherits from `IPair&lt;Components.Story.Lines.DialogueLine&gt;`.
    /// </summary>
    [Serializable]
    public struct DialogueLinePair : IPair<DialogueLine>
    {
        public DialogueLine Item1
        {
            get => _item1;
            set => _item1 = value;
        }

        public DialogueLine Item2
        {
            get => _item2;
            set => _item2 = value;
        }

        [SerializeField] private DialogueLine _item1;
        [SerializeField] private DialogueLine _item2;

        public void Deconstruct(out DialogueLine item1, out DialogueLine item2)
        {
            item1 = Item1;
            item2 = Item2;
        }
    }
}