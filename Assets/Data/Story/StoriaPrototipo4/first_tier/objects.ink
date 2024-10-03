=== cb_first_tier_limetta_unghie ===

+ {are_two_entitites_together(Ettore, LimettaUnghie) && objects_tutorial} [object:LimettaUnghie]
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

+ {are_two_entitites_together(Ettore, AnticoPugnale) && objects_tutorial} [object:AnticoPugnale]
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

+ {are_two_entitites_together(Ettore, SpiedinoCocktail) && objects_tutorial} [object:SpiedinoCocktail]
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

+ {are_two_entitites_together(Ettore, Lettera) && objects_tutorial} [object:Lettera]
    -> lettera ->

-> intro


= lettera
    + Leggi la lettera
        "So cosa hai fatto, e la pagherai!"
        + + Prendi la lettera
        ~ take_object(Lettera)
        + + La lasci dov'è
    + {inventoryContents has Lettera} Mostra lettera
    + {inventoryContents has Lettera} Lascia lettera
        ~ remove_entity(Lettera)
    
    -
->->


=== cb_first_tier_bottiglia_di_vino ===

+ {are_two_entitites_together(Ettore, BottigliaDiVino) && objects_tutorial} [object:Bottiglia di Vino]
    -> bottiglia_di_vino ->

-> intro


= bottiglia_di_vino
    + Osservi la bottiglia
        + + Prendi la bottiglia
        ~ take_object(BottigliaDiVino)
        + + La lasci dov'è
    + {inventoryContents has BottigliaDiVino} Mostra la bottiglia
    + {inventoryContents has BottigliaDiVino} Lascia la bottiglia
        ~ remove_entity(BottigliaDiVino)
    
    -
->->

=== cb_first_tier_flaconcino_asma ===
+ {are_two_entitites_together(Ettore, FlaconcinoAsma) && objects_tutorial} [object:Flaconcino Asma]
    -> flaconcino_asma->

-> intro


= flaconcino_asma
    + Osservi il flaconcino per l'asma
        + + Prendi il flaconcino per l'asma
        ~ take_object(FlaconcinoAsma)
        + + La lasci dov'è
    + {inventoryContents has FlaconcinoAsma} Mostra il flaconcino per l'asma
    + {inventoryContents has FlaconcinoAsma} Lascia il flaconcino per l'asma
        ~ remove_entity(FlaconcinoAsma)
    
    -
->->

=== cb_first_tier_sigaretta_elettronica ===
+ {are_two_entitites_together(Ettore, SigarettaElettronica) && objects_tutorial} [object:Sigaretta Elettronica]
    -> sigaretta_elettronica->

-> intro


= sigaretta_elettronica
    + Osservi la sigaretta elettronica
        + + Prendi la sigaretta elettronica
        ~ take_object(SigarettaElettronica)
        + + La lasci dov'è
    + {inventoryContents has SigarettaElettronica} Mostra la sigaretta elettronica
    + {inventoryContents has SigarettaElettronica} Lascia la sigaretta elettronica
        ~ remove_entity(SigarettaElettronica)
    
    -
->->

=== cb_first_tier_cibo ===
+ {are_two_entitites_together(Ettore, Cibo) && objects_tutorial} [object:Cibo]
    -> cibo ->

-> intro


= cibo
    + Osservi cibo
        + + Prendi cibo
        ~ take_object(Cibo)
        + + La lasci dov'è
    + {inventoryContents has Cibo} Mostra cibo
    + {inventoryContents has Cibo} Lascia cibo
        ~ remove_entity(Cibo)
    
    -
->->


