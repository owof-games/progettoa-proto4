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
//Usiamo questa funzione per rimuovere un oggetto dall'inventario di Ettore e depositarlo nella stanza in cui si trova    
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
    
//Usiamo questa funzione quando un oggetto specifico presente nello Storage deve comparire nella scena in cui si trova Ettore.  
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
 
 
 //Usiamo questa funzione quando una personaggia1 deve andare dove si trova una seconda personaggia.
 === function move_first_entity_to_second_entity_location(entity1,entity2)
{debug: <i>Passo per function move_first_entity_to_second_entity_location</i>}
    ~ temp entity2_location = entity_location(entity2)
    ~ move_entity(entity1, entity2_location)
//     {
//     - whiteRoomContents has entity2:
//         ~ move_entity(entity1, WhiteRoom)
//     - greenRoomContents has entity2:
//         ~ move_entity(entity1, GreenRoom)
//     - redRoomContents has entity2:
//         ~ move_entity(entity1, RedRoom)
//     - yellowRoomContents has entity2:
//         ~ move_entity(entity1, YellowRoom)
//  }
 

 //Usiamo questa funzione per capire quando possiamo origliare una conversazione: se la personaggia che sta parlando è in una delle stanze accanto a quella in cui si trova Ettore riusciamo a sentire, altrimenti no.
 === function is_this_entity_near_Ettore(entity)
{debug: <i>passo per is_this_room_near</i>}
~ temp CurrentLocation = entity_location(entity)
{
    - redRoomContents has Ettore && (CurrentLocation == WhiteRoom or CurrentLocation == GreenRoom):
        ~ return true
    - yellowRoomContents has Ettore && CurrentLocation== GreenRoom:
        ~ return true
    - greenRoomContents has Ettore && (CurrentLocation == YellowRoom or CurrentLocation == RedRoom):
        ~ return true
    - whiteRoomContents has Ettore && CurrentLocation == RedRoom:
        ~ return true
    - else:
        ~ return false
}



//Usiamo questa funzione quando per ragione di scena è necessario che una personaggia se ne vada da una stanza (ma non importa particolarmente dove vada)
=== function move_this_entity_in_a_different_room(entity)
{debug: <i>passo per is_this_room_near</i>}
{
- whiteRoomContents has Ettore:
        {shuffle:
        - 
            ~ move_entity(entity, RedRoom)
        - 
            ~move_entity(entity, GreenRoom)
        - 
            ~move_entity(entity, YellowRoom)
        }

- GreenRoom:
    {shuffle:
        -
            ~ move_entity(entity, YellowRoom)
        -
            ~ move_entity(entity, RedRoom)
    }
        
- YellowRoom:
            ~ move_entity(entity, GreenRoom)        
        
}       

