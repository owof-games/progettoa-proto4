using System;
using UnityEngine;

namespace Components.Story.Lines
{
    [Serializable]
    public class StoryState : IEquatable<StoryState>
    {
        /// <summary>
        /// Only used for debugging purposes. Object identity itself should be enough.
        /// </summary>
        [SerializeField] private string name;

        public string Name => name;

        public bool Equals(StoryState other)
        {
            if (other is null) return false;
            if (ReferenceEquals(this, other)) return true;
            return name == other.name;
        }

        public override bool Equals(object obj)
        {
            if (obj is null) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != GetType()) return false;
            return Equals((StoryState)obj);
        }

        public override int GetHashCode()
        {
            return (name != null ? name.GetHashCode() : 0);
        }
    }
}