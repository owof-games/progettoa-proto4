=== cb_first_tier_paola ===

+ {areTwoEntitiesTogether(Paola, Ettore) && acting} [Paola]
    -> paola_acting->

+ {areTwoEntitiesTogether(Paola, Ettore) && !acting} [Paola]
    -> paola_talking->    
-

-> cb_first_tier


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