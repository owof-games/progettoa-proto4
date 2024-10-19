using System;

namespace Components.Story.Lines
{
    [Serializable]
    public class Choice
    {
        public int index;
        public string text;
    }

    [Serializable]
    public class DialogueLine
    {
        public Character.Character character;
        public string text;
        public bool canContinue;
        public Choice[] choices;
    }
}