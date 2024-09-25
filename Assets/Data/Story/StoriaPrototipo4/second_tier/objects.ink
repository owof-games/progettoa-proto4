=== cb_second_tier_lettera ===

+ {areTwoEntitiesTogether(Ettore, Lettera)} [C'è una lettera]
    -> lettera ->


-> cb_second_tier



= lettera 
    + (interagito) [Leggi la lettera]
    + {inventory_contents !? Lettera && interagito} [Prendi la lettera]
        ~ take_object(Lettera)
    + {inventory_contents has Lettera} [Mostra la lettera]
    + La lasci dov'è
    -
->->