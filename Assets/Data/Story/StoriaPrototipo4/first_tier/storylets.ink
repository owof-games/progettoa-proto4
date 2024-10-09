//INDEX
=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}
{
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not startingDinnerStorylet && new_this_loop(->startingDinnerStorylet):
    -> startingDinnerStorylet


    - are_three_entities_together(Elia, Matteo, Ettore) && not are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Greta) && (marryMeStorylet.matteoSiSposa or marryMeStorylet.matteoSiSposa2) && new_this_loop(->weddingAtThePubStorylet):
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
        Matteo: Te l'ho già detto più volte, Elia: è una scelta pacchiana.
        Elia: Ma il nostro pub non è pacchiano!
        Elia: Una volte c'è venuta anche Antonella Elia!
        Matteo: No. Ho già prenotato al Superbo Castello dei Conti de Viscontinis.
        Elia: Ma non facciamo mai nulla in famiglia, mai!
        + (matteoSiSposa) Ettore: Amore, Elia ha ragione. Non è meglio restare in famiglia?
        + (matteoSiSposa2) Ettore: Elia, ehm, perdonami, ma avete letteralmente una famiglia stabile di blatte nel pub.
        -
            Matteo: Elia, non festeggerò mai il mio matrimonio nel tuo bar triste con la tua insopportabile collega!
            Matteo: Questa è la cosa peggiore che potrebbe capitarmi, ed è il <b>mio</b> matrimonio, capito?!?
        -> advance_time ->
->->


=== anEavesdropAboutFriendshipStorylet
{debug: <i>Passo per anEavesdropAboutFriendshipStorylet</i>}
        Elia: Quindi, ora vuoi uccidermi?
        Greta: Ucciderti?
        Elia: Come hai fatto con Paola. Per via dei senzatetto e del pub!
        Greta: Elia. Credi davvero che. Oh, lascia che ti spieghi una cosa.
        Greta: Prima che le nostre madri si fidanzassero, sono stata povera.
        Greta: Papà è stato a lungo un influencer, ma quando le cose sono cambiate per lui, non ha saputo più come affrontare la realtà.
        Greta: E così papà ed io abbiamo vissuto per mesi per strada.
            + (gretaTriste) Ettore: Merda, non ne sapevo nulla.
            -
            -> advance_time ->
        Greta: Me ne sono sempre vergognata così tanto, sapete?
        Greta: Mesi e mesi a vedere le persone passarci davanti.
        Greta: A spiare dentro la nostra roulotte.
        Greta: A farci commenti spietati sul colore della carrozzeria.
        Greta: Una volta ho dovuto persino rinunciare a una borsetta Hermes.
        Elia: Deve essere stato tremendo.
        Greta: Non ne hai idea. E per questo ora non voglio rivivere quel trauma.
        Greta: Non posso aver contatto con altri senzatetto puzzolenti, mi capisci Elia, vero?
        Elia: Io. No, ma sarò sempre dalla tua parte Greta, promesso!
            -> advance_time ->

->->



