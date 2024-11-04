// variables containing the state of various objects
LIST paolaState = (Live), Unalived


/*
 * Get the current status of an entity (object or character).
 * e.g.:
 * Paola è {get_status(Paola)}
 * ========> Paola è Happy
 */
 TODO: fare anche per altri personaggi
=== function get_status(entity)
{ entity:
    - Paola:
        ~ return paolaState  
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

