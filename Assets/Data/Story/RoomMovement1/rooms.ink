// list of all places (the hand is considered a physical place where something can be)
LIST Places = Hand, Room1, RoomRed, RoomGreen

// variables for each location, containing the list of characters and objects in them
// can't name them like "living_room" because there are knots with that name
VAR hand_contents = ()
VAR room1_contents = (Ettore)
VAR room_red_contents = ()
VAR room_green_contents = ()

/*
 * Get the location of the given entity (object or character). E.g.:
 La candela si trova in {entity_location(Candle)}.
 ----> La candela si trova in LivingRoom.
 Greta si trova in {entity_location(Greta)}.
 ----> Greta si trova in Hallway.
*/
=== function entity_location(entity)
{
  - hand_contents has entity:
    ~ return Hand
  - room1_contents has entity:
    ~ return Room1
  - room_red_contents has entity:
    ~ return RoomRed
  - room_green_contents has entity:
    ~ return RoomGreen
  - else:
      ~ throw_exception("error, cannot find {entity} anywhere!")
      ~ return 0
}

/*
 * Move an entity (object or character) from its current location to a new one. E.g.:
 ~ move_entity(Candle, Hallway)
 ~ move_entity(Greta, LivingRoom)
*/
=== function move_entity(entity, destination)
// get the current location
~ temp current_location = entity_location(entity)
// remove the entity from that location
{current_location:
  - Hand:
    ~ hand_contents -= entity
  - Room1:
    ~ room1_contents -= entity
  - RoomRed:
    ~ room_red_contents -= entity
  - RoomGreen:
    ~ room_green_contents -= entity
  - else:
    ~ throw_exception("did not consider location {current_location} while trying to move {entity} out of it")
}
// move the entity to the new location
{destination:
  - Hand:
    ~ hand_contents += entity
  - Room1:
    ~ room1_contents += entity
  - RoomRed:
    ~ room_red_contents += entity
  - RoomGreen:
    ~ room_green_contents += entity
  - else:
    ~ throw_exception("did not consider location {destination} while trying to move {entity} in it")
}
// if the entity is Ettore, also trigger the room switch animation
{entity == Ettore:
  @moveTo roomName:{destination}
}

/**
 * Check if entity1 and entity2 are both in the same location.
 * E.g.:
 * Sei nella sala.
 * + {areEntitiesTogetherIn(Matteo, Ettore, LivingRoom)} Parla con Matteo
 *   -> parla_con_matteo
 */
=== function areEntitiesTogetherIn(entity1, entity2, location)
~ return entity_location(entity1) == entity_location(entity2) and entity_location(entity1) == location