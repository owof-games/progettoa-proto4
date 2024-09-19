=== cb_first_tier_limetta_unghie ===

+ {areTwoEntitiesTogether(Ettore, LimettaUnghie)} [C'è una limetta da unghie]
    -> limetta_unghie ->


-> cb_first_tier

= limetta_unghie 
    + (interagito) [Controlla la limetta per le unghie]
    + {inventory_contents !? LimettaUnghie && interagito}Raccogli la limetta per le unghie
        ~ takeObject(LimettaUnghie)
    + {inventory_contents has LimettaUnghie} Mostra limetta unghie
    + {inventory_contents has LimettaUnghie} Lascia limetta unghie
        ~ removeEntity(LimettaUnghie)
    + La lasci dov'è
    -
->->


=== cb_first_tier_antico_pugnale ===

+ {areTwoEntitiesTogether(Ettore, AnticoPugnale)} [C'è un antico pugnale]
    -> antico_pugnale ->


-> cb_first_tier

= antico_pugnale
    + (interagito) [Ispeziona il pugnale]
    + {inventory_contents !? AnticoPugnale && interagito}Afferri il pugnale
        ~ takeObject(AnticoPugnale)
    + {inventory_contents has AnticoPugnale} Mostra il pugnale
    + {inventory_contents has AnticoPugnale} Lascia il pugnale
        ~ removeEntity(AnticoPugnale)
    + Lo lasci dov'è
    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {areTwoEntitiesTogether(Ettore, SpiedinoCocktail)} [C'è uno spiedino da cocktail]
    -> spiedino_cocktail ->


-> cb_first_tier

= spiedino_cocktail
    + (interagito) [Osserva lo spiedino]
    + {inventory_contents !? SpiedinoCocktail && interagito}Afferri lo spiedino
        ~ takeObject(SpiedinoCocktail)
    + {inventory_contents has SpiedinoCocktail} Mostra lo spiedino
    + {inventory_contents has SpiedinoCocktail} Lascia lo spiedino
        ~ removeEntity(SpiedinoCocktail)
    + Lo lasci dov'è
    -
->->


=== cb_first_tier_lettera ===

+ {areTwoEntitiesTogether(Ettore, Lettera)} [C'è una lettera]
    -> lettera ->

Lettera
-> cb_first_tier


= lettera
    + (interagito) [Leggi la lettera]
    + {inventory_contents !? Lettera && interagito} Prendi la lettera
        ~ takeObject(Lettera)
    + {inventory_contents has Lettera} Mostra lettera
    + {inventory_contents has Lettera} Lascia lettera
        ~ removeEntity(Lettera)
    + La lasci dov'è
    -
->->