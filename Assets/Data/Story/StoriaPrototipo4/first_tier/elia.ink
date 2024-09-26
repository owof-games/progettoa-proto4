=== cb_first_tier_elia ===

+ {areTwoEntitiesTogether(Elia, Ettore) && acting} [Elia]
    -> elia_acting ->
    
+ {areTwoEntitiesTogether(Elia, Ettore) && !acting} [Elia]
    -> elia_talking ->    
-

-> cb_first_tier


= elia_acting
    -> first_tier_storylets ->
    //INFO GENERALI//
    + XXX
    + YYY
    
    //SCELTE CONDIZIONALI//
    + (senzatetto){cb_first_tier_greta.greta_acting.missioneGreta}: Elia, Greta vorrebbe parlare con te.
        Elia: col cavolo!
        Ettore: Posso fare qualcosa per te?
        Elia: No, non c'è nulla che puoi fare!
        + + (uniti){weddingAtThePubStorylet} Non è vero! So che vuoi organizzare il nostro matrimonio al bar. Posso convincere Matteo!
            Elia: Non ti conosco ma mi fido di te, va bene!
            Ettore: Ti aspetta nella stanza bianca.
                ~ move_entity(Elia, WhiteRoom)
                ~ move_entity_from_object_storage_to_Ettore_location(SpiedinoCocktail)
    -
->->

= elia_talking
->->



=== prove_per_follow_up
 {   //se Greta ci chiede di poter parlare con Elia, parte la missione
    - cb_first_tier_greta.greta_acting.missioneGreta && not came_from(-> matrimonio_uno):
        -> matrimonio_uno->
    
    //Non abbiamo info aggiuntive, per cui Elia si rifiuta di parlarci.
    - cb_first_tier_greta.greta_acting.missioneGreta && not weddingAtThePubStorylet && came_from(-> matrimonio_uno):
        -> matrimonio_uno->     
        
    //se abbiamo già vissuto lo storylet sul pub e veniamo da matrimonio uno, la conversazione è fluida
    - weddingAtThePubStorylet && came_from(-> matrimonio_uno): 
        -> matrimonio_due_consecutivo ->
    
    //se abbiamo già vissuto lo storylet sul pub, abbiamo già fatto matrimonio uno ma no veniamo direttamente da matrimonio due, introduciamo direttamente il tema
    - weddingAtThePubStorylet && not came_from(-> matrimonio_uno) && seen_ever(-> matrimonio_uno):
        
        -> matrimonio_due_diretto ->
        
    - else: 

         -> EliaSiRacconta ->
    }

-> intro

= matrimonio_uno
    Ettore: Elia, Greta ti vuole vedere.
    Elia: Io no!
    Ettore: Posso farti cambiare idea?
    Elia: Col cavolo!
->->

= matrimonio_due_consecutivo
        Ettore: Non è vero! So che vuoi organizzare il nostro matrimonio al bar. Posso convincere Matteo!
        Elia: Non ti conosco ma mi fido di te, va bene!
        Ettore: Ti aspetta nella stanza bianca.
            ~ move_entity(Elia, WhiteRoom)
->->

= matrimonio_due_diretto
        Ettore: Elia, Greta vuole parlarti. So che avete discusso per il matrimonio di Matteo, ma so come farle cambiare idea.
        Elia: Non ti conosco ma mi fido di te, va bene!
        Ettore: Ti aspetta nella stanza bianca.
            ~ move_entity(Elia, WhiteRoom)
->->

= matrimonio_uno_col_cavolo
    Elia: E ora vattene, non farmi perdere tempo!
->->

=== EliaSiRacconta
{

 - acting == true: -> actor_qn
 - else: -> life_qn

}

= actor_qn
    // we want to only pick one choice here. So we record the current choice count and pass this into the 'ranLim' function, which will return false if the CHOICE_COUNT() has changed. 
    ~ temp cnt = CHOICE_COUNT()
    
    // since we're picking at random, we run the conversation block multiple times, to hopefully get a line if there is one! 
    // if this gets slow, we could check 'cnt == CHOICE_COUNT()' before each one. 
    <- actor_questions
    <- actor_questions
    <- actor_questions
    -> DONE

- (actor_questions)

    +   (pub) {ranLim(cnt)}  {not weddingAtThePubStorylet} 
        Elia e il pub
    +   (greta){ranLim(cnt)} 
        Elia e Greta
    +  (sport) {ranLim(cnt)} 
        Elia parla di sport
    +   {CHOICE_COUNT()==cnt}
        Elia è stanco e ci ignora
    -    
    -> donechat


= life_qn
      // Normal questions use the same system as the sad questions 
    
    ~ temp cnt = CHOICE_COUNT()
        
    <- life_questions
    <- life_questions
    <- life_questions
    -> DONE
    
- (life_questions)
    
    +   (fratello) {ranLim(cnt)} 
        Com'è essere il fratello di Paola?
    +   (gatto) {ranLim(cnt)} 
        Hai cani o gatti?
    +   (zeca) {ranLim(cnt)}
        Com'è il rapporto con Zeca?
    +   {CHOICE_COUNT()==cnt}
    Elia è stanco e ci ignora   
    -    
    -> donechat

= donechat
    + Chiedo qualcosa di diverso -> prove_per_follow_up
    + Me ne vado -> intro