=== marryMeStorylet
{debug: <i>Passo per marryMe</i>}
        Ettore: Finalmente soli, amore.
        Matteo: Già. Dio, quanto sei bello, te l'ho mai detto?
        Ettore: Mai abbastanza, cucciolone.
        Matteo: E sai, c'è una cosa che vorrei dirti da un bel po'.
        Matteo: Hai presente che ho fatto ristrutturare l'ala a nord del castello?
        Matteo: Pensavo di metterci qualcosa di importante.
        Ettore: Un altro dei tuoi cavalli?
        Matteo: No, qualcosa di più importante.
            {
                - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Zeca): -> quickTalk
                -else: ->->
            }
        -> advance_time ->
        Matteo: Ah, son così un disastro con queste cose, amore.
        Matteo: Posso provare a dirtelo in imprenditorese?
        Ettore: Ma certo, tesoro.
        Matteo: Stavo pensando a una fusione tra le nostre società.
        Ettore: Qui, ora? Con tua sorella morta?
        Matteo: Beh, non era esattamente quella la proposta, ma ora che mi ci fai pensare.
        Ettore: Chiudi quei pantaloni, amore. A casa poi ci si fonde per bene.
        Matteo: Non hai capito, cristo. Uffi. Sob.
                     {
                - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Zeca): -> quickTalk
                -else: ->->
            }
        -> advance_time ->
            + (matteoSiSposa) Ettore: Va tutto bene amore, davvero!
            + (matteoSiSposa2) Ettore: Siamo in due
            -
        Matteo: Sii il mio direttore commerciale.
        Matteo: Sii la mia subholding.
        Matteo: Sii la firma sul mio accordo prematrimoniale.
        Matteo: La mia exit strategy.
        Matteo: Vieni a vivere con me.
        Matteo: Ettore, sei il miglior pacchetto azionario della mia vita, sposami!
        Ettore: Oh sì, sì, sì! Accetto!
        Matteo: Oh, sono così felice Ettore!
        Matteo: Ti va di fare quella fusione, ora?
        Ettore: Chiudi i pantaloni, futuro marito.
         -> advance_time ->

 ->->
 
 = quickTalk   
    Matteo: Comunque non è il caso di farlo, qui, ora.
    Ettore: Ma cosa? Ma.
    Matteo: Inutile che insisti, amore.
    Matteo: Come sanno le altre persone in questa stanza, non si scopa nel raggio di dieci metri da un cadavere.
    Ettore: Ma io! Ma tu!
    Matteo: Me ne vado, così ti lascio ripensare a modo alla tua idea di moralità, Ettore.
    ~ move_this_entity_in_a_different_room(Matteo)
-> intro

=== worstBestManStorylet
{debug: <i>Passo per worstBestMate</i>}
    Zeca: Mio nuovo giovane amico, che bello rivederti.
    Zeca: La vita sa essere crudele, sai?
    Zeca: Continuo a pensare a come eravamo io e Paola, da piccoli.
    Zeca: Hai mai avuto qualcuno che sembrava leggerti nel pensiero?
    {are_two_entities_together(Zeca, Elia): Elia: Cavolo, voi due da piccoli eravate quasi telepatici.}
    Ettore: Mai, non mi è mai capitato.
    Zeca: Come sensazione è magnifica. Ma dolorosa, quando si interrompe.
    -> advance_time ->
    Zeca: E il nostro legame è stato reciso violentemente.
    Zeca: E non ho ancora capito perché.
    {are_two_entities_together(Zeca, Elia): Elia: Ho sempre pensato fosse colpa di Matteo. Matteo è bravo a fare cose colpevoli.}
    Zeca: Negli ultimi anni. Ah. Quanto avrei voluto averla vicina.
    Zeca: Mentre tutto è crollato, mentre tutto si è spento.
    Zeca: L'allontanamento di tutti mi è pesato, ma il suo è stato quasi un omicidio.
    Zeca: Non vedevo Paola da una vita. Era la mia migliore amica, e ora solo una sconosciuta.
    Zeca: Una sconosciuta morta.
    -> advance_time ->
        + (paolaZeca) Ettore: Zeca, non so cosa dire, davvero.
        -
    Zeca: Promettimi una cosa.
    Zeca: Che farai pace con le persone a cui tieni.
    Zeca: Che parlerai con chi non senti da mesi.
    Zeca: Non saprai mai quando potrai perderle.
    {are_two_entities_together(Zeca, Elia): Elia: O quando un pazzo psicopatico le ucciderà.}
    Zeca: Lasciami a meditare amico mio, lasciami a meditare.
    -> advance_time ->
->->


=== aStrangeKnifeStorylet
{debug: <i>Passo per aStrangeKnifeStorylet</i>}
        Matteo: Ehi, ma quello è il mio antico pugnale sacrificale!
        Matteo: Grazie per avermelo riportato!
        Ettore: In realtà.
        Matteo: Ecco, ora è di nuovo mio.
                ~ inventoryContents -= AnticoPugnale
            ~ objectStorageContents += AnticoPugnale
        Matteo: Non sai quali cose terribili potrebbero accadere.
        Matteo: Ahah scherzo, scherzo.
        Matteo: Dove trovo del sangue vergine per purificarlo dal tuo tocco impuro, ora?    
        -> advance_time ->
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
    Elia: Mi ha sempre sorpreso il modo in cui hai trattato Paola.
    Matteo: In che senso?
    Elia: Beh, sei sempre stato crudele con lei.
    TODO: inserire su taccuino con tag
    Elia: Eppure è stata Paola a convincere i nonni a prestarti tutti quei soldi!
    Elia: E non capisco come è possibile.
    Elia: Lei è così attenta.
    Elia: Così perfetta.
    Matteo: Così noiosa!
    -> advance_time ->
