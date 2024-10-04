//INDEX
=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}
{
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not startingDinnerStorylet && new_this_loop(->startingDinnerStorylet):
    -> startingDinnerStorylet


    - are_three_entities_together(Elia, Matteo, Ettore) && not are_two_entitites_together(Elia, Zeca) && not are_two_entitites_together(Elia, Greta) && marryMeStorylet && new_this_loop(->weddingAtThePubStorylet):
    -> weddingAtThePubStorylet

    - are_three_entities_together(Elia, Greta, Ettore) && elia_acting.missioneGreta && not are_two_entitites_together(Elia, Matteo) && not are_two_entitites_together(Elia, Zeca) && new_this_loop(->anEavesdropAboutFriendshipStorylet):
    -> anEavesdropAboutFriendshipStorylet

//La morte di Paola deve arrivare solo quando abbbiamo fatto tutti i tutorial e abbiamo compiuto le scelte su Matteo e Zeca
 - objects_tutorial && notebook_tutorial && talking_tutorial && (choiceMatteoVuoleSposareEttore == True or choiceMatteoVuoleSposareEttore == False) && (choiceMenteZeca == True or choiceMenteZeca == False) && currentTime >= 200: -> paolaIsDeadStorylet



//CONFESSIONI SOLITARIE 

    - are_two_entitites_together(Matteo, Ettore) && inventoryContents has AnticoPugnale && not are_two_entitites_together(Elia, Ettore) && not are_two_entitites_together(Ettore, Zeca) && not are_two_entitites_together(Ettore, Greta) && new_this_loop(->aStrangeKnifeStorylet):
    -> aStrangeKnifeStorylet

    - are_two_entitites_together(Matteo, Ettore) && not are_two_entitites_together(Elia, Ettore) && not are_two_entitites_together(Ettore, Zeca) && not are_two_entitites_together(Ettore, Greta) && new_this_loop(->marryMeStorylet):
    -> marryMeStorylet
    
    - are_two_entitites_together(Zeca, Ettore) && not are_two_entitites_together(Elia, Ettore) && not are_two_entitites_together(Ettore, Matteo) && not are_two_entitites_together(Ettore, Greta) && new_this_loop(->worstBestManStorylet):
    -> worstBestManStorylet    


//MATERIALI PER TUTORIAL
- currentTime > 200 && not objects_tutorial: -> objects_tutorial

- currentTime > 200 && objects_tutorial && new_this_loop(->objects_tutorial) && not notebook_tutorial: -> notebook_tutorial

- currentTime > 200 && objects_tutorial && notebook_tutorial && new_this_loop(->notebook_tutorial) && not talking_tutorial: -> talking_tutorial

}
->->

//STORYLET CONDIZIONALI
=== startingDinnerStorylet
{debug: <i>Passo per startingDinnerStorylet</i>}
Inizio: cena, battute veloci, salta la luce, torna: Paola è morta. Da lì, indagine
Matteo: c'è Paola!
    Paola: c'è Matteo!
    -> advance_time ->
        + Ci sono anche io!
        + E ci sono dei gatti!
        -
    Greta: Ma soprattutto c'è un coniglio
        + (paolaMorta) E qui Paola muore (per finta).
    -> advance_time ->

->->




=== weddingAtThePubStorylet
{debug: <i>Passo per weddingAtThePubStorylet</i>}
Discussione Matteo ed Elia su matrimonio al bar. Elia vuole farlo al pub, Matteo non ne vuole sapere.
    -> advance_time ->
    + (matteoSiSposa) [Avanzo]
    -

->->


=== anEavesdropAboutFriendshipStorylet
{debug: <i>Passo per anEavesdropAboutFriendshipStorylet</i>}
Conversazione origliata: capiamo che Greta non ce l'ha con Paola, ma cagate tipo "prima che papà mi adottasse ho vissuto in strada, non possono rivivere quel trauma".
    -> advance_time ->
    + (gretaTriste) [Avanzo]
    -
->->



=== marryMeStorylet
{debug: <i>Passo per marryMe</i>}
Finalmente siamo soli, proposta di matrimonio, ma la prende larga.
Se qualcuno entra, cambia argomento.
{
    - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Matteo, Ettore, Greta) or are_three_entities_together(Matteo, Ettore, Zeca): -> quickTalk
    -else: ->->
}


    -> advance_time ->
    + (matteoSiSposa) [Avanzo]
    -
 ->->
 
 = quickTalk   
    Matteo cambia argomento e dice cose a caso.
-> intro

=== worstBestManStorylet
{debug: <i>Passo per worstBestMate</i>}
Zeca ci dice che non vede e sente Paola da una vita, che prima erano molto legati ma poi cose.
{are_two_entitites_together(Zeca, Elia): Zeca porterà Elia ad unirsi al discorso, e ogni tanto metteremo degli incisi, una scenetta dedicata?}
    -> advance_time ->
    + (paolaZeca) [Avanzo]
    -
->->


=== aStrangeKnifeStorylet
{debug: <i>Passo per aStrangeKnifeStorylet</i>}
Matteo ci dice cose se ci vede in giro col suo coltello, e se lo riprende.
        ~ inventoryContents -= AnticoPugnale
        ~ objectStorageContents += AnticoPugnale
->->

//STORYLET DA SCELTE
=== hardTrueFeelingsStorylet
{debug: <i>Passo per hardTrueFeelingsStorylet</i>}
Matteo ci dice che ama Greta
{
    - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Matteo, Ettore, Greta) or are_three_entities_together(Matteo, Ettore, Zeca): -> quickTalk
    -else: ->->
}
    -> advance_time ->
    + (matteoGreta)[Avanzo]
    -
