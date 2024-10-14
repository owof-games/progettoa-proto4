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
    + Fai domande sulla persona Greta -> esplora_greta

    //SCELTE CONDIZIONALI//
    + (indagini) {phone.browse.indagini} Qui Greta ci dice che Paola vuole estromettere Elia dall'azienda.

    + (indagini2) {elia_talking_second_tier.indagini} Greta ci dice che Elia sta usando il discorso sindacato per mostrare al CdA che Paola è troppo debole e inetta

    + {zeca_talking_second_tier.allestimento2} Dice una cosa che contraddice Elia

    + (allestimento2) {iTryToBeAGoodFriendStorylet.allestimento} Diciamo del veleno per topi.
        Se chiediamo a Greta, ipoteticamente, chi potrebbe commettere un crimine, la sua risposta sarà "Beh, chi ha comprato il liquido per le sigarette elettroniche" e poi spiega perché.

    + (indagini3) {trueLoveStorylet} Se diciamo della tresca tra Elia e Zeca.
    Se lo diciamo a Greta, lei si sente usata, e giura che smetterà di coprire i furti di denaro di Elia.

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
    
    Greta: {~ Merda, merda, merda!|Quindi dovrò trovarmi un nuovo lavoro?|E se fosse solo uno scherzo?}

-> advance_time ->
->->