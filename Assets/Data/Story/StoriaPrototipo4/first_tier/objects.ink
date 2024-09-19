=== cb_first_tier_limetta_unghie ===

+ {areTwoEntitiesTogether(Ettore, LimettaUnghie)} [C'è una limetta da unghie]
    -> limetta_unghie ->


-> cb_first_tier

= limetta_unghie 
    + {inventory_contents !? LimettaUnghie}Raccogli la limetta per le unghie
    ~ takeObject(LimettaUnghie)
    + {inventory_contents has LimettaUnghie} Mostra limetta unghie
    + {inventory_contents has LimettaUnghie} Lascia limetta unghie
    + YYY
    -
->->


=== cb_first_tier_antico_pugnale ===

+ {areTwoEntitiesTogether(Ettore, AnticoPugnale)} [C'è un antico pugnale]
    -> antico_pugnale ->


-> cb_first_tier

= antico_pugnale
    + {inventory_contents !? AnticoPugnale}Afferri il pugnale
    ~ takeObject(AnticoPugnale)
    + {inventory_contents has AnticoPugnale} Mostra limetta unghie
    + {inventory_contents has AnticoPugnale} Lascia limetta unghie
    + Lo lasci dov'è
    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {areTwoEntitiesTogether(Ettore, SpiedinoCocktail)} [C'è uno spiedino da cocktail]
    -> spiedino_cocktail ->


-> cb_first_tier

= spiedino_cocktail
    + {inventory_contents !? SpiedinoCocktail}Afferri lo spiedino
    ~ takeObject(SpiedinoCocktail)
    + {inventory_contents has SpiedinoCocktail} Mostra limetta unghie
    + {inventory_contents has SpiedinoCocktail} Lascia limetta unghie
    + YYY
    -
->->


=== cb_first_tier_lettera ===

+ {areTwoEntitiesTogether(Ettore, Lettera)} [C'è una lettera]
    -> lettera ->

Lettera
-> cb_first_tier


= lettera 
    + {inventory_contents !? Lettera} Prendi la lettera
    ~ takeObject(Lettera)
    + {inventory_contents has Lettera} Mostra limetta unghie
    + {inventory_contents has Lettera} Lascia limetta unghie
    + YYY
    -
->->