
// activate debug text
VAR debug = false

// list of all characters
LIST characters = Paola, Elia, Zeca, Matteo, Greta, Ettore

// list of all objects
LIST objects = LimettaUnghie, AnticoPugnale, SpiedinoCocktail, Lettera

//list of variables to reset on every loop
LIST loopableVariables = EliaRaggiungeGreta

//list to set the current tier
LIST tierState = (FirstTier), SecondTier
////////////////////////////////////////////////////////////


// list of all places (the inventory is considered a physical place)
LIST places = Inventory, WhiteRoom, GreenRoom, RedRoom, YellowRoom, ObjectStorage

// variables for each location, containing the list of characters and objects in them
// can't name them like "white_room" because there are knots with that name
// inventory = mano di Ettore
VAR inventoryContents = ()
VAR whiteRoomContents = (Ettore, Matteo, Paola, Zeca, Elia, Greta, AnticoPugnale)
VAR greenRoomContents = (LimettaUnghie)
VAR redRoomContents = (Lettera)
VAR yellowRoomContents = ()
VAR objectStorageContents = (SpiedinoCocktail)


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

/**
 * Check if entity1 and entity2 are both in the same location.
 * E.g.:
 * Sei nella sala.
 * + {are_entities_together_in(Matteo, Ettore, WhiteRoom)} Parla con Matteo
 *   -> parla_con_matteo
 */
=== function are_entities_together_in(entity1, entity2, location)
{debug: <i>Passo per function are_entities_together_in</i>}
~ return entity_location(entity1) == entity_location(entity2) and entity_location(entity1) == location

//funzione solo per fare check presenza assieme personagge
=== function are_two_entitites_together(entity1, entity2)
{debug: <i>Passo per function are_two_entitites_together</i>}
~ return entity_location(entity1) == entity_location(entity2)

=== function are_three_entities_together(entity1, entity2, entity3)
{debug: <i>Passo per function are_three_entities_together</i>}
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity3)

=== function are_four_entities_together(entity1, entity2, entity3, entity4)
{debug: <i>Passo per function are_four_entities_together</i>}
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity3) && entity_location(entity4)

=== function are_five_entities_together(entity1, entity2, entity3, entity4, entity5)
{debug: <i>Passo per function are_five_entities_together</i>}
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity3) && entity_location(entity4) && entity_location(entity5)

=== function are_six_entities_together(entity1, entity2, entity3, entity4, entity5, entity6)
{debug: <i>Passo per function are_six_entities_together</i>}
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity3) && entity_location(entity4) && entity_location(entity5) && entity_location(entity6)

////////////////////////////////////////////////////////////



// variables containing the state of various objects
LIST limettaUnghieState = (Clean), Dirty
LIST paolaState = (Angry), Happy
LIST letteraState = (Whole), Torn
LIST anticoPugnaleState = (Clean), Dirty
LIST spiedinoCocktailState = (Whole), Broken

/*
 * Get the current status of an entity (object or character).
 * e.g.:
 * Paola è {get_status(Paola)}
 * ========> Paola è Happy
 */
=== function get_status(entity)
{ entity:
    - LimettaUnghie:
        ~ return limettaUnghieState
    - Paola:
        ~ return paolaState
    - Lettera:
        ~ return letteraState
    - AnticoPugnale:
        ~ return anticoPugnaleState
    - SpiedinoCocktail:
        ~ return spiedinoCocktailState   
    - else:
        DEBUG: error, entity {entity} has no state
        ~ return 0
}

/*
 * Change the status of an entity (object or character).
 * e.g.:
 * ~ change_status(Paola, Angry)
 * Paola adesso è {get_status(Paola)}
 ~ =======> Paola adesso è Angry
 */
=== function change_status(entity, new_status)
{ entity:
    - LimettaUnghie:
        ~ _change_status_inner(entity, new_status, limettaUnghieState)
    - AnticoPugnale:
        ~ _change_status_inner(entity, new_status, anticoPugnaleState)
    - SpiedinoCocktail:
        ~ _change_status_inner(entity, new_status, spiedinoCocktailState)
    - Lettera:
        ~ _change_status_inner(entity, new_status, letteraState)    
    - Paola:
        ~ _change_status_inner(entity, new_status, paolaState)
    - else:
        DEBUG: error, entity {entity} has no state
        ~ return 0
}

=== function _change_status_inner(entity, new_status, ref status_lst)
{ LIST_ALL(status_lst) has new_status:
    ~ status_lst = new_status
- else:
    DEBUG: error, entity {entity} does not support status {new_status} (supported states are: {LIST_ALL(status_lst)}).
}



////////////////////////////////////////////////////////////

/**
 * List of all the moments in time during a single loop
 POI SARANNO DA RAVVICINARE, ACCADE TUTTO IN UN'ORA?
 */
 
//NOTA: dopo un po' di prove, indicativamente 8 righe sono 15 secondi, per cui proverei a muovermi a blocchi di quindici. 

VAR currentTime = 0
/**
 * Print the current time.
 * E.g.:
 * Sono le {print_time()}
 * =======> Sono le 23:13
 */
=== function print_time()
{ currentTime:
    - 0:
        22:00:00
    - 15:
        22:00:15
    - 30:
        22:00:30
    - 45:
        22:00:45
    - 60:
        22:01:00
    - 120:
        22:02:00
    - 180:
        22:03:00
    - 240:
        22:04:00
    - 300:
        22:05:00
    - 360:
        22:06:00
    - 420:
        22:07:00
    - 480:
        22:08:00
    - 540:
        22:09:00
    - 600:
        22:10:00     
    - else:
        UNKNOWN TIME /INTERMEDIATE TIME {currentTime}
}

/**
 * Make the time advance one step, or trigger a loop.
 * Used in move_between_rooms.
 */
=== advance_time
{debug: <i>Passo per function advance_time</i>}
//~ temp max_time = LIST_MAX(LIST_ALL(currentTime))
{ currentTime >= 240:
    -> loop_reset
- else:
    ~ currentTime = currentTime + 15
}

~ updateEntitiesLocations()

->->


/**
 * Called whenever the loop resets. All state must be brought back
 * to its initial state here
 */
=== loop_reset
{debug: <i>Passo per function loop_reset</i>}
// set the current time
~ currentTime = 0
// clear story variables

~ loopableVariables = ()

TODO: trovare una soluzione più sensata che non il listone di variabili?
~ EliaActing = 0

// print something for the user
Questo è il testo che dice che è avvenuto un loop!

~ updateEntitiesLocations()

-> intro
