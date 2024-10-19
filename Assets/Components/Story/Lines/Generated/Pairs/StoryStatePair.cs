using System;
using Components.Story.Lines;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    /// IPair of type `&lt;Components.Story.Lines.StoryState&gt;`. Inherits from `IPair&lt;Components.Story.Lines.StoryState&gt;`.
    /// </summary>
    [Serializable]
    public struct StoryStatePair : IPair<StoryState>
    {
        public StoryState Item1
        {
            get => _item1;
            set => _item1 = value;
        }

        public StoryState Item2
        {
            get => _item2;
            set => _item2 = value;
        }

        [SerializeField] private StoryState _item1;
        [SerializeField] private StoryState _item2;

        public void Deconstruct(out StoryState item1, out StoryState item2)
        {
            item1 = Item1;
            item2 = Item2;
        }
    }
}