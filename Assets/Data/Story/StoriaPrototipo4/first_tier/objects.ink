=== cb_first_tier_limetta_unghie ===

+ {areTwoEntitiesTogether(Ettore, LimettaUnghie)} [object:LimettaUnghie]C'è una limetta da unghie
    -> limetta_unghie ->


-> intro

= limetta_unghie 
    + (interagito) [object:LimettaUnghie] Controlla la limetta per le unghie
    + {inventory_contents !? LimettaUnghie && interagito} [object:LimettaUnghie] Raccogli la limetta per le unghie
        ~ take_object(LimettaUnghie)
    + {inventory_contents has LimettaUnghie} [object:LimettaUnghie] Mostra limetta unghie
    + {inventory_contents has LimettaUnghie} [object:LimettaUnghie] Lascia limetta unghie
        ~ remove_entity(LimettaUnghie)
    + La lasci dov'è
    -
->->


=== cb_first_tier_antico_pugnale ===

+ {areTwoEntitiesTogether(Ettore, AnticoPugnale)} [object:AnticoPugnale]
    -> antico_pugnale ->


-> intro

= antico_pugnale
    + (interagito) [object:AnticoPugnale] Ispeziona il pugnale
    + {inventory_contents !? AnticoPugnale && interagito}[object:AnticoPugnale] Afferri il pugnale
        ~ take_object(AnticoPugnale)
    + {inventory_contents has AnticoPugnale} [object:AnticoPugnale] Mostra il pugnale
    + {inventory_contents has AnticoPugnale} [object:AnticoPugnale] Lascia il pugnale
        ~ remove_entity(AnticoPugnale)
    + Lo lasci dov'è
    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {areTwoEntitiesTogether(Ettore, SpiedinoCocktail)} [object:SpiedinoCocktail] C'è uno spiedino da cocktail
    -> spiedino_cocktail ->


-> intro

= spiedino_cocktail
    + (interagito) [object:SpiedinoCocktail] Osserva lo spiedino
    + {inventory_contents !? SpiedinoCocktail && interagito}[object:SpiedinoCocktail] Afferri lo spiedino
        ~ take_object(SpiedinoCocktail)
    + {inventory_contents has SpiedinoCocktail} [object:SpiedinoCocktail] Mostra lo spiedino
    + {inventory_contents has SpiedinoCocktail} [object:SpiedinoCocktail] Lascia lo spiedino
        ~ remove_entity(SpiedinoCocktail)
    + Lo lasci dov'è
    -
->->


=== cb_first_tier_lettera ===

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