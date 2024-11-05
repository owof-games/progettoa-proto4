// variables containing the state of various objects
LIST paolaState = (PaolaLive), PaolaUnalived
LIST gretaState = (GretaLive), GretaUnalived
LIST matteoState = (MatteoLive), MatteoUnalived
LIST eliaState = (EliaLive), EliaUnalived
LIST zecaState = (ZecaLive), ZecaUnalived
TODO: ho dovuto mettere delle variazioni Live, Unalived perché sennò chiamando la funzione mi diceva che il valore era ambiguo, ma non credo sia una buona soluzione XD

/*
 * Get the current status of an entity (object or character).
 * e.g.:
 * Paola è {get_status(Paola)}
 * ========> Paola è Happy
 */

=== function get_status(entity)
{ entity:
    - Paola:
        ~ return paolaState
        
    - Greta:
        ~ return gretaState 
        
    - Matteo:
        ~ return matteoState 
        
    - Elia:
        ~ return eliaState 
        
    - Zeca:
        ~ return zecaState 
        
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
    - Paola:
        ~ _change_status_inner(entity, new_status, paolaState)

    - Greta:
        ~ _change_status_inner(entity, new_status, gretaState)

    - Matteo:
        ~ _change_status_inner(entity, new_status, matteoState)

    - Elia:
        ~ _change_status_inner(entity, new_status, eliaState)

    - Zeca:
        ~ _change_status_inner(entity, new_status, zecaState)
    
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

