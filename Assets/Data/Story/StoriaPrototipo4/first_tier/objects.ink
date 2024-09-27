=== cb_first_tier_limetta_unghie ===

+ {are_two_entitites_together(Ettore, LimettaUnghie)} [object:LimettaUnghie]
    -> limetta_unghie ->


-> intro

= limetta_unghie 
    + (interagito) Controlla la limetta per le unghie
        -> advance_time ->
        + + {inventoryContents !? LimettaUnghie && interagito} Raccogli la limetta per le unghie
        ~ take_object(LimettaUnghie)
    + {inventoryContents has LimettaUnghie} Mostra limetta unghie
    + {inventoryContents has LimettaUnghie} Lascia limetta unghie
        ~ remove_entity(LimettaUnghie)
    + La lasci dov'è
    -
->->


=== cb_first_tier_antico_pugnale ===

+ {are_two_entitites_together(Ettore, AnticoPugnale)} [object:AnticoPugnale]
    -> antico_pugnale ->


-> intro

= antico_pugnale
    + (interagito) Ispeziona il pugnale
    + {inventoryContents !? AnticoPugnale && interagito} Afferri il pugnale
        ~ take_object(AnticoPugnale)
    + {inventoryContents has AnticoPugnale} Mostra il pugnale
    + {inventoryContents has AnticoPugnale} Lascia il pugnale
        ~ remove_entity(AnticoPugnale)
    + Lo lasci dov'è
    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {are_two_entitites_together(Ettore, SpiedinoCocktail)} [object:SpiedinoCocktail]
    -> spiedino_cocktail ->


-> intro

= spiedino_cocktail
    + (interagito) Osserva lo spiedino
    + {inventoryContents !? SpiedinoCocktail && interagito} Afferri lo spiedino
        ~ take_object(SpiedinoCocktail)
    + {inventoryContents has SpiedinoCocktail} Mostra lo spiedino
    + {inventoryContents has SpiedinoCocktail}  Lascia lo spiedino
        ~ remove_entity(SpiedinoCocktail)
    + Lo lasci dov'è
    -
->->


=== cb_first_tier_lettera ===

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