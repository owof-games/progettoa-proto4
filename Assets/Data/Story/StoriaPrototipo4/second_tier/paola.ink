=== cb_second_tier_paola ===
{debug: <i>passo per second_tier_paola</i>}
+ {are_two_entities_together(Paola, Ettore)} [character:Paola]
    -> paola_talking_second_tier->
    
+ {are_two_entities_together(Paola, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Paola]
    -> paola_is_dead ->
-    



-> intro


/* ---------------------------------

Opzioni di dialogo con la persona Paola

 ----------------------------------*/

=== paola_talking_second_tier
 {debug: <i>Passo per paola_talking</i>}
    //INFO GENERALI//
    + (loop) {new_this_loop(->loop)} Ettore: Non stai notando nulla di strano?
        Paola: cose 
            -> advance_time ->
            + + [Cambi argomento] -> paola_talking_second_tier

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Non, ehm. Ti fa male da qualche parte? In modo quasi mortale?
        Paola: cose
            -> advance_time ->
            + + [Cambi argomento] -> paola_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Paola, qualcuno ti potrebbe odiare qui?
        Paola: 
        -> advance_time ->

    + Fai domande sulla persona Paola -> esplora_paola

    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Paola: so che vuoi suicidarti! -> arringa_finale_Paola


    //SCELTE CONDIZIONALI//
    + (allestimento) {zeca_talking_second_tier.allestimento} Ripetiamo quello che ci ha detto Zeca.
        Paola: Ho sentito Zeca e Matteo litigare nella stanza gialla prima del buffet.
        Paola: Quasi quasi vado a chiedere a Zeca il perché.

    + (money) Paola ci dice che per Zeca, Elia è la sua gallina dalle uova d'oro.

    + {liarCallLiarStorylet.indagini}: Zeca ci dice che la polizia ha avuto anche dati personali di Paola. Dati a cui solo la segretaria personale avrebbe potuto avere accesso. Se chiediamo a Paola, cosa ci dirà?

    + (foto) {zeca_talking_second_tier.allestimento2} Diciamo la cosa del vibratore. Paola ci dice che se allontaniamo Greta dalla stanza, ci darà qualcosa di interessante.

    + (foto2) {greta_talking_second_tier.foto} Se risolviamo: foto Elia e Greta che scopano al pub.
            Vedi tu che farci! (non dobbiamo avere niente in mano)
            {
            - LIST_COUNT(inventoryContents) > 0:
            ~ throw_exception("Paola: Peccato tu non possa portarla con te.")
            - else:
                ~ inventoryContents += Foto
                }
                
    //SCELTE CONDIZIONALI OGGETTI//
     + (Minacce) {inventoryContents has Lettera} Guarda questa lettera!
        Paola: Uh, guarda un po' chi si dovrebbe fare i cazzi propri!.
            ~ inventoryContents -= Lettera
            ~ objectStorageContents += Lettera
    + (torta) {inventoryContents has Torta} Ettore: Hai idea di chi abbia preso questa torta?
        Paola: Qualcuno che vuole uccidermi?
        Paola: Scherzo.
        Paola: Ma pensavo tutti sapessero che sono allergica alle arachidi, mortalmente. E questa è piena di crema d'arachidi.
        Paola: Fortuna che oramai ne riconosco l'odore.
        Paola: Pensa che da piccola sono andata in coma per tre giorni.
        Paola: Per risvegliarmi e trovarmi davanti Elia che mi chiedeva: Ma ora sei Cristo?
        Paola: Ora sei resuscitata, come Vegeta?
            -> advance_time ->
    + (vino) {inventoryContents has BottigliaDiVino} Ettore: Che, uhm, che sai di questa bottiglia?
        Paola: Amo da morire questo vino.
        Paola: E che per questo spero ce ne siano almeno altre tre bottiglie da qualche parte.
    + (asma) {inventoryContents has FlaconcinoAsma} Ettore: Ho trovato questo.
        Paola: Oh, grazie al cielo!
        Paola: Non sapevo più dove diavolo fosse finito.
        Paola: Tra polvere e muffa in questo posto, senza potrei morire.
            ~ inventoryContents -= FlaconcinoAsma
            ~ objectStorageContents += FlaconcinoAsma
    + (sigaretta) {inventoryContents has SigarettaElettronica} Ettore: Sai chi fuma qui tra noi?
        Paola: Erba? Zeca.
        Paola: Oppio? Matteo.
        Paola: Tabatto? Greta.
        Paola: Vorrei capire di cosa è fatto Elia per essere così cretino, invece.
        Paola: Io vivo di sigaretta elettronica. Adoro i suoi sapori chimici, la possibilità di fumarla ovunque.
        Paola: Ed è esattamente quella che hai in mano.
            ~ inventoryContents -= SigarettaElettronica
            ~ objectStorageContents += SigarettaElettronica
        Ettore: Ma non si può fumare ov...
        Paola: Ah, finalmente! Quanto mi sei mancata!    
            -> advance_time ->
      
    + Te ne vai
        -> intro
    -
    
    -> paola_talking_second_tier

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



/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/

=== paola_is_dead
     Ettore: {~ Non c'è dubbio, è morta|Il corpo è ancora caldo|Cosa è giusto fare, adesso?}
        + (briciole) [Ci sono tracce di briciole]
            Sono rimasugli all'angolo della bocca. Forse qualcosa di dolce.
            -> loop_reset
        + (sigaretta) [Controlli la sigaretta elettronica]
            Il dispenser del liquido è completamnte svuotato.
            -> loop_reset
        + (asma) [Ispezioni il boccettino dell'asma]
            Paola lo stringe ancora forte in pugno, come fosse un'arma. O un'ancora di salvezza.
            -> loop_reset
        + (vino) [Esamini la boccia di vino]
            Rimane solo un goccio sul fondo. Le labbra di Paola hanno lo stesso colore.
            -> loop_reset
        + Lascio perdere
            -> intro
        -

-> paola_is_dead



/* ---------------------------------

   Arringa finale. 

 ----------------------------------*/
=== arringa_finale_Paola
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
    + Zeca
    + Hai fatto da sola
    -
    
Perché
    + xxx
    -
    
Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset