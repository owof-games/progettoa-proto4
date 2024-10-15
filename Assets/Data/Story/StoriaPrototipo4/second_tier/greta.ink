=== cb_second_tier_greta ===
{debug: <i>passo per first_tier_greta</i>}
+ {are_two_entities_together(Greta, Ettore)} [character:Greta] 
    -> greta_talking_second_tier->    

+ {are_two_entities_together(Greta, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Greta]
    -> paola_is_dead_greta ->
-    

-

-> intro


/* ---------------------------------

Opzioni di dialogo con la persona Greta

 ----------------------------------*/

=== greta_talking_second_tier
 {debug: <i>Passo per greta_talking_second_tier</i>}
    //INFO GENERALI//
    + (loop) {new_this_loop(->loop)} Ettore: Non stai notando nulla di strano?
        Matteo: cose 
            -> advance_time ->
            + + [Cambi argomento] -> greta_talking_second_tier

    + (rapporto) {new_this_loop(->rapporto)} Ettore: Che rapporto hai con Paola?
        Matteo: cose
            -> advance_time ->
            + + [Cambi argomento] -> greta_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Secondo te qualcuno potrebbe volere del male a Paola?
        Greta: 
        -> advance_time ->

    + Fai domande sulla persona Greta -> esplora_greta

    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Greta: so che vuoi uccidere Paola! -> arringa_finale_Greta


    //SCELTE CONDIZIONALI//
    + (indagini) {phone.browse.indagini} Qui Greta ci dice che Paola vuole estromettere Elia dall'azienda.

    + (indagini2) {elia_talking_second_tier.indagini} Greta ci dice che Elia sta usando il discorso sindacato per mostrare al CdA che Paola è troppo debole e inetta

    + (indagini3) {trueLoveStorylet} Se diciamo della tresca tra Elia e Zeca.
    Se lo diciamo a Greta, lei si sente usata, e giura che smetterà di coprire i furti di denaro di Elia.
        + + Ettore: Quindi, lui ti piace davvero?
            Greta: Non mi giudicare.
            Greta: Sono consapevole che sia un idiota.
            Greta: Ma in un mondo che fa sempre più schifo, la sua leggerezza fa bene al cuore.

    + {liarCallLiarStorylet.indagini} Zeca ci dice che la polizia ha avuto anche dati personali di Paola. Dati a cui solo la segretaria personale avrebbe potuto avere accesso. Che ci dice Greta?


    + (allestimento3) {zeca_talking_second_tier.allestimento2} Dice una cosa che contraddice Elia
                Greta: Non ho visto la sala gialla per tutta la mattina. Ero con Elia a sistemare i tavoli delle altre sale.
    + (allestimento2) {iTryToBeAGoodFriendStorylet} Diciamo del veleno per topi.
        Se chiediamo a Greta, ipoteticamente, chi potrebbe commettere un crimine, la sua risposta sarà "Beh, chi ha comprato il liquido per le sigarette elettroniche" e poi spiega perché.


    + {paola_talking_second_tier.foto} Possiamo allontanare Greta con una scusa.
        + + (foto) Greta se ne va.
        + +  Abbiamo una sola opzione a tier

    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has Torta} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + (sigaretta) {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
        Greta ci dice che chi ha comprato la ricarica palesemente non conosce Paola, perché lei è in fissa solo col rabarbaro da mesi.
    
      
    + Te ne vai -> intro
    -
    
    -> greta_talking_second_tier
    

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
    Qualcosa sulla famiglia, non esplicita come cosa, ma si capisce la morte suicida dei genitori, i debiti etc.
    Si può collegare al discorso lavoro di Matteo con una parola chiave, unica. Una metafora?
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



/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/
 
=== paola_is_dead_greta
    
    Greta: {~ Merda, merda, merda!|Quindi dovrò trovarmi un nuovo lavoro?|E se fosse solo uno scherzo?|Certo, ha una faccia da stronza pure da morta.}

-> advance_time ->
->->




/* ---------------------------------

   Arringa finale. 

 ----------------------------------*/
=== arringa_finale_Greta
Con cosa
    + {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Usando il vino.
    + {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Il boccettino dell'asma.
    + {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} La sigaretta elettronica.
    + {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} La torta.
    -
    
Con l'aiuto di chi
    + Elia
    + Paola
    + Matteo
    + Zeca
    + Hai fatto da sola
    -
    
Perché
    + xxx
    -
    
Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset