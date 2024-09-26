=== cb_second_tier_lettera ===

+ {areTwoEntitiesTogether(Ettore, Lettera)} [object:Lettera]
    -> lettera ->

-> intro


= lettera
    + (interagito) Leggi la lettera
    + {inventory_contents !? Lettera && interagito} Prendi la lettera
        ~ take_object(Lettera)
    + {inventory_contents has Lettera} Mostra lettera
    + {inventory_contents has Lettera} Lascia lettera
        ~ remove_entity(Lettera)
    + La lasci dov'è
    -
->->