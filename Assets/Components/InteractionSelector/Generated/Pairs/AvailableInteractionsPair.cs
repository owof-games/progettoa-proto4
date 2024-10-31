using System;
using Components.InteractionSelector;
using UnityEngine;

namespace UnityAtoms.BaseAtoms
{
    /// <summary>
    ///     IPair of type `&lt;Components.InteractionSelector.AvailableInteractions&gt;`. Inherits from `IPair&lt;
    ///     Components.InteractionSelector.AvailableInteractions&gt;`.
    /// </summary>
    [Serializable]
    public struct AvailableInteractionsPair : IPair<AvailableInteractions>
    {
        public AvailableInteractions Item1
        {
            get => _item1;
            set => _item1 = value;
        }

        public AvailableInteractions Item2
        {
            get => _item2;
            set => _item2 = value;
        }

        [SerializeField] private AvailableInteractions _item1;
        [SerializeField] private AvailableInteractions _item2;

        public void Deconstruct(out AvailableInteractions item1, out AvailableInteractions item2)
        {
            item1 = Item1;
            item2 = Item2;
        }
    }
}