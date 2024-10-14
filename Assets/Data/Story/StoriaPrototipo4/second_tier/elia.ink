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
    + (loop) {new_this_loop(->loop)} Ettore: Non stai notando nulla di strano?
        Matteo: cose 
            -> advance_time ->
            + + [Cambi argomento] -> elia_talking_second_tier

    + (rapporto) {new_this_loop(->rapporto)} Ettore: Che rapporto hai con Paola?
        Matteo: cose
            -> advance_time ->
            + + [Cambi argomento] -> elia_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Secondo te qualcuno potrebbe volere del male a Paola?
        Elia: 
        -> advance_time ->

    + Fai domande sulla persona Elia -> esplora_elia

    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Elia: so che vuoi uccidere Paola! -> arringa_finale_Elia

    //SCELTE CONDIZIONALI//
    + {greta_talking_second_tier.indagini && not are_two_entities_together(Elia, Zeca)} Qui è dove Elia mette la musica al massimo per non risponderci.

    + (allestimento) {notABigSecretPartOneStorylet.allestimento} Ci dice che lui e Greta hanno lasciato le bottiglie all'ingresso, avvisando Zeca, perché dovevano risolvere un problema coi tavoli
    
    + (allestimento2){zeca_talking_second_tier.allestimento2} Dice una cosa che contraddice Greta
        Elia: Zeca sente sesso ovunque, giuro! Ma purtroppo ho passato la mattina con Greta a chiamare i fornitori del pub.
        + + Ettore: Del pub inesistente? Quello della recita?
            Elia: Beh, sì. Mi piace restare nella parte!
        - -

    + (indagini) {iTryToBeAGoodFriendStorylet} Se lo diciamo ad Elia, ci rimane male.
        Dice che si aspettava qualcosa di diverso da Matteo, e che lui sa una cosa ed è stato zitto per difenderlo.
        Elia ci dice che Greta ha dato a Matteo info per "contrattare" meglio con Paola per la sindacalizzazione e questo avrebbe fatto pissare Paola.
   
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

/* ---------------------------------

   Arringa finale. 

 ----------------------------------*/
=== arringa_finale_Elia
Con cosa
    + {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Usando il vino.
    + {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Il boccettino dell'asma.
    + {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} La sigaretta elettronica.
    + {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} La torta.
    -
    
Con l'aiuto di chi
    + Paola
    + Greta
    + Matteo
    + Zeca
    + Hai fatto da solo
    -
    
Perché
    + xxx
    -
    
Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset