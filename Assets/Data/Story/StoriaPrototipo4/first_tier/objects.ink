=== cb_first_tier_limetta_unghie ===

+ {areTwoEntitiesTogether(Ettore, LimettaUnghie)} [object:LimettaUnghie]
    -> limetta_unghie ->


-> intro

= limetta_unghie 
    + (interagito) Controlla la limetta per le unghie
        + + {inventory_contents !? LimettaUnghie && interagito} Raccogli la limetta per le unghie
        ~ take_object(LimettaUnghie)
    + {inventory_contents has LimettaUnghie} Mostra limetta unghie
    + {inventory_contents has LimettaUnghie} Lascia limetta unghie
        ~ remove_entity(LimettaUnghie)
    + La lasci dov'è
    -
->->


=== cb_first_tier_antico_pugnale ===

+ {areTwoEntitiesTogether(Ettore, AnticoPugnale)} [object:AnticoPugnale]
    -> antico_pugnale ->


-> intro

= antico_pugnale
    + (interagito) Ispeziona il pugnale
    + {inventory_contents !? AnticoPugnale && interagito} Afferri il pugnale
        ~ take_object(AnticoPugnale)
    + {inventory_contents has AnticoPugnale} Mostra il pugnale
    + {inventory_contents has AnticoPugnale} Lascia il pugnale
        ~ remove_entity(AnticoPugnale)
    + Lo lasci dov'è
    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {areTwoEntitiesTogether(Ettore, SpiedinoCocktail)} [object:SpiedinoCocktail]
    -> spiedino_cocktail ->


-> intro

= spiedino_cocktail
    + (interagito) Osserva lo spiedino
    + {inventory_contents !? SpiedinoCocktail && interagito} Afferri lo spiedino
        ~ take_object(SpiedinoCocktail)
    + {inventory_contents has SpiedinoCocktail} Mostra lo spiedino
    + {inventory_contents has SpiedinoCocktail}  Lascia lo spiedino
        ~ remove_entity(SpiedinoCocktail)
    + Lo lasci dov'è
    -
->->


=== cb_first_tier_lettera ===

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