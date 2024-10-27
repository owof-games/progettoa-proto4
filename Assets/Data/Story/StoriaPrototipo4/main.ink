~ updateEntitiesLocations()
-> intro
=== intro ===
{
    - tierState == FirstTier: -> first_tier_storylets ->
    - else: -> second_tier_storylets ->
}

{
- tierState == FirstTier: -> cb_first_tier
- tierState == SecondTier: -> cb_second_tier
}


=== cb_first_tier
~ temp my_location = entity_location(Ettore)
{debug: [sono le {print_time()}, sei in {my_location}]}
@interact
// thread per ogni personaggio
<- cb_first_tier_paola
<- cb_first_tier_elia
<- cb_first_tier_zeca
<- cb_first_tier_greta
<- cb_first_tier_matteo
// thread per ogni oggetto
<- cb_first_tier_limetta_unghie
<- cb_first_tier_antico_pugnale
<- cb_first_tier_spiedino_cocktail
<- cb_first_tier_lettera
<- cb_first_tier_cibo
<- cb_first_tier_flaconcino_asma
<- cb_first_tier_bottiglia_di_vino
<- cb_first_tier_sigaretta_elettronica
// thread per spostarsi tra le stanze
<- move_between_rooms(my_location)
// thread per gestire il notebook
<- notebook
// thread per gestire il notebook
<- phone
// only present because ink doesn't allow to produce a choice list made ONLY of threads: at least one choice must be in this list (using a default choice that will never appear)

//Rimozione oggetti
//Quando avremo l'oggetto in mano ci sarà qualcosa tipo leaveObject in modo tale che Unity lo sappia
+ {inventoryContents has FlaconcinoAsma} [Lascia il flaconcino per l'asma nella stanza]
        ~ remove_entity(FlaconcinoAsma)
+ {inventoryContents has LimettaUnghie} [Lascia la limetta nella stanza]
        ~ remove_entity(LimettaUnghie)
+ {inventoryContents has AnticoPugnale} [Lascia il pugnale nella stanza]
        ~ remove_entity(AnticoPugnale)
+ {inventoryContents has SpiedinoCocktail}  [Lascia lo spiedino nella stanza]
        ~ remove_entity(SpiedinoCocktail)
+ {inventoryContents has Lettera} [Lascia la lettera nella stanza]
        ~ remove_entity(Lettera)
+ {inventoryContents has BottigliaDiVino} [Lascia la bottiglia di vino nella stanza]
        ~ remove_entity(BottigliaDiVino)
+ {inventoryContents has SigarettaElettronica} [Lascia la sigaretta elettronica nella stanza]
        ~ remove_entity(SigarettaElettronica)
+ {inventoryContents has Torta} [Lascia la torta nella stanza]
        ~ remove_entity(Torta)    
         
+ avanza tempo
  -> advance_time ->
+ ->
-

-> intro

= nothing

DEBUG: errore, nessun personaggio con cui interagire

-> END

=== cb_second_tier
~ temp my_location = entity_location(Ettore)
{debug: [sono le {print_time()}, sei in {my_location}]}
@interact
// thread per ogni personaggio
<- cb_second_tier_paola
<- cb_second_tier_elia
<- cb_second_tier_zeca
<- cb_second_tier_greta
<- cb_second_tier_matteo
// thread per ogni oggetto
<- cb_second_tier_lettera
<- cb_second_tier_cibo
<- cb_second_tier_flaconcino_asma
<- cb_second_tier_bottiglia_di_vino
<- cb_second_tier_sigaretta_elettronica
<- cb_second_tier_foto
// thread per spostarsi tra le stanze
<- move_between_rooms(my_location)
// thread per gestire il notebook
<- notebook
// thread per gestire il notebook
<- phone
// only present because ink doesn't allow to produce a choice list made ONLY of threads: at least one choice must be in this list (using a default choice that will never appear)
+ avanza tempo
  -> advance_time ->
+ ->
-

-> intro

= nothing

DEBUG: errore, nessun personaggio con cui interagire

-> END