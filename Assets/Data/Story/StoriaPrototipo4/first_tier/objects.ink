=== cb_first_tier_limetta_unghie ===

+ {are_two_entitites_together(Ettore, LimettaUnghie)} [object:LimettaUnghie]
    -> limetta_unghie ->


-> intro

= limetta_unghie 
    + Controlla la limetta per le unghie
        -> advance_time ->
        + + Raccogli la limetta per le unghie
        ~ take_object(LimettaUnghie)
        + + La lasci dov'è
    + {inventoryContents has LimettaUnghie} Mostra limetta unghie
    + {inventoryContents has LimettaUnghie} Lascia limetta unghie
        ~ remove_entity(LimettaUnghie)
    -
->->


=== cb_first_tier_antico_pugnale ===

+ {are_two_entitites_together(Ettore, AnticoPugnale)} [object:AnticoPugnale]
    -> antico_pugnale ->


-> intro

= antico_pugnale
    + Ispeziona il pugnale
        -> advance_time ->
        + + Afferri il pugnale
        ~ take_object(AnticoPugnale)
        + + Lo lasci dov'è    
    + {inventoryContents has AnticoPugnale} Mostra il pugnale
    + {inventoryContents has AnticoPugnale} Lascia il pugnale
        ~ remove_entity(AnticoPugnale)

    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {are_two_entitites_together(Ettore, SpiedinoCocktail)} [object:SpiedinoCocktail]
    -> spiedino_cocktail ->


-> intro

= spiedino_cocktail
    + Osserva lo spiedino
        + + Afferri lo spiedino
        ~ take_object(SpiedinoCocktail)
        + + Lo lasci dov'è
    + {inventoryContents has SpiedinoCocktail} Mostra lo spiedino
    + {inventoryContents has SpiedinoCocktail}  Lascia lo spiedino
        ~ remove_entity(SpiedinoCocktail)
    
    -
->->


=== cb_first_tier_lettera ===

+ {are_two_entitites_together(Ettore, Lettera)} [object:Lettera]
    -> lettera ->

-> intro


= lettera
    + Leggi la lettera
        + + Prendi la lettera
        ~ take_object(Lettera)
        + + La lasci dov'è
    + {inventoryContents has Lettera} Mostra lettera
    + {inventoryContents has Lettera} Lascia lettera
        ~ remove_entity(Lettera)
    
    -
->->