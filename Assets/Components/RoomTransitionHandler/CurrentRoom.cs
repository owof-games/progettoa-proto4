using Components.Story.Rooms;
using UnityEngine;

namespace Components.RoomTransitionHandler
{
    public class CurrentRoom : MonoBehaviour
    {
        [SerializeField] private Room room;

        public static Room GetRoomOf(GameObject gameObject)
        {
            return gameObject.scene.GetRootGameObjects()[0].GetComponent<CurrentRoom>().room;
        }
    }
}