=== cb_second_tier_zeca ===
{debug: <i>passo per second_tier_zeca</i>}

+ {are_two_entitites_together(Zeca, Ettore) && !peopleTalking} [character:Zeca] {debug: <i>Ho scelto di parlare con Zeca</i>}
    -> zeca_acting_second_tier ->
    
+ {are_two_entitites_together(Zeca, Ettore) && peopleTalking} [character:Zeca]
    -> zeca_talking_second_tier ->    
-

-> intro




/* ---------------------------------
Opzioni di dialogo con il personaggio Zeca
 ----------------------------------*/


=== zeca_acting_second_tier
    {debug: <i>Passo per zeca_acting_second_tier</i>}
    -> second_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sul personaggio Zeca -> esplora_zeca_personaggia
    
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
    
      
    + Te ne vai
        -> intro
    -
->->

= esplora_zeca_personaggia
{debug: <i>Passo per esplora_zeca_personaggia</i>}

{
- ZecaActing > 1: Zeca: "Non mi va di rispondere ad altre domande personali".
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
~ ZecaActing++
    + Prima domanda
    -> advance_time ->
    
    -
-> zeca_acting_second_tier 

= second_qn
 ~ ZecaActing++
    +  altra domanda
    -> advance_time ->
   
    -
-> zeca_acting_second_tier     

= third_qn
~ ZecaActing++
    Zeca dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> zeca_acting_second_tier




/* ---------------------------------
Opzioni di dialogo con la persona Zeca
 ----------------------------------*/

=== zeca_talking_second_tier
 {debug: <i>Passo per zeca_talking_second_tier</i>}
    -> second_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sulla persona Zeca -> esplora_zeca

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
    
      
    + Te ne vai
    -> intro
    -
    

= esplora_zeca
{debug: <i>Passo per esplora_zeca</i>}


{
- ZecaTalking > 1: Zeca: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA ZECA

= first_qn
~ ZecaTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> zeca_talking_second_tier 

= second_qn
 ~ ZecaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> zeca_talking_second_tier    

= third_qn
~ ZecaTalking++
    Zeca dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> zeca_talking_second_tier
