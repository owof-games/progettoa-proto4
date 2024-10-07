=== cb_second_tier_limetta_unghie ===

+ {are_two_entities_together(Ettore, LimettaUnghie)} [object:LimettaUnghie]
    -> limetta_unghie ->


-> intro

= limetta_unghie 
    + (primoCheck) Controlla la limetta per le unghie
        -> advance_time ->
        Una limetta consumata, con il logo di un noto franchise molto economico.
        + + Raccogli la limetta per le unghie
        ~ take_object(LimettaUnghie)
        + + La lasci dov'è
    // + {inventoryContents has LimettaUnghie} Mostra limetta unghie
    + {inventoryContents has LimettaUnghie} Lascia limetta unghie
        ~ remove_entity(LimettaUnghie)
    -
->->


=== cb_second_tier_antico_pugnale ===

+ {are_two_entities_together(Ettore, AnticoPugnale)} [object:AnticoPugnale]
    -> antico_pugnale ->


-> intro

= antico_pugnale
    + (primoCheck) [Ispeziona il pugnale]
        -> advance_time ->
        Un pugnale dall'aria antica, con simboli che non hai mai visto.
        + + [Raccoglilo]
        ~ take_object(AnticoPugnale)
        + + [Lascialo dov'è]
    // + {inventoryContents has AnticoPugnale} Mostra il pugnale
    + {inventoryContents has AnticoPugnale} [Lascia il pugnale nella stanza]
        ~ remove_entity(AnticoPugnale)

    -
->->



=== cb_second_tier_spiedino_cocktail ===

+ {are_two_entities_together(Ettore, SpiedinoCocktail)} [object:SpiedinoCocktail]
    -> spiedino_cocktail ->


-> intro

= spiedino_cocktail
    + (primoCheck) [Controlla lo spiedino]
    -> advance_time ->
     Un banale spiedino da cocktail. In controluce si legge la sigla <i>FEG</i>
        + + [Raccoglilo]
        ~ take_object(SpiedinoCocktail)
        + + [Lascialo dov'è]
    // + {inventoryContents has SpiedinoCocktail} Mostra lo spiedino
    + {inventoryContents has SpiedinoCocktail}  [Lascia lo spiedino nella stanza]
        ~ remove_entity(SpiedinoCocktail)
    
    -
->->


=== cb_second_tier_lettera ===

+ {are_two_entities_together(Ettore, Lettera)} [object:Lettera]
    -> lettera ->

-> intro


= lettera
    + (primoCheck) [Leggi la lettera]
    -> advance_time ->
        Con una calligrafia nervosa è stato scritto: <i>So cosa hai fatto e la pagherai!</i>. Non c'è firma.
        + + [Raccoglila]
        ~ take_object(Lettera)
        + + [Lasciala dov'è]
    // + {inventoryContents has Lettera} Mostra lettera
    + {inventoryContents has Lettera} [Lascia la lettera nella stanza]
        ~ remove_entity(Lettera)
    
    -
->->


=== cb_second_tier_bottiglia_di_vino ===

+ {are_two_entities_together(Ettore, BottigliaDiVino)} [object:Bottiglia di Vino]
    -> bottiglia_di_vino ->

-> intro


= bottiglia_di_vino
    + (primoCheck) [Ispeziona la bottiglia di vino]
    -> advance_time ->
    Un negramaro di prestigio. Probabilmente costa più di quanto tu possa guadagnare in metà mese.
        + + [Raccoglila]
        ~ take_object(BottigliaDiVino)
        + + [Lasciala dov'è]
    // + {inventoryContents has BottigliaDiVino} Mostra la bottiglia
    + {inventoryContents has BottigliaDiVino} [Lascia la bottiglia di vino nella stanza]
        ~ remove_entity(BottigliaDiVino)
    
    -
->->

=== cb_second_tier_flaconcino_asma ===
+ {are_two_entities_together(Ettore, FlaconcinoAsma)} [object:Flaconcino Asma]
    -> flaconcino_asma->

-> intro


= flaconcino_asma
    + (primoCheck) [Osserva il flaconcino per l'asma]
    -> advance_time ->
        Un comune flaconcino. O, con un po' di fantasia, il periscopio di un sottomarino.
        + + [Raccoglilo]
        ~ take_object(FlaconcinoAsma)
        + + [Lascialo dov'è]
    // + {inventoryContents has FlaconcinoAsma} Mostra il flaconcino per l'asma
    + {inventoryContents has FlaconcinoAsma} [Lascia il flaconcino per l'asma nella stanza]
        ~ remove_entity(FlaconcinoAsma)
    
    -
->->

=== cb_second_tier_sigaretta_elettronica ===
+ {are_two_entities_together(Ettore, SigarettaElettronica)} [object:Sigaretta Elettronica]
    -> sigaretta_elettronica->

-> intro


= sigaretta_elettronica
    + (primoCheck) [Controlla la sigaretta elettronica]
    -> advance_time ->
    Ha l'odore di un deodorante per il bagno, ma per il resto, niente di particolare.
        + + [Raccoglila]
        ~ take_object(SigarettaElettronica)
        + + [Lasciala dov'è]
    // + {inventoryContents has SigarettaElettronica} Mostra la sigaretta elettronica
    + {inventoryContents has SigarettaElettronica} [Lascia la sigaretta elettronica nella stanza]
        ~ remove_entity(SigarettaElettronica)
    
    -
->->

=== cb_second_tier_cibo ===
+ {are_two_entities_together(Ettore, Briciole)} [object:Briciole]
    -> cibo ->

-> intro


= cibo
    + (primoCheck) [Assaggia la torta]
    -> advance_time ->
    Il paradiso di un dodicenne: cioccolata, crema di arachidi, fragole, biscottini sbriciolati. La adori.
        + + [Raccoglila]
        ~ take_object(Torta)
        + + [Lasciala dov'è]
    // + {inventoryContents has Briciole} Mostra cibo
    + {inventoryContents has Torta} [Lascia la torta nella stanza]
        ~ remove_entity(Torta)
    
    -
->->


=== cb_second_tier_foto ===
+ {are_two_entities_together(Ettore, Foto)} [object:Foto]
    -> foto ->

-> intro


= foto
    + (primoCheck) [Esamina la foto]
    -> advance_time ->
        Due persone. In un locale. Due minuti prima di spogliarsi.
        + + [Raccoglila]
        ~ take_object(Foto)
        + + [Lasciala dov'è]
    + {inventoryContents has Foto} [Lascia la foto nella stanza]
        ~ remove_entity(Foto)
    
    -
->->