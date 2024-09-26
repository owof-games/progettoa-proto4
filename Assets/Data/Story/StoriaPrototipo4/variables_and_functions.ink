
// activate debug text
VAR debug = true

// list of all characters
LIST Characters = Paola, Elia, Zeca, Matteo, Greta, Ettore

// list of all objects
LIST Objects = LimettaUnghie, AnticoPugnale, SpiedinoCocktail, Lettera

//list of variables to reset on every loop
LIST LoopableVariables = elia_raggiunge_Greta

//list to set the current tier
LIST TierState = (first_tier), second_tier
////////////////////////////////////////////////////////////


// list of all places (the inventory is considered a physical place)
LIST Places = Inventory, WhiteRoom, GreenRoom, RedRoom, YellowRoom, ObjectStorage

// variables for each location, containing the list of characters and objects in them
// can't name them like "white_room" because there are knots with that name
// inventory = mano di Ettore
VAR inventory_contents = ()
VAR white_room_contents = (Ettore, Matteo, Paola, Zeca, Elia, Greta, AnticoPugnale)
VAR green_room_contents = (LimettaUnghie)
VAR red_room_contents = (Lettera)
VAR yellow_room_contents = ()
VAR object_storage_contents = (SpiedinoCocktail)


/*
 * Get the location of the given entity (object or character). E.g.:
 La candela si trova in {entity_location(Candle)}.
 ----> La candela si trova in WhiteRoom.
 Greta si trova in {entity_location(Greta)}.
 ----> Greta si trova in Hallway.
*/
=== function entity_location(entity)
{
    - inventory_contents has entity:
        ~ return Inventory
    - white_room_contents has entity:
        ~ return WhiteRoom
    - green_room_contents has entity:
        ~ return GreenRoom
    - red_room_contents has entity:
        ~ return RedRoom
    - yellow_room_contents has entity:
        ~ return YellowRoom
    - object_storage_contents has entity:
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
~ temp current_location = entity_location(entity)
{current_location:
    - Inventory:
        ~ inventory_contents -= entity
    - WhiteRoom:
        ~ white_room_contents -= entity
    - GreenRoom:
        ~ green_room_contents -= entity
    - RedRoom:
        ~ red_room_contents -= entity
    - YellowRoom:
        ~ yellow_room_contents -= entity
    - ObjectStorage:
        ~ object_storage_contents -= entity
    - else:
        DEBUG: error, cannot understand location {current_location} while trying to move {entity} out.
}
{destination:
    - Inventory:
        ~ inventory_contents += entity
    - WhiteRoom:
        ~ white_room_contents += entity
    - GreenRoom:
        ~ green_room_contents += entity
    - RedRoom:
        ~ red_room_contents += entity
    - YellowRoom:
        ~ yellow_room_contents += entity
    - ObjectStorage:
        ~ object_storage_contents += entity
    - else:
        DEBUG: error, cannot understand location {destination} while trying to move {entity} in.
}

// if the entity is Ettore, also trigger the room switch animation
{entity == Ettore:
  @moveTo roomName:{destination}
}


//questa funzione verifica se ho spazio nell'inventario prima di permettermi di prendere un altro oggetto
=== function take_object(entity)
{
        - LIST_COUNT(inventory_contents) > 0:
            ~ throw_exception("Inventario pieno")
        - else:
                ~ inventory_contents += entity
                ~ white_room_contents -= entity
                ~ green_room_contents -= entity
                ~ red_room_contents -= entity
                ~ yellow_room_contents -= entity

    }
    
=== function remove_entity(entity)
{
    - white_room_contents has Ettore:
        ~ white_room_contents += entity
        ~ inventory_contents -= entity
    - green_room_contents has Ettore:
        ~ green_room_contents += entity
        ~ inventory_contents -= entity
    - red_room_contents has Ettore:
        ~ red_room_contents += entity
        ~ inventory_contents -= entity
    - yellow_room_contents has Ettore:
        ~ yellow_room_contents += entity
        ~ inventory_contents -= entity

 }
    
=== function move_entity_from_object_storage_to_Ettore_location(entity)
    {
    - white_room_contents has Ettore:
        ~ white_room_contents += entity
        ~ object_storage_contents -= entity
    - green_room_contents has Ettore:
        ~ green_room_contents += entity
        ~ object_storage_contents -= entity
    - red_room_contents has Ettore:
        ~ red_room_contents += entity
        ~ object_storage_contents -= entity
    - yellow_room_contents has Ettore:
        ~ yellow_room_contents += entity
        ~ object_storage_contents -= entity
 }

/**
 * Check if entity1 and entity2 are both in the same location.
 * E.g.:
 * Sei nella sala.
 * + {areEntitiesTogetherIn(Matteo, Ettore, WhiteRoom)} Parla con Matteo
 *   -> parla_con_matteo
 */
=== function areEntitiesTogetherIn(entity1, entity2, location)
~ return entity_location(entity1) == entity_location(entity2) and entity_location(entity1) == location

//funzione solo per fare check presenza assieme personagge
=== function areTwoEntitiesTogether(entity1, entity2)
~ return entity_location(entity1) == entity_location(entity2)

=== function areThreeEntitiesTogether(entity1, entity2, entity3)
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity3)

