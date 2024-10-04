=== cb_second_tier_elia ===
{debug: <i>passo per cb_second_tier_elia</i>}
+ {are_two_entitites_together(Elia, Ettore) && !peopleTalking} [character:Elia]
    {debug: <i>Ho scelto di parlare con Elia</i>}
    -> elia_acting_second_tier ->
    
+ {are_two_entitites_together(Elia, Ettore) && peopleTalking} [character:Elia]
    -> elia_talking_second_tier -> 
    
-

-> intro

/* ---------------------------------
Opzioni di dialogo con il personaggio Elia
 ----------------------------------*/


=== elia_acting_second_tier
    {debug: <i>Passo per elia_acting_second_tier</i>}
    -> second_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sul personaggio Elia -> esplora_elia_personaggia
    
    //SCELTE CONDIZIONALI//
    
    
        -          
        
    //SCELTE CONDIZIONALI OGGETTI//
     + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
     + {inventoryContents has SpiedinoCocktail} Elia, hai lasciato alle tue spalle questo oggetto.
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Briciole} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
        -> intro
    -
->->

= esplora_elia_personaggia
{debug: <i>Passo per esplora_elia</i>}

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
-> elia_acting_second_tier 

= second_qn
 ~ EliaActing++
    +  altra domanda
    -> advance_time ->
   
    -
-> elia_acting_second_tier     

= third_qn
~ EliaActing++
    Elia dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> elia_acting_second_tier

/* ---------------------------------
Opzioni di dialogo con la persona Elia
 ----------------------------------*/

=== elia_talking_second_tier
 {debug: <i>Passo per elia_talking_second_tier</i>}
    -> second_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sulla persona Elia -> esplora_elia

    //SCELTE CONDIZIONALI//
    + {greta_talking_second_tier.indagini && not are_two_entitites_together(Elia, Zeca)} Qui è dove Elia mette la musica al massimo per non risponderci.
    + (allestimento) {notABigSecretPartOneStorylet.allestimento} Ci dice che lui e Greta hanno lasciato le bottiglie all'ingresso, avvisando Zeca, perché dovevano risolvere un problema coi tavoli
    + (indagini) {iTryToBeAGoodFriendStorylet} Se lo diciamo ad Elia, ci rimane male.
        Dice che si aspettava qualcosa di diverso da Matteo, e che lui sa una cosa ed è stato zitto per difenderlo.
        Elia ci dice che Greta ha dato a Matteo info per "contrattare" meglio con Paola per la sindacalizzazione.
    + {zeca_talking_second_tier.allestimento2} Dice una cosa che contraddice Greta
    + (allestimento2) {iTryToBeAGoodFriendStorylet.allestimento} Elia ci rimane malissimo, inizia a piangere, dice che non se lo aspettava.
        E poi va a cercare Zeca.
    + {zeca_talking_second_tier.love && phone.browse.indagini && elia_talking_second_tier.minacce} Se chiediamo ad Elia se Zeca potrebbe aver denunciato Paola
        Elia sbotta, dice che non ha senso, che il suo "socio d'affari" che motivo avrebbe di rovinarlo? e si allontana subito, possiamo "pedinarlo"
                ~ move_first_entity_to_second_entity_location(Elia,Zeca)
                ~ loopableVariables += EliaSpaventatoPerZeca
    

    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + (minacce) {inventoryContents has Lettera} Guarda questa lettera!
        Elia: "Parlerò solo in presenza del mio avvocato! Via di qui!"
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Briciole} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai -> intro
    -

= esplora_elia
{debug: <i>Passo per esplora_elia</i>}


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
-> elia_talking_second_tier 

= second_qn
 ~ EliaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> elia_talking_second_tier    

= third_qn
~ EliaTalking++
    Elia dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> elia_talking_second_tier