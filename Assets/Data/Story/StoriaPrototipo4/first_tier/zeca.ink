=== cb_first_tier_zeca ===
{debug: <i>passo per first_tier_zeca</i>}

+ {are_two_entitites_together(Zeca, Ettore) && acting} [character:Zeca] {debug: <i>Ho scelto di parlare con Zeca</i>}
    -> zeca_acting ->
    
+ {are_two_entitites_together(Zeca, Ettore) && !acting} [character:Zeca]
    -> zeca_talking ->    
-

-> intro



= zeca_acting
    -> first_tier_storylets ->
    //INFO GENERALI
    +  XXX
        -> advance_time ->
    +  YYY
        -> advance_time ->
    -
    
    //SCELTE CONDIZIONALI
    Cose dette
->->


= zeca_talking
->->
