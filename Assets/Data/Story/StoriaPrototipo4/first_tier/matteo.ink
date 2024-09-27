=== cb_first_tier_matteo ===
{debug: <i>passo per first_tier_matteo</i>}
+ {are_two_entitites_together(Matteo, Ettore) && acting} [character:Matteo] {debug: <i>Ho scelto di parlare con Matteo</i>}
    -> matteo_acting ->

+ {are_two_entitites_together(Matteo, Ettore) && !acting} [character:Matteo]
    -> matteo_talking ->    
-

-> intro


= matteo_acting
    -> first_tier_storylets ->
    //INFO GENERALI
    +  XXX
    -> advance_time ->
    +  YYY
    -> advance_time ->
    
    //SCELTE CONDIZIONALI
    -
    TODO: vedi Notion
    Cose dette
    -> advance_time ->
->->


= matteo_talking

->->