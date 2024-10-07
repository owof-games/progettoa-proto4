=== cb_first_tier_limetta_unghie ===
+ {are_two_entities_together(Ettore, LimettaUnghie)} [object:LimettaUnghie]
    -> limetta_unghie ->


-> intro

= limetta_unghie 
    + (primoCheck) [Osserva la limetta per le unghie]
        -> advance_time ->
        + + [Raccoglila]
        ~ take_object(LimettaUnghie)
        + + [Lasciala dov'è]
    // + {inventoryContents has LimettaUnghie} Mostra limetta unghie
    + {inventoryContents has LimettaUnghie} [Lascia la limetta nella stanza]
        ~ remove_entity(LimettaUnghie)
    -
->->


=== cb_first_tier_antico_pugnale ===

+ {are_two_entities_together(Ettore, AnticoPugnale)} [object:AnticoPugnale]
    -> antico_pugnale ->


-> intro

= antico_pugnale
    + (primoCheck) [Ispeziona il pugnale]
        -> advance_time ->
        + + [Raccoglilo]
        ~ take_object(AnticoPugnale)
        + + [Lascialo dov'è]
    // + {inventoryContents has AnticoPugnale} Mostra il pugnale
    + {inventoryContents has AnticoPugnale} [Lascia il pugnale nella stanza]
        ~ remove_entity(AnticoPugnale)

    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {are_two_entities_together(Ettore, SpiedinoCocktail)} [object:SpiedinoCocktail]
    -> spiedino_cocktail ->


-> intro

= spiedino_cocktail
    + (primoCheck) [Controlla lo spiedino]
        + + [Raccoglilo]
        ~ take_object(SpiedinoCocktail)
        + + [Lascialo dov'è]
    // + {inventoryContents has SpiedinoCocktail} Mostra lo spiedino
    + {inventoryContents has SpiedinoCocktail}  [Lascia lo spiedino nella stanza]
        ~ remove_entity(SpiedinoCocktail)
    
    -
->->


=== cb_first_tier_lettera ===

+ {are_two_entities_together(Ettore, Lettera)} [object:Lettera]
    -> lettera ->

-> intro


= lettera
    + (primoCheck) [Leggi la lettera]
        "So cosa hai fatto e la pagherai!"
        + + [Raccoglila]
        ~ take_object(Lettera)
        + + [Lasciala dov'è]
    // + {inventoryContents has Lettera} Mostra lettera
    + {inventoryContents has Lettera} [Lascia la lettera nella stanza]
        ~ remove_entity(Lettera)
    
    -
->->


=== cb_first_tier_bottiglia_di_vino ===

+ {are_two_entities_together(Ettore, BottigliaDiVino)} [object:Bottiglia di Vino]
    -> bottiglia_di_vino ->

-> intro


= bottiglia_di_vino
    + (primoCheck) [Ispeziona la bottiglia di vino]
        + + [Raccoglila]
        ~ take_object(BottigliaDiVino)
        + + [Lasciala dov'è]
    // + {inventoryContents has BottigliaDiVino} Mostra la bottiglia
    + {inventoryContents has BottigliaDiVino} [Lascia la bottiglia di vino nella stanza]
        ~ remove_entity(BottigliaDiVino)
    
    -
->->

=== cb_first_tier_flaconcino_asma ===
+ {are_two_entities_together(Ettore, FlaconcinoAsma)} [object:Flaconcino Asma]
    -> flaconcino_asma->

-> intro


= flaconcino_asma
    + (primoCheck) [Osserva il flaconcino per l'asma]
        + + [Raccoglilo]
        ~ take_object(FlaconcinoAsma)
        + + [Lascialo dov'è]
    // + {inventoryContents has FlaconcinoAsma} Mostra il flaconcino per l'asma
    + {inventoryContents has FlaconcinoAsma} [Lascia il flaconcino per l'asma nella stanza]
        ~ remove_entity(FlaconcinoAsma)
    
    -
->->

=== cb_first_tier_sigaretta_elettronica ===
+ {are_two_entities_together(Ettore, SigarettaElettronica)} [object:Sigaretta Elettronica]
    -> sigaretta_elettronica->

-> intro


= sigaretta_elettronica
    + (primoCheck) [Controlla la sigaretta elettronica]
        + + [Raccoglila]
        ~ take_object(SigarettaElettronica)
        + + [Lasciala dov'è]
    // + {inventoryContents has SigarettaElettronica} Mostra la sigaretta elettronica
    + {inventoryContents has SigarettaElettronica} [Lascia la sigaretta elettronica nella stanza]
        ~ remove_entity(SigarettaElettronica)
    
    -
->->

=== cb_first_tier_cibo ===
+ {are_two_entities_together(Ettore, Briciole)} [object:Briciole]
    -> cibo ->

-> intro


= cibo
    + (primoCheck) [Assaggia la torta]
        + + [Raccoglila]
        ~ take_object(Torta)
        + + [Lasciala dov'è]
    // + {inventoryContents has Briciole} Mostra cibo
    + {inventoryContents has Torta} [Lascia la torta nella stanza]
        ~ remove_entity(Torta)
    
    -
->->


