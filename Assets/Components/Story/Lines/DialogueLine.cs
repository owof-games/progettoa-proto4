using System;

namespace Components.Story.Lines
{
    [Serializable]
    public class DialogueLine
    {
        public Character.Character character;
        public string text;
        public bool canContinue;
    }
}