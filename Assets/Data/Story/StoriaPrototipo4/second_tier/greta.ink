=== cb_second_tier_greta ===
{debug: <i>passo per first_tier_greta</i>}
+ {are_two_entitites_together(Greta, Ettore) && !peopleTalking} [character:Greta] {debug: <i>Ho scelto di parlare con Greta</i>}
    -> greta_acting_second_tier->
    
+ {are_two_entitites_together(Greta, Ettore) && peopleTalking} [character:Greta] 
    -> greta_talking_second_tier->    
-

-> intro


/* ---------------------------------
Opzioni di dialogo con il personaggio Greta
 ----------------------------------*/


=== greta_acting_second_tier
    {debug: <i>Passo per greta_acting_second_tier</i>}
    -> second_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sul personaggio Greta -> esplora_greta_personaggia
    
    //SCELTE CONDIZIONALI//
    
    
    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Cibo} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
      
    + Te ne vai
        -> intro
    -
->->

= esplora_greta_personaggia
{debug: <i>Passo per esplora_greta_personaggia</i>}

{
- GretaActing > 1: Greta: "Non mi va di rispondere ad altre domande personali".
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
~ GretaActing++
    + Prima domanda
    -> advance_time ->
    
    -
-> greta_acting_second_tier 

= second_qn
 ~ GretaActing++
    +  altra domanda
    -> advance_time ->
   
    -
-> greta_acting_second_tier     

= third_qn
~ GretaActing++
    Greta dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> greta_acting_second_tier




/* ---------------------------------
Opzioni di dialogo con la persona Greta
 ----------------------------------*/

=== greta_talking_second_tier
 {debug: <i>Passo per greta_talking_second_tier</i>}
    -> second_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sulla persona Greta -> esplora_greta

    //SCELTE CONDIZIONALI//
    

    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Cibo} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai -> intro
    -
    

= esplora_greta
{debug: <i>Passo per esplora_greta</i>}


{
- GretaTalking > 1: Greta: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA GRETA

= first_qn
~ GretaTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> greta_talking_second_tier 

= second_qn
 ~ GretaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> greta_talking_second_tier    

= third_qn
~ GretaTalking++
    Greta dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> greta_talking_second_tier