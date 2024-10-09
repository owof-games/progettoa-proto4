=== cb_first_tier_paola ===
{debug: <i>passo per first_tier_paola</i>}
+ {are_two_entities_together(Paola, Ettore) && !peopleTalking && !startingDinnerStorylet.paolaMorta} [character:Paola] {debug: <i>Ho scelto di parlare con Paola</i>}
    -> paola_acting->

+ {are_two_entities_together(Paola, Ettore) && peopleTalking} [character:Paola]
    -> paola_talking->    
-

-> intro

/* ---------------------------------
Opzioni di dialogo con il personaggio Paola: assenti perché more
 ----------------------------------*/


=== paola_acting
    {debug: <i>Passo per paola_acting</i>}
    + {objects_tutorial} Paola: "Non mi parlare, sono morta."
    + {!objects_tutorial} Ettore: "Sembra proprio morta."
    -
    ->->


/* ---------------------------------
Opzioni di dialogo con la persona Paola
 ----------------------------------*/

=== paola_talking
 {debug: <i>Passo per paola_talking</i>}
    -> resting_time ->
    //INFO GENERALI//
    + Conosci meglio Paola. -> esplora_paola

    //SCELTE CONDIZIONALI//
    

    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Torta} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
    -> intro
    -
    
    -> paola_talking

= esplora_paola
{debug: <i>Passo per esplora_paola</i>}
-> resting_time ->

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
    +  [Per ovviare al problema delle cose stampate random, posso mettere scelte random non stampate, imperative.]
    -> advance_time ->
    
    -
-> paola_talking 

= second_qn
 ~ PaolaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> paola_talking    

= third_qn
~ PaolaTalking++
    Paola dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> paola_talking