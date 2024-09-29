using System;
using System.Collections.Generic;
using System.Linq;
using LemuRivolta.InkAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace Components.Story.Rooms
{
    public enum Room
    {
        WhiteRoom,
        YellowRoom,
        RedRoom,
        GreenRoom
    }

    public class RoomContentEventArgs : EventArgs
    {
        public Room Room;
        public SerializableInkListItem SerializableInkListItem;
    }

    [CreateAssetMenu(fileName = "RoomContents", menuName = "Scriptable Objects/RoomContents")]
    public class RoomContents : ScriptableObject
    {
        [SerializeField] private SerializableInkListItemValueList whiteRoomContents;
        [SerializeField] private SerializableInkListItemValueList redRoomContents;
        [SerializeField] private SerializableInkListItemValueList greenRoomContents;
        [SerializeField] private SerializableInkListItemValueList yellowRoomContents;

        private void OnEnable()
        {
            Debug.Log("Registering");
            whiteRoomContents.Added.Register(OnWhiteRoomContentAdded);
            redRoomContents.Added.Register(OnRedRoomContentAdded);
            greenRoomContents.Added.Register(OnGreenRoomContentAdded);
            yellowRoomContents.Added.Register(OnYellowRoomContentAdded);

            whiteRoomContents.Removed.Register(OnWhiteRoomContentRemoved);
            redRoomContents.Removed.Register(OnRedRoomContentRemoved);
            greenRoomContents.Removed.Register(OnGreenRoomContentRemoved);
            yellowRoomContents.Removed.Register(OnYellowRoomContentRemoved);
        }

        private void OnYellowRoomContentAdded(SerializableInkListItem obj)
        {
            OnRoomContentAdded(Room.YellowRoom, obj);
        }

        private void OnGreenRoomContentAdded(SerializableInkListItem obj)
        {
            OnRoomContentAdded(Room.GreenRoom, obj);
        }

        private void OnRedRoomContentAdded(SerializableInkListItem obj)
        {
            Debug.Log("Red room changed");
            OnRoomContentAdded(Room.RedRoom, obj);
        }

        private void OnWhiteRoomContentAdded(SerializableInkListItem obj)
        {
            OnRoomContentAdded(Room.WhiteRoom, obj);
        }

        /// <summary>
        /// Event raised every time something is added to a room.
        /// </summary>
        public event EventHandler<RoomContentEventArgs> RoomContentAdded;

        private void OnRoomContentAdded(Room room, SerializableInkListItem serializableInkListItem)
        {
            RoomContentAdded?.Invoke(this, new RoomContentEventArgs
            {
                Room = room,
                SerializableInkListItem = serializableInkListItem
            });
        }

        private void OnYellowRoomContentRemoved(SerializableInkListItem obj)
        {
            OnRoomContentRemoved(Room.YellowRoom, obj);
        }

        private void OnGreenRoomContentRemoved(SerializableInkListItem obj)
        {
            OnRoomContentRemoved(Room.GreenRoom, obj);
        }

        private void OnRedRoomContentRemoved(SerializableInkListItem obj)
        {
            Debug.Log("Red room changed");
            OnRoomContentRemoved(Room.RedRoom, obj);
        }

        private void OnWhiteRoomContentRemoved(SerializableInkListItem obj)
        {
            OnRoomContentRemoved(Room.WhiteRoom, obj);
        }

        /// <summary>
        /// Event raised every time something is added to a room.
        /// </summary>
        public event EventHandler<RoomContentEventArgs> RoomContentRemoved;

        private void OnRoomContentRemoved(Room room, SerializableInkListItem serializableInkListItem)
        {
            RoomContentRemoved?.Invoke(this, new RoomContentEventArgs
            {
                Room = room,
                SerializableInkListItem = serializableInkListItem
            });
        }

        public IEnumerable<Character.Character> GetCharacters(Room room)
        {
            var list = room switch
            {
                Room.GreenRoom => greenRoomContents,
                Room.RedRoom => redRoomContents,
                Room.WhiteRoom => whiteRoomContents,
                Room.YellowRoom => yellowRoomContents,
                _ => throw new InvalidOperationException()
            };
            return list.List
                .Select(entry => Enum.TryParse<Character.Character>(entry.itemName, out var result)
                    ? (Character.Character?)result
                    : null)
                .WhereNotNull();
        }

        public Room GetCharacterRoom(Character.Character character)
        {
            foreach (Room room in Enum.GetValues(typeof(Room)))
            {
                if (GetCharacters(room).Contains(character))
                {
                    return room;
                }
            }

            throw new InvalidOperationException();
        }
    }
}