=== cb_second_tier_paola ===
{debug: <i>passo per second_tier_paola</i>}
+ {are_two_entitites_together(Paola, Ettore) && !peopleTalking} [character:Paola] {debug: <i>Ho scelto di parlare con Paola</i>}
    -> paola_acting_second_tier->

+ {are_two_entitites_together(Paola, Ettore) && peopleTalking} [character:Paola]
    -> paola_talking_second_tier->    
-

-> intro

/* ---------------------------------
Opzioni di dialogo con il personaggio Paola, che però sarà subito morta
 ----------------------------------*/


=== paola_acting_second_tier
    {debug: <i>Passo per paola_acting</i>}
    -> second_tier_storylets ->
    ->->


/* ---------------------------------
Opzioni di dialogo con la persona Paola
 ----------------------------------*/

=== paola_talking_second_tier
 {debug: <i>Passo per paola_talking</i>}
    -> second_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sulla persona Paola -> esplora_paola

    //SCELTE CONDIZIONALI//
    

    //SCELTE CONDIZIONALI OGGETTI//
     + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
     + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
     + (Minacce) {inventoryContents has Lettera} Guarda questa lettera!
        Paola: "Uh, guarda un po' chi si dovrebbe fare i cazzi propri!'".
            ~ inventoryContents -= Lettera
            ~ objectStorageContents += Lettera
     + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    
      
    + Te ne vai
    -> intro
    -

= esplora_paola
{debug: <i>Passo per esplora_paola</i>}


{
- PaolaTalking > 1: Paola: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA PAOLA

= first_qn
~ PaolaTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> paola_talking_second_tier

= second_qn
 ~ PaolaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> paola_talking_second_tier    

= third_qn
~ PaolaTalking++
    Paola dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> paola_talking_second_tier