-> step_two

= step_two
    Elia: Non provare a ripeterlo, non provarci!
    Matteo: Così prevedibile.
    Matteo: Così "So solo io quello che è giusto".
    Matteo: Sapessi cosa diceva di te alle tue spalle.
    Elia: Non mi importa saperlo. L'avrai istigata.
    Matteo: L'ho istigata io a dire che sarai sempre il più piccolo?
    Elia: Ma è vero.
    Matteo: E il più empatico?
    -> advance_time ->

-> step_three

= step_three
    Elia: Ma mica è una cosa crudele!
    Matteo: E che non sai gestire gli affari!
    Elia: Anche questo è vero.
    Elia: Ma io lo so, e infatti ho chiesto una mano a Greta.
    Elia: Tu pensi ancora di sapere gestire i soldi, e stai rischiando di finire in bancarotta.
    Matteo: Non sono in bancarotta!
    Elia: Certo che no, solo perché i nonni continuano a pararti il culo.
    Elia: Me ne devo andare da tutta questa negatività.
    -> advance_time ->

-> intro


=== itsOverisntItStorylet
    Greta: Co-glio-ne.
    Greta: Matteo, sei un coglione infinito.
    Matteo: Non è quello che ti piace di me?
    Greta: No, non mi piace nulla di te, Matteo.
    Greta: A parte i soldi, ma sappiamo benissimo che non sono tuoi.
    Matteo: Ma quella scopata, dimmi che non è stata la scopata del secolo.
    Greta: Al massimo, del secondo.
    -> advance_time ->
    {
        - greta_acting.loVoglio: -> perEttore
        - not greta_acting.loVoglio: -> poveroEttore

    }

    = perEttore
        Greta: Ascoltami. Non so come sia possibile, ma quel disgraziato di Ettore ti ama ancora.
        Greta: E credo sia pronto a perdonarti.
        Greta: Per cui vedi di fare qualcosa e andare da lui, ora, e facci la pace.
        Matteo: Quindi posso ritenere il nostro debito saldato?
        Greta: Oh no, piccolo animaletto da compagnia. Assolutamente no.
        Matteo: Ma col matrimonio...
        Greta: Pensi davvero che avrei accettato?
        Greta: Ora vai a fare qualcosa di buono nella tua vita, su.
        Greta: Io vado a lavarmi le orecchie da questa conversazione.
            ~ move_this_entity_in_a_different_room(Greta)
        -> advance_time ->    
        -> intro
    
    =poveroEttore
        Greta: Hai spezzato il cuore di un poveretto.
        Greta: E non dovrei essere io la persona che te lo dice, ma sei un coglione.
        Greta: Sai quante possibilità ci sono che qualcuno possa mai amare un idiota come te?
        Matteo: Ma tu mi vuoi!
        Greta: Cristo, come fai ad essere così coglione?
        Greta: No che non ti voglio. Voglio solo che chiudiamo il nostro accordo, una volta per tutte.
        Matteo: Quindi ora sono libero?
        Greta: Libero di andare a fanculo, sì. Ma non libero dal debito.
        Greta: Fatti una pugnetta, rilassati, e pensa a come darmi quel che mi spetta, coglione.
        Greta: E stammi lontano.
            ~ move_this_entity_in_a_different_room(Greta)
        -> advance_time ->    
        -> intro


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
Matteo: Ettore: io amo Greta. Il matrimonio era solo una scusa per farla ingelosire.
    + (ah)Ettore: Ah. E da quando lo sai?
        Matteo: Mesi. Forse anni.
        Ettore: E me lo dici solo ora? Dopo avermi chiesto la mano pochi minuti fa?
        Matteo: Ettore! Mi aspettavo una reazione più comprensiva.
        Matteo: Per me è una situazione difficile, dolorosa.
        Matteo: E tu mi fai questa scenata? Sei davvero egoista!
        Matteo: Fammi allontanare da tutta questa cattiveria, prima che mi contagi.
            ~ move_this_entity_in_a_different_room(Matteo)
            -> advance_time ->
    ->->        
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
    ->->


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
