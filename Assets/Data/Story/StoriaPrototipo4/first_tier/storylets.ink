//INDEX
=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}
{
- are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not startingDinnerStorylet && new_this_loop(->startingDinnerStorylet):
    -> startingDinnerStorylet


- are_three_entities_together(Elia, Matteo, Ettore) && not are_two_entitites_together(Elia, Zeca) && not are_two_entitites_together(Elia, Paola) && not are_two_entitites_together(Elia, Greta) && new_this_loop(->weddingAtThePubStorylet):
    -> weddingAtThePubStorylet

- are_three_entities_together(Elia, Greta, Ettore) && not are_two_entitites_together(Elia, Matteo) && not are_two_entitites_together(Elia, Paola) && not are_two_entitites_together(Elia, Zeca) && new_this_loop(->anEavesdropAboutFriendshipStorylet):
    -> anEavesdropAboutFriendshipStorylet
    
- are_two_entitites_together(Matteo, Ettore) && not are_two_entitites_together(Elia, Ettore) && not are_two_entitites_together(Ettore, Paola) && not are_two_entitites_together(Ettore, Zeca) && not are_two_entitites_together(Ettore, Greta) && new_this_loop(->marryMe):
    -> marryMe 

}
->->

//TESTI
=== startingDinnerStorylet
{debug: <i>Passo per startingDinnerStorylet</i>}
Matteo: c'è Paola!
    Paola: c'è Matteo!
    -> advance_time ->
        + Ci sono anche io!
        + E ci sono dei gatti!
        -
    Greta: Ma soprattutto c'è un coniglio
    -> advance_time ->

->->




=== weddingAtThePubStorylet
{debug: <i>Passo per weddingAtThePubStorylet</i>}
Discussione Matteo ed Elia su matrimonio al bar. Elia vuole farlo al pub, Matteo non ne vuole sapere.
    -> advance_time ->
    + [Avanzo]
    -

->->



=== anEavesdropAboutFriendshipStorylet
{debug: <i>Passo per anEavesdropAboutFriendshipStorylet</i>}
Conversazione origliata: capiamo che Greta non ce l'ha con Paola, ma cagate tipo "prima che papà mi adottasse ho vissuto in strada, non possono rivivere quel trauma".
    -> advance_time ->
    + [Avanzo]
    -
->->

=== marryMe
Finalmente siamo soli, momento romantico.

    -> advance_time ->
    + [Avanzo]
    -
->->
