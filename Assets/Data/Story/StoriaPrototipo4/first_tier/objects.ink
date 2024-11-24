=== cb_first_tier_limetta_unghie ===
+ {are_two_entities_together(Ettore, LimettaUnghie) && activeObjects} [object:{LimettaUnghie}]
    -> limetta_unghie ->


-> intro

= limetta_unghie 
    + (primoCheck) [Osserva la limetta per le unghie]
        Una limetta consumata, con il logo di un noto franchise molto economico.
        -> advance_time ->
        + + [Raccoglila]
        ~ take_object(LimettaUnghie)
        + + [Lasciala dov'è]

    -
->->


=== cb_first_tier_antico_pugnale ===

+ {are_two_entities_together(Ettore, AnticoPugnale) && activeObjects} [object:{AnticoPugnale}]
    -> antico_pugnale ->


-> intro

= antico_pugnale
    + (primoCheck) [Ispeziona il pugnale]
        Un pugnale dall'aria antica, con simboli che non hai mai visto.
        -> advance_time ->
        + + [Raccoglilo]
        ~ take_object(AnticoPugnale)
        + + [Lascialo dov'è]
    -
->->



=== cb_first_tier_spiedino_cocktail ===

+ {are_two_entities_together(Ettore, SpiedinoCocktail) && activeObjects} [object:{SpiedinoCocktail}]
    -> spiedino_cocktail ->


-> intro

= spiedino_cocktail
    + (primoCheck) [Controlla lo spiedino]
    -> advance_time ->
        Un banale spiedino da cocktail. In controluce si legge la sigla <i>FEG</i>
        + + [Raccoglilo]
        ~ take_object(SpiedinoCocktail)
        + + [Lascialo dov'è]
    -
->->


=== cb_first_tier_lettera ===

+ {are_two_entities_together(Ettore, Lettera) && activeObjects} [object:{Lettera}]
    -> lettera ->

-> intro


= lettera
    + (primoCheck) [Leggi la lettera]
    -> advance_time ->
        Con una calligrafia nervosa è stato scritto: <i>So cosa hai fatto e la pagherai!</i>. Non c'è firma.
        + + [Raccoglila]
        ~ take_object(Lettera)
        + + [Lasciala dov'è]
    -
->->


=== cb_first_tier_bottiglia_di_vino ===

+ {are_two_entities_together(Ettore, BottigliaDiVino) && activeObjects} [object:{BottigliaDiVino}]
    -> bottiglia_di_vino ->

-> intro


= bottiglia_di_vino
    + (primoCheck) [Ispeziona la bottiglia di vino]
    -> advance_time ->
        Un negramaro di prestigio. Probabilmente costa più di quanto tu possa guadagnare in metà mese.
        + + [Raccoglila]
        ~ take_object(BottigliaDiVino)
        + + [Lasciala dov'è]
    -
->->

=== cb_first_tier_flaconcino_asma ===
+ {are_two_entities_together(Ettore, FlaconcinoAsma) && activeObjects} [object:{FlaconcinoAsma}]
    -> flaconcino_asma->

-> intro


= flaconcino_asma
    + (primoCheck) [Osserva il flaconcino per l'asma]
    -> advance_time ->
        TODO: sistemare in tutti gli oggetti la descrizione in modo che sia Ettore a dirla
        Ettore: Un comune flaconcino. O, con un po' di fantasia, il periscopio di un sottomarino.
        + + [Raccoglilo]
        ~ take_object(FlaconcinoAsma)
        + + [Lascialo dov'è]
    
    -
->->

=== cb_first_tier_sigaretta_elettronica ===
+ {are_two_entities_together(Ettore, SigarettaElettronica) && activeObjects} [object:{SigarettaElettronica}]
    -> sigaretta_elettronica->

-> intro


= sigaretta_elettronica
    + (primoCheck) [Controlla la sigaretta elettronica]
    -> advance_time ->
        Ha l'odore di un deodorante per il bagno, ma per il resto, niente di particolare.
        + + [Raccoglila]
        ~ take_object(SigarettaElettronica)
        + + [Lasciala dov'è]

    -
->->

=== cb_first_tier_cibo ===
+ {are_two_entities_together(Ettore, Torta) && activeObjects} [object:{Torta}]
    -> cibo ->

-> intro


= cibo
    + (primoCheck) [Assaggia la torta]
    -> advance_time ->
        Il paradiso di un dodicenne: cioccolata, crema di arachidi, fragole, biscottini sbriciolati. La adori.
        + + [Raccoglila]
        ~ take_object(Torta)
        + + [Lasciala dov'è]

    
    -
->->


