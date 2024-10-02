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
    + (senzatetto){greta_acting.missioneGreta} Elia, Greta vorrebbe parlare con te.
        Elia: col cavolo!
        Ettore: Posso fare qualcosa per te?
        Elia: No, non c'è nulla che puoi fare!
        + + (uniti){weddingAtThePubStorylet} Non è vero! So che vuoi organizzare il nostro matrimonio al bar. Posso convincere Matteo!
            Elia: Non ti conosco ma mi fido di te, va bene!
            Ettore: Ti aspetta nella stanza bianca.
                ~ move_entity(Elia, WhiteRoom)
                ~ loopableVariables += EliaRaggiungeGreta
                Ho impostato loopable
                ~ move_entity_from_object_storage_to_Ettore_location(SpiedinoCocktail)
        + + ->
        -          
        
    //SCELTE CONDIZIONALI OGGETTI//
     + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
     + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
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