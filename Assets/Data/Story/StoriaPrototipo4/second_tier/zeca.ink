=== cb_second_tier_zeca ===
{debug: <i>passo per second_tier_zeca</i>}

+ {are_two_entities_together(Zeca, Ettore)} [character:Zeca]
    -> zeca_talking_second_tier ->    

+ {are_two_entities_together(Zeca, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Zeca]
    -> paola_is_dead_zeca ->
-    

-

-> intro




/* ---------------------------------
Opzioni di dialogo con la persona Zeca
 ----------------------------------*/

=== zeca_talking_second_tier
 {debug: <i>Passo per zeca_talking_second_tier</i>}
    //INFO GENERALI//
    + (loop) {new_this_loop(->loop)} Ettore: Non stai notando nulla di strano?
        Zeca: cose 
            -> advance_time ->
            + + [Cambi argomento] -> zeca_talking_second_tier

    + (rapporto) {new_this_loop(->rapporto)} Ettore: Che rapporto hai con Paola?
        Zeca: cose
            -> advance_time ->
            + + [Cambi argomento] -> zeca_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Secondo te qualcuno potrebbe volere del male a Paola?
        Zeca: 
        -> advance_time ->

    + Fai domande sulla persona Zeca -> esplora_zeca

    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Zeca: so che vuoi uccidere Paola! -> arringa_finale_Zeca

    TODO: scelta da compiere -> rischiare di avere mille scelte a disposizione, o nestare alcune scelte sotto altre?

    //SCELTE CONDIZIONALI//
    + (allestimento) {notABigSecretPartTwoStorylet.allestimento} Ci dice che lui e Matteo hanno lasciato il cibo sui tavoli e poi chiesto a Greta di occuparsene, che loro dovevano sistemare i costumi.
    
    + (allestimento2) {elia_talking_second_tier.allestimento} Zeca ci dice che qualcuno si è chiuso nella stanza a scopare a una certa, mentre lui e Matteo montavano le luci
        Senza convinzione, dice "forse Paola e il suo vibratore. Anche se non ho sentito il solito puzzo da deodorante per il cesso che si porta dietro."

    + {paola_talking_second_tier.allestimento}: Paola: Ho sentito Zeca e Matteo litigare nella stanza prima del buffet. Come reagisce Zeca?

    + (money) {paola_talking_second_tier.money} Se lo diciamo a Zeca, ci dice che Paola piuttosto dovrebbe farsi delle domande su Matteo, che è lui a campare sulle spalle dei due fratelli.

    + (love) Zeca ci dice che farebbe di tutto per proteggere Elia.
        + + {paola_talking_second_tier.money} Paola ci dice che per Zeca, Elia è la sua gallina dalle uova d'oro.
        + + {TrueLoveStorylet} Ettore: Quindi, insomma, tu ed Elia, non è solo stima lavorativa.


    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has Torta} Guarda questo cibo!
    + (allestimento3) {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
    -> intro
    -
    
    -> zeca_talking_second_tier
    

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



/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/
 
=== paola_is_dead_zeca
    
    Zeca: {~ }

-> advance_time ->
->->


/* ---------------------------------

   Arringa finale. 

 ----------------------------------*/
=== arringa_finale_Zeca
Con cosa
    + {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Usando il vino.
    + {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Il boccettino dell'asma.
    + {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} La sigaretta elettronica.
    + {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} La torta.
    -
    
Con l'aiuto di chi
    + Elia
    + Greta
    + Matteo
    + Paola
    + Hai fatto da solo
    -
    
Perché
    + xxx
    -
Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset