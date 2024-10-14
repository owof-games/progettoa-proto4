=== cb_second_tier_elia ===
{debug: <i>passo per cb_second_tier_elia</i>}
+ {are_two_entities_together(Elia, Ettore)} [character:Elia]
    -> elia_talking_second_tier -> 


+ {are_two_entities_together(Elia, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Elia]
    -> paola_is_dead_elia ->

-

-> intro


/* ---------------------------------
Opzioni di dialogo con la persona Elia
 ----------------------------------*/

=== elia_talking_second_tier
 {debug: <i>Passo per elia_talking_second_tier</i>}
    //INFO GENERALI//
    + Fai domande sulla persona Elia -> esplora_elia

    //SCELTE CONDIZIONALI//
    + {greta_talking_second_tier.indagini && not are_two_entities_together(Elia, Zeca)} Qui è dove Elia mette la musica al massimo per non risponderci.
    + (allestimento) {notABigSecretPartOneStorylet.allestimento} Ci dice che lui e Greta hanno lasciato le bottiglie all'ingresso, avvisando Zeca, perché dovevano risolvere un problema coi tavoli
    + (indagini) {iTryToBeAGoodFriendStorylet} Se lo diciamo ad Elia, ci rimane male.
        Dice che si aspettava qualcosa di diverso da Matteo, e che lui sa una cosa ed è stato zitto per difenderlo.
        Elia ci dice che Greta ha dato a Matteo info per "contrattare" meglio con Paola per la sindacalizzazione e questo avrebbe fatto pissare Paola.
    + {zeca_talking_second_tier.allestimento2} Dice una cosa che contraddice Greta
    + (minacce) {zeca_talking_second_tier.love && phone.browse.indagini && elia_talking_second_tier.minacce} Se chiediamo ad Elia se Zeca potrebbe aver denunciato Paola
        Elia sbotta, dice che non ha senso, che il suo "socio d'affari" che motivo avrebbe di rovinarlo? e si allontana subito, possiamo "pedinarlo"
                ~ move_first_entity_to_second_entity_location(Elia,Zeca)
                ~ loopableVariables += EliaSpaventatoPerZeca
    

    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has Torta} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai -> intro
    -
    
    -> elia_talking_second_tier

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


/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/

=== paola_is_dead_elia
    
    Elia: {~ }

-> advance_time ->
->->