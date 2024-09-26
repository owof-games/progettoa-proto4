//INDEX
=== first_tier_storylets
{

- areSixEntitiesTogether(Elia, Matteo, Ettore, Zeca, Paola, Greta):
    -> startingDinnerStorylet


- areThreeEntitiesTogether(Elia, Matteo, Ettore) && not areTwoEntitiesTogether(Elia, Zeca) && not areTwoEntitiesTogether(Elia, Paola) && not areTwoEntitiesTogether(Elia, Greta):
    -> weddingAtThePubStorylet

- areThreeEntitiesTogether(Elia, Greta, Ettore) && not areTwoEntitiesTogether(Elia, Matteo) && not areTwoEntitiesTogether(Elia, Paola) && not areTwoEntitiesTogether(Elia, Zeca):
    -> anEavesdropAboutFriendshipStorylet

}
->->

//TESTI
=== startingDinnerStorylet
Scena iniziale
    Matteo: xxx
    Paola: yyy
        + Opzione Storylet
        + Altra Opzione Storylet
        -
    Greta: 2222    

->->




=== weddingAtThePubStorylet 
Discussione Matteo ed Elia su matrimonio al bar
    + {seen_ever(->weddingAtThePubStorylet)} ["Me ne vado"]
    + [Opzione normale]

->->



=== anEavesdropAboutFriendshipStorylet 
Conversazione origliata: capiamo che Greta non ce l'ha con Paola, ma cagate tipo "prima che papà mi adottasse ho vissuto in strada, non possono rivivere quel trauma".
    + {seen_ever(->nEavesdropAboutFriendshipStorylet)} ["Me ne vado"]
    + [Opzione normale]
->->