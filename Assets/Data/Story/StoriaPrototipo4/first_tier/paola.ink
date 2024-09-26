=== cb_first_tier_paola ===

+ {areTwoEntitiesTogether(Paola, Ettore) && acting} [Paola]
    -> paola_acting->

+ {areTwoEntitiesTogether(Paola, Ettore) && !acting} [Paola]
    -> paola_talking->    
-

-> intro


= paola_acting
    -> first_tier_storylets ->
    //INFO GENERALI
    + [character:Paola]Cose Paola
        ~ acting = false
    + [character:Paola]Altre Cose Paola
    
    
    //SCELTE CONDIZIONALI
    -

->->


= paola_talking
    //INFO GENERALI
    + [character:Paola]Paola sei stronza
    + [character:Paola]Altre Cose Paola
    
    
    //SCELTE CONDIZIONALI
    -
->->

