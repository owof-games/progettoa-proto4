=== cb_second_tier_lettera ===

+ {are_two_entities_together(Ettore, Lettera)} [object:{Lettera}]
    -> lettera ->

-> intro


= lettera
    + (primoCheck) [Leggi la lettera]
    -> advance_time ->
        Ettore: La carta è lercia e la calligrafia minacciosa: <i>So cosa hai fatto e la pagherai!</i>. Ha un odore metallico.
        + + {inventoryContents == ()} [Raccoglila]
                ~ take_object(Lettera)
        + + {inventoryContents != ()} [Lascia l'oggetto che hai in mano e prendi questo.]
                ~ remove_entity(inventoryContents)
                ~ take_object(Lettera)
        + + [Lasciala dov'è]
    -
->->


=== cb_second_tier_bottiglia_di_vino ===

+ {are_two_entities_together(Ettore, BottigliaDiVino)} [object:{BottigliaDiVino}]
    -> bottiglia_di_vino ->

-> intro


= bottiglia_di_vino
    + (primoCheck) [Ispeziona la bottiglia di vino]
    -> advance_time ->
    Ettore: Il liquido è inquieto e torbido, e si agita nella bottiglia come fosse dotato di vita propria.
        + + {inventoryContents == ()} [Raccoglila]
                ~ take_object(BottigliaDiVino)
        + + {inventoryContents != ()} [Lascia l'oggetto che hai in mano e prendi questo.]
                ~ remove_entity(inventoryContents)
                ~ take_object(BottigliaDiVino)
        + + [Lasciala dov'è]
    -
->->

=== cb_second_tier_flaconcino_asma ===
+ {are_two_entities_together(Ettore, FlaconcinoAsma)} [object:{FlaconcinoAsma}]
    -> flaconcino_asma->

-> intro


= flaconcino_asma
    + (primoCheck) [Osserva il flaconcino per l'asma]
    -> advance_time ->
        Ettore: Banale pezzo di plastica, leggero e maleabile, a cui è aggrappata l'intera vita di una persona. Ed è vuoto.
        + + {inventoryContents == ()} [Raccoglilo]
                ~ take_object(FlaconcinoAsma)
        + + {inventoryContents != ()} [Lascia l'oggetto che hai in mano e prendi questo.]
                ~ remove_entity(inventoryContents)
                ~ take_object(FlaconcinoAsma)
        + + [Lascialo dov'è]
    -
->->

=== cb_second_tier_sigaretta_elettronica ===
+ {are_two_entities_together(Ettore, SigarettaElettronica)} [object:{SigarettaElettronica}]
    -> sigaretta_elettronica->

-> intro


= sigaretta_elettronica
    + (primoCheck) [Controlla la sigaretta elettronica]
    -> advance_time ->
    Ettore: Morte tascabile.
        + + {inventoryContents == ()} [Raccoglila]
                ~ take_object(SigarettaElettronica)
        + + {inventoryContents != ()} [Lascia l'oggetto che hai in mano e prendi questo.]
                ~ remove_entity(inventoryContents)
                ~ take_object(SigarettaElettronica)
        + + [Lasciala dov'è]
    -
->->

=== cb_second_tier_cibo ===
+ {are_two_entities_together(Ettore, Torta)} [object:{Torta}]
    -> cibo ->

-> intro


= cibo
    + (primoCheck) [Esamina la torta.]
    Ettore: Friabile come le proprie sicurezze, come un sacco d'ossa che cade dal sesto piano.
    -> advance_time ->
        + + {inventoryContents == ()} [Raccoglila]
                ~ take_object(Torta)
        + + {inventoryContents != ()} [Lascia l'oggetto che hai in mano e prendi questo.]
                ~ remove_entity(inventoryContents)
                ~ take_object(Torta)
        + + [Lasciala dov'è]
    -
->->


=== cb_second_tier_foto ===
+ {are_two_entities_together(Ettore, Foto)} [object:{Foto}]
    -> foto ->

-> intro


= foto
    + (primoCheck) [Esamina la foto]
    -> advance_time ->
        Ettore: Due persone. In un locale. Con l'urgenza di divorarsi.
        + + {inventoryContents == ()} [Raccoglila]
                ~ take_object(Foto)
        + + {inventoryContents != ()} [Lascia l'oggetto che hai in mano e prendi questo.]
                ~ remove_entity(inventoryContents)
                ~ take_object(Foto)
        + + [Lasciala dov'è]
    -
->->