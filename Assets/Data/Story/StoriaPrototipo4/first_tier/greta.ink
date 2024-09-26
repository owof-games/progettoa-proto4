=== cb_first_tier_greta ===

+ {areTwoEntitiesTogether(Greta, Ettore) && acting} [Greta]
    -> greta_acting->
    
+ {areTwoEntitiesTogether(Greta, Ettore) && !acting} [Greta]
    -> greta_talking->    
-

-> intro


= greta_acting
    -> first_tier_storylets ->
    //INFO GENERALI//
    + Domanda
    + Domanda
    
    //SCELTE CONDIZIONALI NARRATIVE//
    + (missioneGreta) {new_this_loop(->missioneGreta)} [character:Greta] Sai chi potrebbe avere ucciso Paola?
            Greta: Di più! Ma ti dirò chi è l'assassino se tu convinci Elia a venire a parlarmi.
    + {not new_this_loop(->missioneGreta) && not elia_raggiunge_Greta} [character:Greta] Non sono ancora riuscito a convincere Elia       
    + {not new_this_loop(->missioneGreta) && elia_raggiunge_Greta} [character:Greta] Ho fatto quello che mi hai chiesto, Greta.
        Greta: Scusa, ti ho preso un po' in giro. Non ho idea di chi possa aver ucciso Paola, era perfetta.
        
    //SCELTE CONDIZIONALI OGGETTI//
     + {inventory_contents has AnticoPugnale} [character:Greta] Guarda questo pugnale!
     + {inventory_contents has SpiedinoCocktail} [character:Greta] Guarda questo spiedino!
     + {inventory_contents has Lettera} [character:Greta] Guarda questa lettera!
     + {inventory_contents has LimettaUnghie} [character:Greta] Guarda questa limetta da unghie!
    -
    
    + Te ne vai
    
->->


= greta_talking


->->