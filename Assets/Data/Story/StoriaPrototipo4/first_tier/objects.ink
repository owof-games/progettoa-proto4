=== cb_first_tier_limetta_unghie ===
+ {are_two_entities_together(Ettore, LimettaUnghie)} [object:LimettaUnghie]
    -> limetta_unghie ->


-> intro

= limetta_unghie 
    + (primoCheck)Controlla la limetta per le unghie
        -> advance_time ->
        + + Raccogli la limetta per le unghie
        ~ take_object(LimettaUnghie)
        + + La lasci dov'è
    // + {inventoryContents has LimettaUnghie} Mostra limetta unghie
    + {inventoryContents has LimettaUnghie} Lascia limetta unghie
        ~ remove_entity(LimettaUnghie)
    -
->->


=== cb_first_tier_antico_pugnale ===

+ {are_two_entities_together(Ettore, AnticoPugnale)} [object:AnticoPugnale]
    -> antico_pugnale ->


-> intro

= antico_pugnale
    + (primoCheck) Ispeziona il pugnale
        -> advance_time ->
        + + Afferri il pugnale
        ~ take_object(AnticoPugnale)
        + + Lo lasci dov'è    
    // + {inventoryContents has AnticoPugnale} Mostra il pugnale
    + {inventoryContents has AnticoPugnale} Lascia il pugnale
        ~ remove_entity(AnticoPugnale)

    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {are_two_entities_together(Ettore, SpiedinoCocktail)} [object:SpiedinoCocktail]
    -> spiedino_cocktail ->


-> intro

= spiedino_cocktail
    + (primoCheck) Osserva lo spiedino
        + + Afferri lo spiedino
        ~ take_object(SpiedinoCocktail)
        + + Lo lasci dov'è
    // + {inventoryContents has SpiedinoCocktail} Mostra lo spiedino
    + {inventoryContents has SpiedinoCocktail}  Lascia lo spiedino
        ~ remove_entity(SpiedinoCocktail)
    
    -
->->


=== cb_first_tier_lettera ===

+ {are_two_entities_together(Ettore, Lettera)} [object:Lettera]
    -> lettera ->

-> intro


= lettera
    + (primoCheck) Leggi la lettera
        "So cosa hai fatto, e la pagherai!"
        + + Prendi la lettera
        ~ take_object(Lettera)
        + + La lasci dov'è
    // + {inventoryContents has Lettera} Mostra lettera
    + {inventoryContents has Lettera} Lascia lettera
        ~ remove_entity(Lettera)
    
    -
->->


=== cb_first_tier_bottiglia_di_vino ===

+ {are_two_entities_together(Ettore, BottigliaDiVino)} [object:Bottiglia di Vino]
    -> bottiglia_di_vino ->

-> intro


= bottiglia_di_vino
    + (primoCheck) Osservi la bottiglia
        + + Prendi la bottiglia
        ~ take_object(BottigliaDiVino)
        + + La lasci dov'è
    // + {inventoryContents has BottigliaDiVino} Mostra la bottiglia
    + {inventoryContents has BottigliaDiVino} Lascia la bottiglia
        ~ remove_entity(BottigliaDiVino)
    
    -
->->

=== cb_first_tier_flaconcino_asma ===
+ {are_two_entities_together(Ettore, FlaconcinoAsma)} [object:Flaconcino Asma]
    -> flaconcino_asma->

-> intro


= flaconcino_asma
    + (primoCheck) Osservi il flaconcino per l'asma
        + + Prendi il flaconcino per l'asma
        ~ take_object(FlaconcinoAsma)
        + + La lasci dov'è
    // + {inventoryContents has FlaconcinoAsma} Mostra il flaconcino per l'asma
    + {inventoryContents has FlaconcinoAsma} Lascia il flaconcino per l'asma
        ~ remove_entity(FlaconcinoAsma)
    
    -
->->

=== cb_first_tier_sigaretta_elettronica ===
+ {are_two_entities_together(Ettore, SigarettaElettronica)} [object:Sigaretta Elettronica]
    -> sigaretta_elettronica->

-> intro


= sigaretta_elettronica
    + (primoCheck) Osservi la sigaretta elettronica
        + + Prendi la sigaretta elettronica
        ~ take_object(SigarettaElettronica)
        + + La lasci dov'è
    // + {inventoryContents has SigarettaElettronica} Mostra la sigaretta elettronica
    + {inventoryContents has SigarettaElettronica} Lascia la sigaretta elettronica
        ~ remove_entity(SigarettaElettronica)
    
    -
->->

=== cb_first_tier_cibo ===
+ {are_two_entities_together(Ettore, Briciole)} [object:Briciole]
    -> cibo ->

-> intro


= cibo
    + (primoCheck) Osservi cibo
        + + Prendi cibo
        ~ take_object(Briciole)
        + + La lasci dov'è
    // + {inventoryContents has Briciole} Mostra cibo
    + {inventoryContents has Briciole} Lascia cibo
        ~ remove_entity(Briciole)
    
    -
->->


