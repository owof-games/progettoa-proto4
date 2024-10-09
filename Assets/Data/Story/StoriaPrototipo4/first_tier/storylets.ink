//INDEX
=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}
{
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not startingDinnerStorylet && new_this_loop(->startingDinnerStorylet):
    -> startingDinnerStorylet


    - are_three_entities_together(Elia, Matteo, Ettore) && not are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Greta) && marryMeStorylet && new_this_loop(->weddingAtThePubStorylet):
    -> weddingAtThePubStorylet



//La morte di Paola deve arrivare solo quando abbbiamo fatto tutti i tutorial e abbiamo compiuto le scelte su Matteo e Zeca
 -  currentTime >= 200 && objects_tutorial && notebook_tutorial && talking_tutorial && (choiceMatteoVuoleSposareEttore == True or choiceMatteoVuoleSposareEttore == False) && (choiceMenteZeca == True or choiceMenteZeca == False): -> paolaIsDeadStorylet

//CONVERSAZIONI ORIGLIATE
    - are_two_entities_together(Elia, Greta) && elia_acting.missioneGreta && not are_two_entities_together(Elia, Matteo) && not are_two_entities_together(Elia, Zeca) && is_this_entity_near_Ettore(Elia) == true && new_this_loop(->anEavesdropAboutFriendshipStorylet):
    -> anEavesdropAboutFriendshipStorylet

//CONVERSAZIONI IN ALTRE STANZE, CHE NON ORIGLIAMO, E CHE CONTINUANO QUANDO ENTRIAMO
    - currentTime >= 240 && are_three_entities_together(Matteo, Elia, Ettore) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Zeca) && new_this_loop(->sheIsTheBestStorylet):
    -> sheIsTheBestStorylet

    - currentTime >= 240 && are_three_entities_together(Matteo, Greta, Ettore) && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Matteo, Zeca) && new_this_loop(->itsOverisntItStorylet):
    -> itsOverisntItStorylet

//CONFESSIONI SOLITARIE 
    - are_two_entities_together(Matteo, Ettore) && inventoryContents has AnticoPugnale && not are_two_entities_together(Elia, Ettore) && not are_two_entities_together(Ettore, Zeca) && not are_two_entities_together(Ettore, Greta) && new_this_loop(->aStrangeKnifeStorylet):
    -> aStrangeKnifeStorylet

    - are_two_entities_together(Matteo, Ettore) && not are_two_entities_together(Elia, Ettore) && not are_two_entities_together(Ettore, Zeca) && not are_two_entities_together(Ettore, Greta) && new_this_loop(->marryMeStorylet):
    -> marryMeStorylet
    
    - are_two_entities_together(Zeca, Ettore) && not are_two_entities_together(Elia, Ettore) && not are_two_entities_together(Ettore, Matteo) && not are_two_entities_together(Ettore, Greta) && new_this_loop(->worstBestManStorylet):
    -> worstBestManStorylet    


//MATERIALI PER TUTORIAL
- currentTime > 480 && not objects_tutorial: -> objects_tutorial

- currentTime > 480 && objects_tutorial && new_this_loop(->objects_tutorial) && not notebook_tutorial: -> notebook_tutorial

- currentTime > 480 && objects_tutorial && notebook_tutorial && new_this_loop(->notebook_tutorial) && not talking_tutorial: -> talking_tutorial

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
    - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Zeca): -> quickTalk
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
{are_two_entities_together(Zeca, Elia): Zeca porterà Elia ad unirsi al discorso, e ogni tanto metteremo degli incisi, una scenetta dedicata?}
    -> advance_time ->
    + (paolaZeca) [Avanzo]
    -
->->


=== aStrangeKnifeStorylet
{debug: <i>Passo per aStrangeKnifeStorylet</i>}
Matteo ci dice cose se ci vede in giro col suo coltello, e se lo riprende.
-> advance_time ->
        ~ inventoryContents -= AnticoPugnale
        ~ objectStorageContents += AnticoPugnale
->->


//CONVERSAZIONI INDIPENDENTI
=== sheIsTheBestStorylet
TODO: questa è una modalità molto scriptata, mi piacerebbe qualcosa di più reattivo ma non saprei come fare.
{debug: <i>Passo per sheIsTheBestStorylet</i>}
{
    - currentTime == 240: ->step_one
    - currentTime == 255: ->step_two
    - currentTime == 270: ->step_three
    - else: ->->
    }
= step_one    
-> advance_time ->
    Matteo dice cose
    Elia dice cose
    Matteo risponde
    Elia dice cose
    Matteo dice una cosa importante che finirà nel taccuino o no
-> step_two

= step_two
    Matteo dice cose
    Elia dice cose

-> step_three

= step_three
    Arriviamo in fondo al dialogo, poche frasi per far capire che qualcosa è finito.
    Matteo dice cose
    Elia dice cose
->->


=== itsOverisntItStorylet
Greta qui fa un cazziatone a Matteo
se {greta_acting.loVoglio} allora cercherà di convincerlo a tornare con Ettore.
Ma questa cosa la vediamo all'inizio, le altre due scene sembreranno più provolone.
->->


//STORYLET DA SCELTE
=== hardTrueFeelingsStorylet
{debug: <i>Passo per hardTrueFeelingsStorylet</i>}
Matteo: Anche io.
Ettore: Uh, dimmi pure.
Matteo: Non voglio sposarti.
Ettore: Cos
{
    - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Zeca): -> quickTalk
    -else: ->->
}
    -> advance_time ->
    + (matteoGreta)[Avanzo]
    -
