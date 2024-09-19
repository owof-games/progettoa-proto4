=== cb_second_tier_lettera ===

+ {areTwoEntitiesTogether(Ettore, Lettera)} [C'è una lettera]
    -> lettera ->


-> cb_second_tier



= lettera 
    + {inventory_contents !? Lettera}Prendi la lettera
    ~ takeObject(Lettera)
    + {inventory_contents has Lettera} Mostra limetta unghie
    + {inventory_contents has Lettera} Lascia limetta unghie
    + YYY
    -
->->