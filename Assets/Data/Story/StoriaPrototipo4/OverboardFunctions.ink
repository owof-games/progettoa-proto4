// FLOW QUERIES 
// What did we just say? 

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
    
// DISTRIBUTION 
// We often want to pick dialogue lines a bit randomly, but without getting too many of them 
// We build a few convenience functions for this:

// Return a probability of 33%
=== function maybe() 
    ~ return RANDOM(1, 3) == 1
    
// don't allow this choice if we've got other choices from this section    
=== function oneChoice(choiceCount) 
    ~ return choiceCount == CHOICE_COUNT()
    
// Used to randomly pick one choice from a block of options
=== function ranLim(choiceCount)  
    ~ return oneChoice(choiceCount) && maybe()

=== function limitToThree() 
    // Overboard's house style is to limit every moment to 3 choices maximum 
    // We actually do this in the UI, but you can do it in inky if you want to
    ~ return CHOICE_COUNT() < 3
    
    
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
