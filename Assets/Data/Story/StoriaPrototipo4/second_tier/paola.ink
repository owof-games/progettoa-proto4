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
    + Fai domande sulla persona Paola -> esplora_paola

    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Paola: so che vuoi suicidarti! -> arringa_finale_Paola


    //SCELTE CONDIZIONALI//
    + (allestimento) {zeca_talking_second_tier.allestimento} Ripetiamo quello che ci ha detto Zeca.
        Paola: "Ho sentito Zeca e Matteo litigare nella stanza prima del buffet"

    + (money) Paola ci dice che per Zeca, Elia è la sua gallina dalle uova d'oro. 

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
    + (torta) {inventoryContents has Torta} Guarda questo cibo!
    + (vino) {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + (asma) {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + (sigaretta) {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!       
    
      
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
     Poi ispezione corpo, una sola scelta
        + (briciole) Esamino le briciole.
            -> loop_reset
        + (sigaretta) Ispeziono la sigaretta elettronica
            -> loop_reset
        + (asma) Ispeziono il boccettino dell'asma
            -> loop_reset
        + (vino) Ispeziono la boccia di vino
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

Con l'aiuto di chi
    + Elia
    + Greta
    + Matteo
    + Zeca
    + Hai fatto da sola

Perché
    + 

Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset