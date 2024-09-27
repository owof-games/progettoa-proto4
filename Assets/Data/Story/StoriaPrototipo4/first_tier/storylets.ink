//INDEX
=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}
TODO: ho l'impressione che queste formule siano un "alcuni di", possibile? esempio: per la prima scena, devo essere tutti assieme, per questo ho usato la formula "six entities together". Ma poi partiva anche in situazione in cui i personaggi non erano assieme (es: seconda scena, redroom, Matteo + Elia e basta). Con la struttura attuale invece parte solo se effettivamente sono assieme.
{
- are_three_entities_together(Elia, Matteo, Ettore) && are_two_entitites_together(Elia, Zeca) && are_two_entitites_together(Elia, Paola) && are_two_entitites_together(Elia, Greta) && not startingDinnerStorylet:
    -> startingDinnerStorylet


- are_three_entities_together(Elia, Matteo, Ettore) && not are_two_entitites_together(Elia, Zeca) && not are_two_entitites_together(Elia, Paola) && not are_two_entitites_together(Elia, Greta):
    -> weddingAtThePubStorylet

- are_three_entities_together(Elia, Greta, Ettore) && not are_two_entitites_together(Elia, Matteo) && not are_two_entitites_together(Elia, Paola) && not are_two_entitites_together(Elia, Zeca):
    -> anEavesdropAboutFriendshipStorylet

}
->->

//TESTI
=== startingDinnerStorylet
{debug: <i>Passo per startingDinnerStorylet</i>}
Matteo: c'è Paola!
    Paola: c'è Matteo!
    ~ advance_time()
        + Ci sono anche io!
        + E ci sono dei gatti!
        -
    Greta: Ma soprattutto c'è un coniglio
    ~ advance_time()

->->




=== weddingAtThePubStorylet
{debug: <i>Passo per weddingAtThePubStorylet</i>}
TODO: come struttura funziona, ma solo dopo il primo loop, e non mi stanno venendo in mente soluzioni.
{
- new_this_loop(->weddingAtThePubStorylet): -> discussione
- else:->->
}

- (discussione)
Discussione Matteo ed Elia su matrimonio al bar
    ~ advance_time()
    + [Avanzo]
    -

->->



=== anEavesdropAboutFriendshipStorylet
{debug: <i>Passo per anEavesdropAboutFriendshipStorylet</i>}
Conversazione origliata: capiamo che Greta non ce l'ha con Paola, ma cagate tipo "prima che papà mi adottasse ho vissuto in strada, non possono rivivere quel trauma".
    ~ advance_time()
    + [Avanzo]
    -
->->