=== function areFourEntitiesTogether(entity1, entity2, entity3, entity4)
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity3) && entity_location(entity4)

=== function areFiveEntitiesTogether(entity1, entity2, entity3, entity4, entity5)
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity3) && entity_location(entity4) && entity_location(entity5)

=== function areSixEntitiesTogether(entity1, entity2, entity3, entity4, entity5, entity6)
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity3) && entity_location(entity4) && entity_location(entity5) && entity_location(entity6)

////////////////////////////////////////////////////////////



// variables containing the state of various objects
LIST limettaUnghie_state = (Clean), Dirty
LIST paola_state = (Angry), Happy
LIST lettera_state = (Whole), Torn
LIST anticoPugnale_state = (Clean), Dirty
LIST spiedinoCocktail_state = (Whole), Broken

/*
 * Get the current status of an entity (object or character).
 * e.g.:
 * Paola è {get_status(Paola)}
 * ========> Paola è Happy
 */
=== function get_status(entity)
{ entity:
    - LimettaUnghie:
        ~ return limettaUnghie_state
    - Paola:
        ~ return paola_state
    - Lettera:
        ~ return lettera_state
    - AnticoPugnale:
        ~ return anticoPugnale_state
    - SpiedinoCocktail:
        ~ return spiedinoCocktail_state   
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
        ~ _change_status_inner(entity, new_status, limettaUnghie_state)
    - AnticoPugnale:
        ~ _change_status_inner(entity, new_status, anticoPugnale_state)
    - SpiedinoCocktail:
        ~ _change_status_inner(entity, new_status, spiedinoCocktail_state)
    - Lettera:
        ~ _change_status_inner(entity, new_status, lettera_state)    
    - Paola:
        ~ _change_status_inner(entity, new_status, paola_state)
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
LIST current_time = (Time_22_35), Time_23_13, Time_00_12, Time_01_49

/**
 * Print the current time.
 * E.g.:
 * Sono le {print_time()}
 * =======> Sono le 23:13
 */
=== function print_time()
{ current_time:
    - Time_22_35:
        22:35
    - Time_23_13:
        23:13
    - Time_00_12:
        00:12
    - Time_01_49:
        01:49
    - else:
        UNKNOWN TIME {current_time}
}

/**
 * Make the time advance one step, or trigger a loop.
 * Used in move_between_rooms.
 */
=== function advance_time()
~ temp max_time = LIST_MAX(LIST_ALL(current_time))
{ current_time == max_time:
    ~ loop_reset()
- else:
    ~ current_time++
}

~ updateEntitiesLocations()


/**
 * Called whenever the loop resets. All state must be brought back
 * to its initial state here
 */
=== function loop_reset()
// set the current time
~ current_time = Time_22_35
// clear story variables

~ LoopableVariables = ()

TODO: trovare una soluzione più sensata
~ EliaActing = 0

// print something for the user
Questo è il testo che dice che è avvenuto un loop!


/**
 * Update the location of the various entities according to the timeline.
 */

=== function new_this_loop(-> x)
// only fail if we've seen both at all...
  {  loop_reset && TURNS_SINCE(x) >= 0:
      // and we saw the choice more recently than the reset
       { TURNS_SINCE(x) < TURNS_SINCE(-> loop_reset):
            ~ return false
       }
  }
  ~ return true
