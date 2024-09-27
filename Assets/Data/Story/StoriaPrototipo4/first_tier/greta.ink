=== cb_first_tier_greta ===
{debug: <i>passo per first_tier_greta</i>}
+ {are_two_entitites_together(Greta, Ettore) && acting} [character:Greta] {debug: <i>Ho scelto di parlare con Greta</i>}
    -> greta_acting->
    
+ {are_two_entitites_together(Greta, Ettore) && !acting} [character:Greta] 
    -> greta_talking->    
-

-> intro


= greta_acting
    -> first_tier_storylets ->
    //INFO GENERALI//
    + Domanda
    + Domanda
    
    //SCELTE CONDIZIONALI NARRATIVE//
    TODO: la prima domanda continua ad essere accessibile, me disperata
    + (missioneGreta) {new_this_loop(->missioneGreta)} Sai chi potrebbe avere ucciso Paola?
            -> advance_time ->
            Greta: Di più! Ma ti dirò chi è l'assassino se tu convinci Elia a venire a parlarmi.
            -> advance_time ->        
    + {seen_in_this_loop(->missioneGreta) && loopableVariables hasnt EliaRaggiungeGreta} Non sono ancora riuscito a convincere Elia
    -> advance_time ->
    + {loopableVariables has EliaRaggiungeGreta} Ho fatto quello che mi hai chiesto, Greta.
    -> advance_time ->
        Greta: Scusa, ti ho preso un po' in giro. Non ho idea di chi possa aver ucciso Paola, era perfetta.
    -> advance_time ->    
        
    //SCELTE CONDIZIONALI OGGETTI//
     + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
     + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
     + {inventoryContents has Lettera} Guarda questa lettera!
     + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    -
    
    + Te ne vai
    -> advance_time ->
    
->->


= greta_talking


->->