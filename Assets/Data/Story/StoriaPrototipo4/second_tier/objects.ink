=== cb_second_tier_lettera ===

+ {are_two_entitites_together(Ettore, Lettera)} [object:Lettera]
    -> lettera ->

-> intro


= lettera
    + (interagito) Leggi la lettera
    + {inventoryContents !? Lettera && interagito} Prendi la lettera
        ~ take_object(Lettera)
    + {inventoryContents has Lettera} Mostra lettera
    + {inventoryContents has Lettera} Lascia lettera
        ~ remove_entity(Lettera)
    + La lasci dov'è
    -
->->