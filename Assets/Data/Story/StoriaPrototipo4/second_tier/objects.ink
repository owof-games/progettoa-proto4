=== cb_second_tier_lettera ===

+ {are_two_entities_together(Ettore, Lettera)} [object:{Lettera}]
    -> lettera ->

-> intro


= lettera
    + (primoCheck) [Leggi la lettera]
    -> advance_time ->
        La carta è lercia e la calligrafia minacciosa: <i>So cosa hai fatto e la pagherai!</i>. Ha un odore metallico.
        + + [Raccoglila]
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
    Il liquido è inquieto e torbido, e si agita nella bottiglia come fosse dotato di vita propria.
        + + [Raccoglila]
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
        Banale pezzo di plastica, leggero e maleabile, a cui è aggrappata l'intera vita di una persona. Ed è vuoto.
        + + [Raccoglilo]
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
    Morte tascabile.
        + + [Raccoglila]
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
    Friabile come le proprie sicurezze, come un sacco d'ossa che cade dal sesto piano.
    -> advance_time ->
        + + [Raccoglila]
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
        Due persone. In un locale. Con l'urgenza di divorarsi.
        + + [Raccoglila]
        ~ take_object(Foto)
        + + [Lasciala dov'è]
    -
->->