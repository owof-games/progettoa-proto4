=== cb_first_tier_greta ===

+ {areTwoEntitiesTogether(Greta, Ettore) && acting} [Greta]
    -> greta_acting->
    
+ {areTwoEntitiesTogether(Greta, Ettore) && !acting} [Greta]
    -> greta_talking->    
-

-> cb_first_tier


= greta_acting
    -> first_tier_storylets ->
    //INFO GENERALI//
    + XXX
    + YYY
    
    //SCELTE CONDIZIONALI//
    + (missioneGreta) Ti dirò chi è l'assassino se tu convinci Elia a venire a parlarmi.
    + {cb_first_tier_elia.elia_acting.uniti} Ho fatto quello che mi hai chiesto, Greta.
        Greta: Scusa, ti ho preso un po' in giro. Non ho idea di chi possa aver ucciso Paola, era perfetta.
    -
    Cose dette
->->


= greta_talking


->->