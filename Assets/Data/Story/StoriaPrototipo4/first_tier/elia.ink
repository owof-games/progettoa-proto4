=== cb_first_tier_elia ===
{debug: <i>passo per first_tier_elia</i>}
+ {are_two_entitites_together(Elia, Ettore) && acting} [character:Elia]
    {debug: <i>Ho scelto di parlare con Elia</i>}
    -> elia_acting ->
    
+ {are_two_entitites_together(Elia, Ettore) && !acting} [character:Elia]
    -> elia_talking -> 
    
-

-> intro

/* ---------------------------------
Opzioni di dialogo con il personaggio Elia
 ----------------------------------*/


=== elia_acting
    {debug: <i>Passo per elia_acting</i>}
    -> first_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sul personaggio Elia -> esplora_elia_personaggia
    
    //SCELTE CONDIZIONALI//
    + (senzatetto){greta_acting.missioneGreta && new_this_loop(->senzatetto)} Elia, Greta vorrebbe parlare con te.
        Elia: Così può uccidere anche me?
        Ettore: In che senso?
        Elia: Paola voleva rilevare il pub per trasformarlo in un rifugio per senzatetto, e Greta ha detto cose terribili e ripetuto che avrebbe fatto di tutto per fermarla.
        Elia: Di tutto.
        Elia: Per cui, vattene.
        // route "lo mandi nella stanza di Greta con una trappola"
        
        // route "lo mandi da Greta proponendo uno scambio"
    +  (uniti){weddingAtThePubStorylet && new_this_loop(->senzatetto)} Ho una proposta. So che tu e Matteo avete litigato, per via del matrimonio.
            Ettore: Tu vuoi che festeggiamo al pub. Se lo convinco, andrai da Greta?
            Elia: Se ci riesci, parlerò con quella arpia.
            
    + {!new_this_loop(->senzatetto) && !hardTrueFeelingsStorylet} Ettore: "Sto ancora cercando il modo di convincere Matteo, ma ce la farò!"

    + {hardTrueFeelingsStorylet} Ettore: "Ho convinto Matteo."
            Elia: "Bene, vado, dove la trovo?"
            ~ move_entity_from_object_storage_to_Ettore_location(SpiedinoCocktail)
            TODO: Check con Mattia per vedere se c'è modo di trasformare in funzione o simile visto che riuseremo più volte questa strategia.
        + + {whiteRoomContents hasnt Ettore} Ettore: "Ti aspetta nella stanza bianca."
                ~ move_entity(Elia, WhiteRoom)
                {
                - whiteRoomContents has Greta:~ loopableVariables += EliaRaggiungeGreta
                }
        + + {greenRoomContents hasnt Ettore} Ettore: "Ti aspetta nella stanza verde."
                ~ move_entity(Elia, GreenRoom)
                {
                - greenRoomContents has Greta:~ loopableVariables += EliaRaggiungeGreta
                }
        + + {yellowRoomContents hasnt Ettore} Ettore: "Ti aspetta nella stanza gialla."                
                ~ move_entity(Elia, YellowRoom)
                {
                - yellowRoomContents has Greta:~ loopableVariables += EliaRaggiungeGreta
                }
        + + {redRoomContents hasnt Ettore} Ettore: "Ti aspetta nella stanza rossa."                
                ~ move_entity(Elia, RedRoom)
                {
                - redRoomContents has Greta:~ loopableVariables += EliaRaggiungeGreta
                }      
                
   
    + (sincero) {hardTrueFeelingsStorylet} Ettore: "Matteo mi ha detto di lui e di Greta."
            Elia: "Merda, mi spiace. Per questo volevo fare il matrimonio al pub."
            Elia: "Andrò lo stesso da Greta, te lo devo."
            Ettore: "Ti aspetta nella stanza bianca."
            ~ move_entity_from_object_storage_to_Ettore_location(SpiedinoCocktail)
            
                ~ move_entity(Elia, WhiteRoom)
                ~ loopableVariables += EliaRaggiungeGreta
                
                
    
        -          
        
    //SCELTE CONDIZIONALI OGGETTI//
     + (pugnaleMatteo){inventoryContents has AnticoPugnale} Guarda questo pugnale!
            Elia: "Matteo era disperato, l'aveva perso da settimane!"
     + {inventoryContents has SpiedinoCocktail} Elia, hai lasciato alle tue spalle questo oggetto.
        + + (paolaSiSposa)Sarebbe perfetto per uccidere qualcuno!
            Elia si incazza
            Elia: "L'ho portato a Paola per valutarlo per il matrimonio."
            Ettore: "Il matrimonio mio e di Matteo?"
            Elia: "No, il suo. Paola si sposa."
        + + Cosa volevi farci?
            Elia ci dice che non l'ha mia visto.
        - -
     + {inventoryContents has Lettera} Guarda questa lettera!
     + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    
      
    + Te ne vai
        -> intro
    -
->->

= esplora_elia_personaggia
{debug: <i>Passo per esplora_elia</i>}
VAR EliaActing = 0

{
- EliaActing > 1: Elia: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    }
}


= first_qn
~ EliaActing++
    + Prima domanda
    -> advance_time ->
    
    -
-> elia_acting 

= second_qn
 ~ EliaActing++
    +  altra domanda
    -> advance_time ->
   
    -
-> elia_acting     

= third_qn
~ EliaActing++
    Elia dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> elia_acting

/* ---------------------------------
Opzioni di dialogo con la persona Elia
 ----------------------------------*/

=== elia_talking
 {debug: <i>Passo per elia_talking</i>}
    -> first_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sulla persona Elia -> esplora_elia

    //SCELTE CONDIZIONALI//
    

    //SCELTE CONDIZIONALI OGGETTI//
     + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
     + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
     + {inventoryContents has Lettera} Guarda questa lettera!
     + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    
      
    + Te ne vai -> intro
    -

= esplora_elia
{debug: <i>Passo per esplora_elia</i>}
VAR EliaTalking = 0


{
- EliaTalking > 1: Elia: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SULLA PERSONA ELIA

= first_qn
~ EliaTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> elia_talking 

= second_qn
 ~ EliaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> elia_talking    

= third_qn
~ EliaTalking++
    Elia dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> elia_talking