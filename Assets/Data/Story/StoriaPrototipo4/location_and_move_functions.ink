/*
 * Get the location of the given entity (object or character). E.g.:
 La candela si trova in {entity_location(Candle)}.
 ----> La candela si trova in WhiteRoom.
 Greta si trova in {entity_location(Greta)}.
 ----> Greta si trova in Hallway.
*/
=== function entity_location(entity)
{
    - inventoryContents has entity:
        ~ return Inventory
    - whiteRoomContents has entity:
        ~ return WhiteRoom
    - greenRoomContents has entity:
        ~ return GreenRoom
    - redRoomContents has entity:
        ~ return RedRoom
    - yellowRoomContents has entity:
        ~ return YellowRoom
    - objectStorageContents has entity:
        ~ return ObjectStorage
    - else:
        DEBUG: error, cannot find {entity} anywhere!
        ~ return 0
}

/*
 * Move an entity (object or character) from its current location to a new one. E.g.:
 ~ move_entity(Candle, Hallway)
 ~ move_entity(Greta, WhiteRoom)
*/
=== function move_entity(entity, destination)
{debug: <i>Passo per function move_entity</i>}
~ temp CurrentLocation = entity_location(entity)
{CurrentLocation:
    - Inventory:
        ~ inventoryContents -= entity
    - WhiteRoom:
        ~ whiteRoomContents -= entity
    - GreenRoom:
        ~ greenRoomContents -= entity
    - RedRoom:
        ~ redRoomContents -= entity
    - YellowRoom:
        ~ yellowRoomContents -= entity
    - ObjectStorage:
        ~ objectStorageContents -= entity
    - else:
        DEBUG: error, cannot understand location {CurrentLocation} while trying to move {entity} out.
}
{destination:
    - Inventory:
        ~ inventoryContents += entity
    - WhiteRoom:
        ~ whiteRoomContents += entity
    - GreenRoom:
        ~ greenRoomContents += entity
    - RedRoom:
        ~ redRoomContents += entity
    - YellowRoom:
        ~ yellowRoomContents += entity
    - ObjectStorage:
        ~ objectStorageContents += entity
    - else:
        DEBUG: error, cannot understand location {destination} while trying to move {entity} in.
}

// if the entity is Ettore, also trigger the room switch animation
{entity == Ettore:
  @moveTo roomName:{destination}
}


//questa funzione verifica se ho spazio nell'inventario prima di permettermi di prendere un altro oggetto
=== function take_object(entity)
{debug: <i>Passo per function take_object</i>}
{
        - LIST_COUNT(inventoryContents) > 0:
            ~ throw_exception("Inventario pieno")
        - else:
                ~ inventoryContents += entity
                ~ whiteRoomContents -= entity
                ~ greenRoomContents -= entity
                ~ redRoomContents -= entity
                ~ yellowRoomContents -= entity

    }
    
=== function remove_entity(entity)
{debug: <i>Passo per function remove_entity</i>}
{
    - whiteRoomContents has Ettore:
        ~ whiteRoomContents += entity
        ~ inventoryContents -= entity
    - greenRoomContents has Ettore:
        ~ greenRoomContents += entity
        ~ inventoryContents -= entity
    - redRoomContents has Ettore:
        ~ redRoomContents += entity
        ~ inventoryContents -= entity
    - yellowRoomContents has Ettore:
        ~ yellowRoomContents += entity
        ~ inventoryContents -= entity

 }
    
=== function move_entity_from_object_storage_to_Ettore_location(entity)
{debug: <i>Passo per function move_entity_from_object_storage_to_Ettore_location</i>}
    {
    - whiteRoomContents has Ettore:
        ~ whiteRoomContents += entity
        ~ objectStorageContents -= entity
    - greenRoomContents has Ettore:
        ~ greenRoomContents += entity
        ~ objectStorageContents -= entity
    - redRoomContents has Ettore:
        ~ redRoomContents += entity
        ~ objectStorageContents -= entity
    - yellowRoomContents has Ettore:
        ~ yellowRoomContents += entity
        ~ objectStorageContents -= entity
 }
 
 === function move_first_entity_to_second_entity_location(entity1,entity2)
{debug: <i>Passo per function move_first_entity_to_second_entity_location</i>}
    {
    - whiteRoomContents has entity1:
        ~ move_entity(entity2, WhiteRoom)
    - greenRoomContents has entity1:
        ~ move_entity(entity2, GreenRoom)
    - redRoomContents has entity1:
        ~ move_entity(entity2, RedRoom)
    - yellowRoomContents has entity1:
        ~ move_entity(entity2, YellowRoom)
 }
 
 
 
 === function is_this_entity_near_Ettore(entity)
{debug: <i>passo per is_this_room_near</i>}
{
    - redRoomContents has Ettore && (entity_location == WhiteRoom or entity_location == GreenRoom):
        ~ return true
    - yellowRoomContents has Ettore && entity_location == GreenRoom:
        ~ return true
    - greenRoomContents has Ettore && (entity_location == YellowRoom or entity_location == RedRoom):
        ~ return true
    - whiteRoomContents has Ettore && entity_location == RedRoom:
        ~ return true
    - else:
        ~ return false
}

->->