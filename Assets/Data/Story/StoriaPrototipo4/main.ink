=== intro ===
{
- TierState == first_tier: -> intro_first_tier
- TierState == second_tier: -> intro_second_tier
}

= intro_first_tier
Inizio primo tier
+ Cose, che chiama il malloppone di tunnel
+ Test: vai da Paola direttamente -> cb_first_tier_paola
-
-> cb_first_tier


= intro_second_tier
Inizio secondo tier
+ Cose
-> cb_second_tier

//=== character_based ===

//~ temp my_location = entity_location(Ettore)
//{debug: [sono le {print_time()}, sei in {my_location}]}

/*{
- TierState == first_tier: -> cb_first_tier
- TierState == second_tier: -> cb_second_tier
}*/

=== cb_first_tier
~ temp my_location = entity_location(Ettore)
{debug: [sono le {print_time()}, sei in {my_location}]}
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
// thread per spostarsi tra le stanze
<- move_between_rooms(my_location)
// thread per gestire il notebook
<- notebook
// only present because ink doesn't allow to produce a choice list made ONLY of threads: at least one choice must be in this list (using a default choice that will never appear)
+ ->
-

-> cb_first_tier

= nothing

DEBUG: errore, nessun personaggio con cui interagire

-> END

=== cb_second_tier
~ temp my_location = entity_location(Ettore)
{debug: [sono le {print_time()}, sei in {my_location}]}
// thread per ogni personaggio
<- cb_second_tier_paola
<- cb_second_tier_elia
<- cb_second_tier_zeca
<- cb_second_tier_greta
<- cb_second_tier_matteo
// thread per ogni oggetto
<- cb_first_tier_lettera
// thread per spostarsi tra le stanze
<- move_between_rooms(my_location)
// thread per gestire il notebook
<- notebook
// only present because ink doesn't allow to produce a choice list made ONLY of threads: at least one choice must be in this list (using a default choice that will never appear)
+ ->
-

-> cb_second_tier

= nothing

DEBUG: errore, nessun personaggio con cui interagire

-> END