=== cb_second_tier_matteo ===
{debug: <i>passo per second_tier_matteo</i>}

+ {are_two_entities_together(Matteo, Ettore)} [character:Matteo]
    -> matteo_talking_second_tier ->    

+ {are_two_entities_together(Matteo, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Matteo]
    -> paola_is_dead_matteo ->
-    

-

-> intro


/* ---------------------------------
Opzioni di dialogo con la persona Matteo
 ----------------------------------*/

=== matteo_talking_second_tier
 {debug: <i>Passo per matteo_talking_second_tier</i>}
    //INFO GENERALI//
    + Fai domande sulla persona Matteo -> esplora_matteo
    
    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Matteo: so che vuoi uccidere Paola! -> arringa_finale_Matteo

    //SCELTE CONDIZIONALI//
    + (allestimento) {paola_talking_second_tier.allestimento} Diciamo quello che Greta ha detto su Matteo e il litigio.
        Matteo: Quella strega! Devo subito trovare Zeca!
         + + {whiteRoomContents hasnt Ettore} Ettore: Credo sia nella stanza bianca.
                ~ move_entity(Elia, WhiteRoom)
        + + {greenRoomContents hasnt Ettore} Ettore: Credo sia nella stanza verde.
                ~ move_entity(Elia, GreenRoom)
        + + {yellowRoomContents hasnt Ettore} Ettore: Credo sia nella stanza gialla.                
                ~ move_entity(Elia, YellowRoom)
        + + {redRoomContents hasnt Ettore} Ettore: Credo sia nella stanza rossa.               
                ~ move_entity(Elia, RedRoom)
        + + Ettore: "Non ho idea di dove sia, scusa."
   
    + (coglione) {trueLoveStorylet} Matteo è felice per Zeca, e per Greta, ma crede che Elia sia un coglione.
    

    //SCELTE CONDIZIONALI OGGETTI//
    + (lettera) {inventoryContents has Lettera} Guarda questa lettera!
        Matteo: Mettila via, subito! Se Paola la trova ti mangia vivo!
    + {inventoryContents has Torta} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
    -> intro
    -
    
    -> matteo_talking_second_tier

= esplora_matteo
{debug: <i>Passo per esplora_matteo</i>}


{
- MatteoTalking > 1: Matteo: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA MATTEO

= first_qn
~ MatteoTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> matteo_talking_second_tier 

= second_qn
 ~ MatteoTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> matteo_talking_second_tier    

= third_qn
~ MatteoTalking++
    Matteo dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> matteo_talking_second_tier



/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/

=== paola_is_dead_matteo
    
    Matteo: {~ }

-> advance_time ->
->->


/* ---------------------------------

   Arringa finale. 

 ----------------------------------*/
=== arringa_finale_Matteo
Con cosa
    + {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Usando il vino.
    + {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Il boccettino dell'asma.
    + {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} La sigaretta elettronica.
    + {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} La torta.

Con l'aiuto di chi
    + Elia
    + Greta
    + Paola
    + Zeca
    + Hai fatto da solo

Perché
    + 

Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset