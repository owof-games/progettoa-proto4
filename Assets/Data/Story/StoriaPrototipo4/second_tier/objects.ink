=== cb_second_tier_lettera ===

+ {areTwoEntitiesTogether(Ettore, Lettera)} [object:Lettera] C'è una lettera
    -> lettera ->

-> intro


= lettera
    + (interagito) [object:Lettera] Leggi la lettera
    + {inventory_contents !? Lettera && interagito} [object:Lettera] Prendi la lettera
        ~ take_object(Lettera)
    + {inventory_contents has Lettera} [object:Lettera] Mostra lettera
    + {inventory_contents has Lettera} [object:Lettera] Lascia lettera
        ~ remove_entity(Lettera)
    + La lasci dov'è
    -
->->