->->
Matteo: Ettore: io amo Greta.
    + (ah)Ettore: Ah. E da quando lo sai?
        Matteo: Mesi. Forse anni.
        Ettore: E me lo dici solo ora? Dopo avermi chiesto la mano pochi minuti fa?
        Matteo: Ettore! Mi aspettavo una reazione più comprensiva.
        Matteo: Per me è una situazione difficile, dolorosa.
        Matteo: E tu mi fai questa scenata? Sei davvero egoista!
        Matteo: Fammi allontanare da tutta questa cattiveria, prima che mi contagi.
            ~ move_this_entity_in_a_different_room(Matteo)
            -> advance_time ->
    + (mono)Ettore: Sai che non mi importa molto della monogamia.
        Matteo: Ma importa a me.
        Matteo: Perché se ora tu dai a me la possibilità di stare con altre persone, poi dovrò darla io a te.
        Matteo: E io non saprei gestire la mia gelosia.
        Ettore: Sono cose che si imparano.
        Matteo: Se hai un sacco di tempo libero.
        Matteo: Questa roba è per gente come te o Zeca.
        Matteo: Ma io ho una carretta da tirare avanti.
        Matteo: Dio, non credo di averti mai amato, sei così fastidioso!
        Matteo: Fammi andare via di qui!
        ~ move_this_entity_in_a_different_room(Matteo)
        -> advance_time ->



= quickTalk
Matteo: No no, è il caso di parlarne solo quando saremo soli.
Ettore: Ma!
Matteo: Niente ma, vattene.
Matteo: Anzi, me ne vado io.
    ~ move_this_entity_in_a_different_room(Matteo)
-> advance_time ->
-> intro




//STORYLET PER TUTORIAL
=== objects_tutorial
        Paola: "Stop stop stop maledizione!"
        Paola: "Sant'iddio Greta, dove hai messo tutti i cazzo di oggetti? Mettili al loro posto, ora!"
        -> advance_time ->
        ~  move_this_entity_in_a_different_room(Greta)
        Paola: "Ettore, ricordati che se hai un oggetto in mano puoi mostrarlo e ottenere nuove informazioni."
        ~ move_first_entity_to_second_entity_location(Elia,Ettore)
        Elia: "Cerca di trovare la limetta più avanti possibile perché è quella l'arma del delitto!"
        Paola: "Elia, coglione! Ora vi tocca improvvisare, l'arma sarà un'altra. Mi spiace per il livello di non professionalismo, Ettore."
        -> advance_time ->
        Paola: "Cinque minuti e poi riprendiamo!"
        ~ move_entity(LimettaUnghie, GreenRoom)
        ~ move_entity(SpiedinoCocktail, RedRoom)
        ~ move_entity(AnticoPugnale, GreenRoom)
        ~ move_entity(Lettera, YellowRoom)
        ~ move_entity(BottigliaDiVino, YellowRoom)
        ~ move_entity(SigarettaElettronica, RedRoom)
        ~ move_entity(FlaconcinoAsma, WhiteRoom)
        ~ move_entity(Torta, ObjectStorage)
        ~ move_entity(Briciole, ObjectStorage)
        
            -> advance_time ->
            -> resting_time ->
            + [Avanzo]
            -
            ->->

=== notebook_tutorial
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
        -> resting_time ->
            + [Avanzo]
            -
            ->->

=== talking_tutorial
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
        -> resting_time ->
            + [Avanzo]
            -
            ->->


//MORTE DI PAOLA
=== paolaIsDeadStorylet
//QUI POTREBBE AVER SENSO NON FAR AVANZARE IL TIMER
{debug: <i>paolaIsDeadStorylet</i>}
Scatta la scena in cui Paola è morta
Greta chiede a Paola che senso abbia tutta quella cosa, Paola, non risponde.
Greta la tocca, urla, e ci dice che è morta.
Tutti arrivano in quella stanza.
//Grida di chi è in scena
{
- are_two_entities_together(Elia, Paola):
    Elia: "Oh merda merda merda non respira!"
}
{
- are_two_entities_together(Zeca, Paola):
    ~ move_first_entity_to_second_entity_location(Zeca,Paola)
    Zeca: "Un ambulanza, qualcuno chiami un ambulanza!"
}
{
- not are_two_entities_together(Matteo, Paola):
    ~ move_first_entity_to_second_entity_location(Matteo,Paola)
    Matteo: "AAAAAAAAAAAAAAAAAAAAAAAAAA!"
}
{
- not are_two_entities_together(Greta, Paola):
    ~ move_first_entity_to_second_entity_location(Greta,Paola)
    Greta: "Ehi, smettila!"
} 


//Grida di chi non è in scena
{
- not are_two_entities_together(Elia, Paola):
    ~ move_first_entity_to_second_entity_location(Elia,Paola)
    Elia: "Che succede?!"
}
{
- not are_two_entities_together(Zeca, Paola):
    ~ move_first_entity_to_second_entity_location(Zeca,Paola)
    Zeca: "Qualcuno si è fatto male?!!"
}
{
- not are_two_entities_together(Matteo, Paola):
    ~ move_first_entity_to_second_entity_location(Matteo,Paola)
    Matteo: "Hanno schiacciato la coda a un gatto?"
}
{
- not are_two_entities_together(Greta, Paola):
    ~ move_first_entity_to_second_entity_location(Greta,Paola)
    Greta: "Di nuovo il tizio delle pizze?"
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
