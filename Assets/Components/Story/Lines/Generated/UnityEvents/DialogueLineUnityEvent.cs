using System;
using Components.Story.Lines;
using UnityEngine.Events;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// None generic Unity Event of type `Components.Story.Lines.DialogueLine`. Inherits from `UnityEvent&lt;Components.Story.Lines.DialogueLine&gt;`.
    /// </summary>
    [Serializable]
    public sealed class DialogueLineUnityEvent : UnityEvent<DialogueLine>
    {
    }
}