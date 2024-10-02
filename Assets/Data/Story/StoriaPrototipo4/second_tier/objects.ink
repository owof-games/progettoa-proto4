=== cb_second_tier_lettera ===

+ {are_two_entitites_together(Ettore, Lettera)} [object:Lettera]
    -> lettera ->

-> intro


= lettera
    + Leggi la lettera
        + Prendi la lettera
            ~ take_object(Lettera)
        + La lasci dov'è
    + {inventoryContents has Lettera} Mostra lettera
    + {inventoryContents has Lettera} Lascia lettera
        ~ remove_entity(Lettera)

    -
->->