=== cb_first_tier_paola ===
{debug: <i>passo per first_tier_paola</i>}
+ {are_two_entitites_together(Paola, Ettore) && acting} [character:Paola] {debug: <i>Ho scelto di parlare con Paola</i>}
    -> paola_acting->

+ {are_two_entitites_together(Paola, Ettore) && !acting} [character:Paola]
    -> paola_talking->    
-

-> intro


= paola_acting
    -> first_tier_storylets ->
    //INFO GENERALI
    + Cose Paola
    ~ advance_time()
    + Altre Cose Paola
    ~ advance_time()
    
    
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

