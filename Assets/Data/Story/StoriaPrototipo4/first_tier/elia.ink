=== cb_first_tier_elia ===

+ {areTwoEntitiesTogether(Elia, Ettore) && acting} [Elia]
    -> elia_acting ->
    
+ {areTwoEntitiesTogether(Elia, Ettore) && !acting} [Elia]
    -> elia_talking ->    
-

-> cb_first_tier


= elia_acting
    -> first_tier_storylets ->
    //INFO GENERALI//
    + XXX
    + YYY
    
    //SCELTE CONDIZIONALI//
    + (senzatetto){cb_first_tier_greta.greta_acting.missioneGreta}: Elia, Greta vorrebbe parlare con te.
        Elia: col cavolo!
        Ettore: Posso fare qualcosa per te?
        Elia: No, non c'è nulla che puoi fare!
        + + (uniti){weddingAtThePubStorylet} Non è vero! So che vuoi organizzare il nostro matrimonio al bar. Posso convincere Matteo!
            Elia: Non ti conosco ma mi fido di te, va bene!
            Ettore: Ti aspetta nella stanza bianca.
                ~ move_entity(Elia, WhiteRoom)
               TODO:  ~ move_entity(SpiedinoCocktail, RedRoom) lasciare un oggetto nella stanza in cui ci troviamo
    -
->->

= elia_talking
->->