->->

= quickTalk
Matteo: "Uh, è il caso di parlarne solo quando saremo soli".
-> intro
//STORYLET PER TUTORIAL


=== objects_tutorial
        ~ peopleTalking = true
        TODO: come far uscire dal talking? possibile avere un contatore ad hoc che dopo un po' faccia urlare a Paola "si ricomincia" e resetta tutto? -> creare uno storylet che è uguale a tempo corrente (= reset di paola) + tempo. Mattia imposterebbe una variabile che è -1, quando Paola si incazza la impostiamo a currentTime. Lo storylet parte quando il tempo attuale è uguale a Variabile + tempo definito. Variabile da resettare in ogni loop assieme alle altre variabili.
        Paola: "Stop stop stop maledizione!"
        Paola: "Sant'iddio Greta, dove hai messo le potenziali armi?"
        Paola: "Ettore, ricordati che se hai un oggetto in mano puoi mostrarlo e ottenere nuove informazioni."
        ~ move_first_entity_to_second_entity_location(Elia,Ettore)
        Elia: "Cerca di trovare la limetta più avanti possibile perché è quella l'arma del delitto!"
        Paola: "Elia, coglione! Ora vi tocca improvvisare, l'arma sarà un'altra. Mi spiace per il livello di non professionalismo, Ettore."
        Paola: "Cinque minuti e poi riprendiamo!"
            -> advance_time ->
            + [Avanzo]
            -
            ->->

=== notebook_tutorial
        ~ peopleTalking = true
        Paola: "STOP STOP STOP DI NUOVO!"
        Paola: "GRETA! Ma l'hai dato il taccuino ad Ettore?!?"
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Greta: "Io, ehm, no, io."
        Paola: "Daglielo, ora, svampita! Ettore, sono mortificata."
            ~ activeNotebook = true
        Paola: "Il taccuino è fondamentale: tiene traccia degli elementi fondamentali per l'investigazione."
        Paola: "Ma presta attenzione: molte verità si capiscono solo prestando attenzione anche a cose che sul taccuino non ci sono."
        Paola: "E saranno fondamentali per risolvere le contraddizioni.
        Ettore: "Contraddizioni?"
        Paola: "Quando avrai due informazioni contrastanti su un personaggio, ti si aprirà sul taccuino la possibilità di scegliere cosa è vero e cosa no."
        Paola: "Sarai tu a decidere quando avrai abbastanza informazioni per dare una risposta, e a quel punto incriminare la persona responsabile."
        Paola: "Riposiamo un attimo tutti, ma un attimo!"
        -> advance_time ->
            + [Avanzo]
            -
            ->->

=== talking_tutorial
        ~ peopleTalking = true
        Paola: "Madre santa, che fatica prepararvi per questo pezzo!"
        Paola: "Ettore, Ettore. Nel teatro di improvvisazione il ritmo è importante, sono io a dovertelo dire?"
            ~ move_first_entity_to_second_entity_location(Elia,Ettore)
            ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
        Elia: "A dire il vero, sì."
        Paola: "CHI TI HA INTERPELLATO, EUNUCO?!?"
        Paola: "Dicevo, Ettore. Se vedi che i personaggi non ti dicono nulla di nuovo, non ti viene il dubbio che..."
        Ettore: "Che si siano annoiati?"
        Zeca: "Che potrebbero dire cose diverse se sono in stanze diverse, o con persone diverse. O da sole."
        Paola: "Grazie. Leccaculo."
        Paola: "Ma stavo pensando anche a un'altra cosa: i personaggi parlano tra loro anche quando tu non ci sei. Hai mai pensato che, con le giuste condizioni, potresti <i>origliare</i> una conversazione?"
        Paola: "Cavolo, sei bellino ma non sei sveglio, eh?"
        Paola: "Qualche minuto di pausa e poi riprendiamo, spero in modo definitivo!
        -> advance_time ->
            + [Avanzo]
            -
            ->->


//MORTE DI PAOLA
=== paolaIsDeadStorylet
TODO: fare in modo che a seconda di chi è in stanza quella persona urla, e se non c'è nessuna, nessuna urla
//QUI POTREBBE AVER SENSO NON FAR AVANZARE IL TIMER
{debug: <i>paolaIsDeadStorylet</i>}
Scatta la scena in cui Paola è morta
Greta chiede a Paola che senso abbia tutta quella cosa, Paola, non risponde.
Greta la tocca, urla, e ci dice che è morta.
Tutti arrivano in quella stanza.
{
- not are_two_entitites_together(Elia, Ettore):
    ~ move_first_entity_to_second_entity_location(Elia,Ettore)
    Elia: "Che succede?!"
}
{
- not are_two_entitites_together(Zeca, Ettore):
    ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
    Zeca: "Qualcuno si è fatto male?!!"
}
{
- not are_two_entitites_together(Matteo, Ettore):
    ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
    Matteo: "Hanno schiacciato la coda a un gatto?"
}    


Elia: "Ettore, chiama qualcuno! Che lei ci ha sequestrato i telefoni, chiama!"
  ~ activePhone = true
Poi ispezione corpo, una sola scelta  
        + Ispeziono il cibo
            -> loop_reset
        + Ispeziono la sigaretta elettronica
            -> loop_reset
        + Ispeziono il boccettino dell'asma
            -> loop_reset
        + Ispeziono la boccia di vino
            -> loop_reset
        -
    ~ tierState = SecondTier
    ~ gretaHaLaLettera = false
->->
