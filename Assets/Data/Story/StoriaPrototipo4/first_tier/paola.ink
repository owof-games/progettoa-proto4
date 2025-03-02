=== cb_first_tier_paola ===
{debug: <i>passo per first_tier_paola</i>}
+ {are_two_entities_together(Paola, Ettore) && peopleTalking==false &&  loopableVariables hasnt PaolaDavveroMorta} [character:Paola] {debug: <i>Ho scelto di parlare con Paola</i>}
    -> paola_acting->

+ {are_two_entities_together(Paola, Ettore) && peopleTalking &&  loopableVariables hasnt PaolaDavveroMorta} [character:Paola]
    -> paola_talking->    
- 


-> intro

/* ---------------------------------
Opzioni di dialogo con il personaggio Paola: assenti perché more
 ----------------------------------*/


=== paola_acting
    {debug: <i>Passo per paola_acting</i>}
    ~ move_locked_entities(false)
    -> first_tier_storylets ->
    + {objects_tutorial} Ettore: Sembra proprio morta
            Paola: Non mi parlare, sono morta.
    + {!objects_tutorial} Ettore: Sembra proprio morta
    -
    ->->


/* ---------------------------------
Opzioni di dialogo con la persona Paola
 ----------------------------------*/

=== paola_talking
 {debug: <i>Passo per paola_talking</i>}
 ~ move_locked_entities(false)
    //INFO GENERALI//
    + [Conosci meglio Paola] -> esplora_paola
    + [Te ne vai]
    -> intro
    -
    
    -> paola_talking

    = esplora_paola
    {debug: <i>Passo per esplora_paola</i>}
    
    {
    - PaolaTalking > 0: Paola: Ti chiedo scusa, ma ho altro da fare ora.
        -> advance_time ->
        -> intro
    - else:
        { shuffle once:
        -   -> first_qn
        -   -> second_qn
        -   -> third_qn
        
        }
    }

//DOMANDE SUllA PERSONA PAOLA

    = first_qn
    ~ PaolaTalking++
    ~ inConversazione += Paola
        Paola: Quella cretina.
        Paola: <rage>Quella<waitrage> enorme<waitrage> disgustosa<waitrage> incapace<waitrage> cretina.</rage>
        Ettore: Tutto bene?
        Paola: Greta è ancora viva?
        Ettore: Fino a pochi minuti fa, sì.
        Paola: Allora no, non va nulla bene.
        Paola: Sa che voglio solo ricariche al rabarbaro per la mia sigaretta elettronica.
        Paola: E invece me l'ha presa al mentolo.
        Paola: Ora la uccido.
        {are_two_entities_together(Greta, Paola): Greta: Merda.} 
            -> advance_time ->
            -> paola_talking 

    = second_qn
     ~ PaolaTalking++
     ~ inConversazione += Paola
        Ettore: Grazie per avermi chiamato per questa recita.
        Paola: Non è recita, è improvvisazione.
        Paola: Ma grazie a te per la pazienza.
        Paola: Come vedi, questa è tutta gente incapace. Enormemente incapace.
        Ettore: Da che compagnia vengono?
        Paola: <cry>COMPAGNIA? MA LI HAI VISTI?</cry>
        Paola: Sono parenti e dipendenti e conoscenti.
        Paola: E odio parenti, dipendenti e conoscenti.
        Paola: E se vuoi sopravvivere stasera, vedi di non diventare nessuna delle tre cose.
            -> advance_time ->
            -> paola_talking  


    = third_qn
    ~ PaolaTalking++
    ~ inConversazione += Paola
        Ettore: Quindi sei una regista?
        Paola: Anche. In realtà il lavoro principale è gestire l'azienda di famiglia.
        Paola: Lavoro che dovrebbe toccare anche a Elia.
        Ettore: Ma non vuole farlo?
        Paola: No, il problema è che vuole farlo. Ma non so se ci hai parlato.
        Paola: Non si lava l'ombelico da quando ha sei anni: è convinto che facendolo gli si aprirà la pancia, le viscere usciranno tutte, e morirà.
        Paola: Non dovrebbe pulirsi il culo da solo, figurati gestire un colosso come la Londar.
            -> advance_time ->
            -> paola_talking



