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
    + Conosci meglio Paola. -> esplora_paola
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
    +  [Per ovviare al problema delle cose stampate random, posso mettere scelte random non stampate, imperative.]
    -> advance_time ->
    
    -
-> paola_talking 

= second_qn
 ~ PaolaTalking++
    Ettore: Grazie per avermi chiamato per questa recita.
    Paola: Non è recita, è improvvisazione.
    Paola: Ma grazie a te per la pazienza.
    Paola: Come vedi, questa è tutta gente incapace. Enormemente incapace.

    -> advance_time ->
   
    -
-> paola_talking    

= third_qn
~ PaolaTalking++
    Paola dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> paola_talking