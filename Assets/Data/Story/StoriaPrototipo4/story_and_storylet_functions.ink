
/**
 * Update the location of the various entities according to the timeline.
 */

=== function new_this_loop(-> x)
{
    - loop_reset == 0:
        // non c'è stato ancora nessun loop: mi baso solo sul fatto che sia passato o meno dal nodo
        ~ return TURNS_SINCE(x) < 0
    - else:
        // c'è stato almeno un loop: controllo se sono passato o meno dal nodo dopo l'ultimo loop
        ~ temp turns_since_loop = TURNS_SINCE(-> loop_reset)
        ~ temp turns_since_this_knot = TURNS_SINCE(x)
        {
            - turns_since_loop < turns_since_this_knot:
                ~ return true
            -
                ~ return false
        }
}

 === function seen_in_this_loop(-> x)
{debug: <i>Passo per function seen_in_this_loop</i>}
~ return !new_this_loop(x)


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
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity2) == entity_location(entity3)

=== function are_four_entities_together(entity1, entity2, entity3, entity4)
{debug: <i>Passo per function are_four_entities_together</i>}
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity2) == entity_location(entity3) && entity_location(entity3) == entity_location(entity4)

=== function are_five_entities_together(entity1, entity2, entity3, entity4, entity5)
{debug: <i>Passo per function are_five_entities_together</i>}
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity2) == entity_location(entity3) && entity_location(entity3) == entity_location(entity4) && entity_location(entity4) == entity_location(entity5)

=== function are_six_entities_together(entity1, entity2, entity3, entity4, entity5, entity6)
{debug: <i>Passo per function are_six_entities_together</i>}
~ return entity_location(entity1) == entity_location(entity2) && entity_location(entity2) == entity_location(entity3) && entity_location(entity3) == entity_location(entity4) && entity_location(entity4) == entity_location(entity5) && entity_location(entity5) == entity_location(entity6)



// FLOW QUERIES: DA OVERBOARD

=== function seen_ever(->x)
    // has this piece of content ever been seen?
    ~ return TURNS_SINCE(x) >= 0 

=== function came_from(-> x) 
    // were you at "x" during this turn
    ~ return TURNS_SINCE(x) == 0
    
=== function one_turn_after(-> x) 
    // were you at "x" during the last turn (or this one)
    ~ return TURNS_SINCE(x) <= 1 && seen_ever(x)
    
=== function seen_very_recently(-> x)
    // did we see this line recently?
    ~ return TURNS_SINCE(x) <= 3 && seen_ever(x)
    
    
    