using System;
using System.Linq;

namespace Components.InteractionSelector
{
    [Serializable]
    public class AvailableInteraction : IEquatable<AvailableInteraction>
    {
        public Interaction interaction;
        public string key;

        public AvailableInteraction(Interaction interaction, string key)
        {
            this.interaction = interaction;
            this.key = key;
        }

        public bool Equals(AvailableInteraction other)
        {
            if (other is null) return false;
            if (ReferenceEquals(this, other)) return true;
            return interaction == other.interaction && key == other.key;
        }

        public override bool Equals(object obj)
        {
            if (obj is null) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != GetType()) return false;
            return Equals((AvailableInteraction)obj);
        }

        public override int GetHashCode()
        {
            return HashCode.Combine((int)interaction, key);
        }

        public static bool operator ==(AvailableInteraction left, AvailableInteraction right)
        {
            return Equals(left, right);
        }

        public static bool operator !=(AvailableInteraction left, AvailableInteraction right)
        {
            return !Equals(left, right);
        }
    }

    [Serializable]
    public class AvailableInteractions : IEquatable<AvailableInteractions>
    {
        public static readonly AvailableInteractions EmptyAvailableInteractions = new()
        {
            availableInteractions = Array.Empty<AvailableInteraction>()
        };

        public AvailableInteraction[] availableInteractions;

        public bool Equals(AvailableInteractions other)
        {
            if (other is null) return false;
            if (ReferenceEquals(this, other)) return true;
            return availableInteractions.SequenceEqual(other.availableInteractions);
        }

        public override bool Equals(object obj)
        {
            if (obj is null) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != GetType()) return false;
            return Equals((AvailableInteractions)obj);
        }

        public override int GetHashCode()
        {
            return availableInteractions != null ? availableInteractions.GetHashCode() : 0;
        }

        public static bool operator ==(AvailableInteractions left, AvailableInteractions right)
        {
            return Equals(left, right);
        }

        public static bool operator !=(AvailableInteractions left, AvailableInteractions right)
        {
            return !Equals(left, right);
        }
    }
}