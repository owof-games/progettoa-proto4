=== cb_first_tier_paola ===

+ {areTwoEntitiesTogether(Paola, Ettore) && acting} [character:Paola]
    -> paola_acting->

+ {areTwoEntitiesTogether(Paola, Ettore) && !acting} [character:Paola]
    -> paola_talking->    
-

-> intro


= paola_acting
    -> first_tier_storylets ->
    //INFO GENERALI
    + Cose Paola
        ~ acting = false
    + Altre Cose Paola
    
    
    //SCELTE CONDIZIONALI
    -

->->


= paola_talking
    //INFO GENERALI
    + Paola sei stronza
    + Altre Cose Paola
    
    
    //SCELTE CONDIZIONALI
    -
->->

