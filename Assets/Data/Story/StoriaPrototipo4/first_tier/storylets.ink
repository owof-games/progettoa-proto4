//INDEX
=== first_tier_storylets
{

- areSixEntitiesTogether(Elia, Matteo, Ettore, Zeca, Paola, Greta) && not startingDinnerStorylet:
    -> startingDinnerStorylet


- areThreeEntitiesTogether(Elia, Matteo, Ettore) && not areTwoEntitiesTogether(Elia, Zeca) && not areTwoEntitiesTogether(Elia, Paola) && not areTwoEntitiesTogether(Elia, Greta):
    -> weddingAtThePubStorylet

- areThreeEntitiesTogether(Elia, Greta, Ettore) && not areTwoEntitiesTogether(Elia, Matteo) && not areTwoEntitiesTogether(Elia, Paola) && not areTwoEntitiesTogether(Elia, Zeca):
    -> anEavesdropAboutFriendshipStorylet

}
->->

//TESTI
=== startingDinnerStorylet
starting Dinner Storylet
Matteo: c'è Paola!
    Paola: c'è Matteo!
        + Ci sono anche io!
        + E ci sono dei gatti!
        + {not new_this_loop(->startingDinnerStorylet)} ["Me ne vado"]
        -
    Greta: Ma soprattutto c'è un coniglio    

->->




=== weddingAtThePubStorylet
weddingAtThePubStorylet 
Discussione Matteo ed Elia su matrimonio al bar
    + {not new_this_loop(->weddingAtThePubStorylet)} ["Me ne vado"]
    + [Opzione normale]
    -

->->



=== anEavesdropAboutFriendshipStorylet 
Conversazione origliata: capiamo che Greta non ce l'ha con Paola, ma cagate tipo "prima che papà mi adottasse ho vissuto in strada, non possono rivivere quel trauma".
    + {not new_this_loop(->anEavesdropAboutFriendshipStorylet )} ["Me ne vado"]
    + [Opzione normale]
    -
->->