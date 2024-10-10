=== cb_first_tier_paola ===
{debug: <i>passo per first_tier_paola</i>}
+ {are_two_entities_together(Paola, Ettore) && !peopleTalking && !startingDinnerStorylet.paolaMorta} [character:Paola] {debug: <i>Ho scelto di parlare con Paola</i>}
    -> paola_acting->

+ {are_two_entities_together(Paola, Ettore) && peopleTalking} [character:Paola]
    -> paola_talking->    
-

-> intro

/* ---------------------------------
Opzioni di dialogo con il personaggio Paola: assenti perché more
 ----------------------------------*/


=== paola_acting
    {debug: <i>Passo per paola_acting</i>}
    -> first_tier_storylets ->
    + {objects_tutorial} Paola: "Non mi parlare, sono morta."
    + {!objects_tutorial} Ettore: "Sembra proprio morta."
    -
    ->->


/* ---------------------------------
Opzioni di dialogo con la persona Paola
 ----------------------------------*/

=== paola_talking
 {debug: <i>Passo per paola_talking</i>}
    -> resting_time ->
    //INFO GENERALI//
    + [Conosci meglio Paola] -> esplora_paola
    + [Te ne vai]
    -> intro
    -
    
    -> paola_talking

= esplora_paola
{debug: <i>Passo per esplora_paola</i>}
-> resting_time ->

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
    Paola: Quella cretina.
    Paola: Quella enorme disgustosa incapace cretina.
    Ettore: Tutto bene?
    Paola: Greta è ancora viva?
    Ettore: Fino a pochi minuti fa, sì.
    Paola: Allora no, non va nulla bene.
    Paola: Sa che voglio solo ricariche al rabarbaro per la mia sigaretta elettronica.
    Paola: E invece, di nuovo, me l'ha presa al mentolo.
    Paola: Ora la uccido.
    -> advance_time ->
    
    -
-> paola_talking 

= second_qn
 ~ PaolaTalking++
    Ettore: Grazie per avermi chiamato per questa recita.
    Paola: Non è recita, è improvvisazione.
    Paola: Ma grazie a te per la pazienza.
    Paola: Come vedi, questa è tutta gente incapace. Enormemente incapace.
    Ettore: Da che compagnia vengono?
    Paola: COMPAGNIA? MA LI HAI VISTI?
    Paola: Sono parenti e dipendenti e conoscenti.
    Paola: E odio parenti, dipendenti e conoscenti.
    Paola: Ma dato che ancora non sei una di queste tre cose, è bene che me ne vada.
        -> advance_time ->
    ~ move_this_entity_in_a_different_room(Paola)
    -
-> paola_talking    

= third_qn
~ PaolaTalking++
    Ettore: Quindi sei una regista?
    Paola: Anche. In realtà il lavoro principale è gestire l'azienda di famiglia.
    Paola: Lavoro che dovrebbe toccare anche ad Elia.
    Ettore: Ma non vuole farlo?
    Paola: No, il problema è che vuole farlo. Ma non so se ci hai parlato.
    Paola: Non si lava l'ombelico da quando ha sei anni: è convinto che facendolo gli si aprirà la pancia, le viscere usciranno tutte, e morirà.
    Paola: A volte spero davvero che accada.
    -> advance_time ->    
    -    
-> paola_talking