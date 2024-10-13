//INDEX
=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}

{
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not startingDinnerStorylet && peopleTalking == false && new_this_loop(->startingDinnerStorylet):
    -> startingDinnerStorylet


    - are_three_entities_together(Elia, Matteo, Ettore) && not are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Greta) && peopleTalking == false && (marryMeStorylet.matteoSiSposa or marryMeStorylet.matteoSiSposa2) && new_this_loop(->weddingAtThePubStorylet):
    -> weddingAtThePubStorylet



//La morte di Paola deve arrivare solo quando abbbiamo fatto tutti i tutorial e abbiamo compiuto le scelte su Matteo e Zeca
    -  currentTime >= 600 && objects_tutorial && notebook_tutorial && talking_tutorial && peopleTalking == false && (choiceMatteoVuoleSposareEttore == True or choiceMatteoVuoleSposareEttore == False) && (choiceMenteZeca == True or choiceMenteZeca == False): -> paolaIsDeadStorylet

//CONVERSAZIONI ORIGLIATE
    - are_two_entities_together(Elia, Greta) && elia_acting.missioneGreta && not are_two_entities_together(Elia, Matteo) && not are_two_entities_together(Elia, Zeca) && is_this_entity_near_Ettore(Elia) == true &&  peopleTalking == false && new_this_loop(->anEavesdropAboutFriendshipStorylet):
    -> anEavesdropAboutFriendshipStorylet

//CONVERSAZIONI IN ALTRE STANZE, CHE NON ORIGLIAMO, E CHE CONTINUANO QUANDO ENTRIAMO
    - currentTime >= 240 && are_three_entities_together(Matteo, Elia, Ettore) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Zeca) && peopleTalking == false && new_this_loop(->sheIsTheBestStorylet):
    -> sheIsTheBestStorylet

    - currentTime >= 240 && are_three_entities_together(Matteo, Greta, Ettore) && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Matteo, Zeca) && peopleTalking == false && new_this_loop(->itsOverisntItStorylet):
    -> itsOverisntItStorylet

//CONFESSIONI SOLITARIE 
    - are_two_entities_together(Matteo, Ettore) && inventoryContents has AnticoPugnale && not are_two_entities_together(Elia, Ettore) && not are_two_entities_together(Ettore, Zeca) && not are_two_entities_together(Ettore, Greta) && peopleTalking == false && new_this_loop(->aStrangeKnifeStorylet):
    -> aStrangeKnifeStorylet

    - are_two_entities_together(Matteo, Ettore) && not are_two_entities_together(Elia, Ettore) && not are_two_entities_together(Ettore, Zeca) && not are_two_entities_together(Ettore, Greta) && peopleTalking == false && new_this_loop(->marryMeStorylet):
    -> marryMeStorylet
    
    - are_two_entities_together(Zeca, Ettore) && not are_two_entities_together(Elia, Ettore) && not are_two_entities_together(Ettore, Matteo) && not are_two_entities_together(Ettore, Greta) && peopleTalking == false && new_this_loop(->worstBestManStorylet):
    -> worstBestManStorylet    


    //MATERIALI PER TUTORIAL
    - currentTime > 300 && not objects_tutorial: -> objects_tutorial

    - currentTime > 405 && objects_tutorial && new_this_loop(->objects_tutorial) && not notebook_tutorial: -> notebook_tutorial

    - currentTime > 510 && objects_tutorial && notebook_tutorial && new_this_loop(->notebook_tutorial) && not talking_tutorial: -> talking_tutorial

    -else: ->->
}


//STORYLET CONDIZIONALI
=== startingDinnerStorylet
{debug: <i>Passo per startingDinnerStorylet</i>}
        Matteo: No, ma ti giuro Paola, ti giuro! Faceva tutto lo sborone quello.
        Matteo: Poi ho chiamato nonno e: tadaaan! Silenzio.
        Matteo: Tutto il consiglio di amministrazione muto.
        Matteo: E il progetto per la piscina sul tetto del grattacielo è passato.
        Greta: Urrà! Una piccola possibilità in più che uno degli stronzi che sta rovinando questa città impari a volare!
        -> advance_time ->
        Paola: Greta! Non si dicono le parolacce.
        Elia: Quindi è permesso augurare la morte a qualcuno? Perché avrei un po' di nomi, nel caso.
        Zeca: Elia, almeno tu mantieni la tua innocenza o perderei l'unica spinta a sacrificarmi.
            + Ettore: Ehm, ehm. Scusate se vi disturbo.
            + Ettore: Salve a tutti!
            + Ettore: Non ho alcuna innocenza: chi posso spingere dal grattacielo?
            -
        Matteo: Amore! Non ti avevo sentito proprio arrivare!
        Matteo: Fratelli, sorella, Greta.
        Greta: Fottiti.
        -> advance_time ->
        Matteo: Vi presento l'uomo che amo: Ettore. Ettore, loro sono i miei familiari.
            + Ettore: Finalmente incontro il famoso Elia!
                Elia: Famoso? Sono finito su Tik Tok?
                Greta: No, nel Guinness dei Primati come primo essere umano vivo eppure senza cervello.
            + Ettore: Tu devi essere Paola! Matteo parla un sacco di te!
                Paola: Oh, sono sicura che esageri su un sacco di cose, sai?
                Matteo: Non gli parlo così tanto di te. A parte a pranzo, cena, letto e durante le preghiere.
            + Ettore: Vorrei dire di ricordami un solo dei vostri nomi, ma ho scolato un'intera boccia di gin prima di venire qui.
                Greta: Bene Matteo, finalmente ci presenti qualcuno di interessante!
                Zeca: E almeno abbiamo qualcosa in comune.
            -
        Paola: Bene! Ora che ci siamo tutti, possiamo anche brindare al motivo per cui siamo qui!
        Elia: Sapete che oggi ho finalmente aperto la porta dal lato giusto?
        Elia: Nessun livido, guardate!
        -> advance_time ->
        Greta: Questo è un buon motivo per festeggiare in effetti.
        Matteo: Nessuno ha detto che dobbiamo festeggiare.
        Paola: Anche nel dolore c'è motivo di festa, Matteo, ce lo insegna nostro signore.
        Paola: E infatti brindiamo stasera perché siamo tutte riunite con un grande e unico scopo.
        Paola: Affrontare l'alcolismo di Zeca, e farlo smettere di bere.
            + Ettore: E avete pensato di partire con un brindisi?
                Zeca: Ettore, giusto? Ecco, Ettore: non farti domande su questa famiglia, o c'è da perdere il senno.
            + Ettore: Ehm, e io che c'entro?
                Matteo: Tu sei la sorpresa speciale, vedrai!
            + Ettore: Basta che non tocchiate il mio, lol!
                Paola: Non sono cose su cui si scherza!
            -
            -> advance_time ->
            
        Paola: Capperina, ho dimenticato una cosa di là, arrivo subito.
             ~ move_this_entity_in_a_different_room(Paola)
        Greta: Anche io ho scordato una cosa!
            ~ move_this_entity_in_a_different_room(Greta)
        Matteo: A questo punto faccio una chiamata.
            ~ move_this_entity_in_a_different_room(Matteo)
        Zeca: E io ne approfitto per scappare.
            ~ move_this_entity_in_a_different_room(Zeca)
        Elia: Beh, a questo punto me ne vado anche io!    
            ~ move_this_entity_in_a_different_room(Matteo)
            + Ettore: Bella festa, davvero. Grazie.
            + Ettore: Boh, a questo punto me ne vado anche io.
            + Ettore: Ma non è che c'è dell'altro vino in giro?
            -
            -> advance_time ->
        
            ~ move_entity(Paola,WhiteRoom)
        Paola entra. Paola muore.
            ~ move_entity(Elia,WhiteRoom)
        Elia: Paola, non mi sembra il momento per dormire.
            ~ move_entity(Zeca,WhiteRoom)
        Zeca: Per non farmi bere ti sei scolata tutto il vino?
            ~ move_entity(Matteo,WhiteRoom)
        Matteo: Sembra che ci sia un problema con la piscina.
            ~ move_entity(Greta,WhiteRoom)        
        Greta: Certo che questo posto è tutto uguale.
        Greta: Raga, ma Paola sta bene?
        
            -> advance_time ->
            
        Zeca: Mmm, è tiepida.
        Elia: E Non respira.
        Greta: Sempre pensato che fosse un vampiro.
        Matteo: E non ha polso.
        Greta: Questo non cambia la mia teoria.
        Matteo: Fratelli, Greta: Paola è morta!
            + (paolaMorta) Ettore: Chiamiamo la polizia!
            -
        Matteo: Non esiste.
        Greta: In questa famiglia le cose si affrontano in famiglia.
        Zeca: E infatti ci odiamo tutti.
        Elia: Io me ne vado!
        
            -> advance_time ->
            
        Matteo: Non puoi. Paola ha pagato un buttadentro perché ci chiudesse qui fino alle 23:00.
        Greta: Ma che cazzata è?
        Zeca: Temeva scappassi di nuovo, immagino.
        Elia: E ha requisito tutti i cellulari.
        Ettore: Anche il mio, come diavolo ha fatto?!?
        Zeca: Beh, rega, io mi faccio due passi per queste stanze.
        Matteo: E io sento il mio avvocato.
        Elia: E io, io, io ho paura!
            -> advance_time ->
        
        -> intro



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
    
    -> intro


=== anEavesdropAboutFriendshipStorylet
TODO: scena privata
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

    -> intro



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
            -> advance_time ->
            
            {
                - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Zeca): -> quickTalk
                -else: -> one
            }
        
        = one
        Matteo: Ah, son così un disastro con queste cose, amore.
        Matteo: Posso provare a dirtelo in imprenditorese?
        Ettore: Ma certo, tesoro.
        Matteo: Stavo pensando a una fusione tra le nostre società.
        Ettore: Qui, ora? Con tua sorella morta?
        Matteo: Beh, non era esattamente quella la proposta, ma ora che mi ci fai pensare.
        Ettore: Chiudi quei pantaloni, amore. A casa poi ci si fonde per bene.
        Matteo: Non hai capito, cristo. Uffi. Sob.
            -> advance_time ->
            
                     {
                - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Zeca): -> quickTalk
                -else: -> two
            }
        
        = two
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

        -> intro
 
 
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

    -> intro


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
    
    -> intro


//CONVERSAZIONI INDIPENDENTI
=== sheIsTheBestStorylet
TODO: questa è una modalità molto scriptata, mi piacerebbe qualcosa di più reattivo ma non saprei come fare.
/*
Due punti di modifica:
1) impostazione variabile
creazione variabile impostata a -1
nella advance_time (o in un qualunque nodo dove passiamo a ogni tick di tempo), controllo se la variabile vale ancora -1 e se la condizione di dialogo è vera: se sì, imposto la variabile a currentTime
2) verifica variabile
entro in questa storylet solo se la variabile NON vale -1, e qui dentro confronto currentTime con variabile, variabile+15, variabile+30, ecc ecc...
PS: ricordarsi di resettare la variabile al reset_loop
*/
{debug: <i>Passo per sheIsTheBestStorylet</i>}
{
    - currentTime == 240: ->step_one
    - currentTime == 255: ->step_two
    - currentTime == 270: ->step_three
    - else: ->->
    }
    
    = step_one    
        Elia: Mi ha sempre sorpreso il modo in cui hai trattato Paola.
        Matteo: In che senso?
        Elia: Beh, sei sempre stato crudele con lei.
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
    -> advance_time ->

{
    - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Zeca): -> quickTalk
    -else: ->->
}
    + (matteoGreta)Ettore: Matteo, così mi preoccupi.
    -
    
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
    
        -> intro


    = quickTalk
    Matteo: No no, è il caso di parlarne solo quando saremo soli.
    Ettore: Ma!
    Matteo: Niente ma, vattene.
    Matteo: Anzi, me ne vado io.
        ~ move_this_entity_in_a_different_room(Matteo)
            -> advance_time ->
            
        -> intro




=== objects_tutorial
            ~ move_first_entity_to_second_entity_location(Paola,Ettore)
        Paola: Stop stop stop maledizione!
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Paola: Sant'iddio Greta, dove hai messo tutti i cazzo di oggetti? Mettili al loro posto, ora!
        // -> advance_time ->
            ~  move_this_entity_in_a_different_room(Greta)
            ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
            ~ move_first_entity_to_second_entity_location(Elia,Ettore)
        Paola: Ettore, ricordati che se hai un oggetto in mano puoi mostrarlo e ottenere nuove informazioni.
            ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
        Elia: Cerca di trovare la limetta più avanti possibile perché è quella l'arma del delitto!
        Paola: Elia, coglione! Ora vi tocca improvvisare, l'arma sarà un'altra. Mi spiace per il livello di non professionalismo, Ettore.
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Greta: Oggetti sistemati!
            ~ currentTime = currentTime + 15
            ~ move_entity(LimettaUnghie, GreenRoom)
            ~ move_entity(SpiedinoCocktail, RedRoom)
            ~ move_entity(AnticoPugnale, GreenRoom)
            ~ move_entity(Lettera, YellowRoom)
            ~ move_entity(BottigliaDiVino, YellowRoom)
            ~ move_entity(SigarettaElettronica, RedRoom)
            ~ move_entity(FlaconcinoAsma, WhiteRoom)
            ~ move_entity(Torta, YellowRoom)
            ~ move_entity(Briciole, ObjectStorage)
        Paola: Due minuti e poi si riparte dall'omicidio!
        // ~ peopleTalking = true
        
            -> resting_time ->
            -> advance_time ->
            
    -> intro

=== notebook_tutorial
            ~ move_first_entity_to_second_entity_location(Paola,Ettore)
        Paola: STOP STOP STOP DI NUOVO!
        Paola: GRETA! Ma l'hai dato il taccuino ad Ettore?!?
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Greta: Io, ehm, no, io...
        Paola: Daglielo, ora, svampita! Ettore, sono mortificata.
            ~ activeNotebook = true
            ~ move_first_entity_to_second_entity_location(Elia,Ettore)
            ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
        Paola: Il taccuino è fondamentale: tiene traccia degli elementi fondamentali per l'investigazione.
        Paola: Ma presta attenzione: molte verità si capiscono solo prestando attenzione anche a cose che sul taccuino non ci sono.
            ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
        Paola: E saranno fondamentali per risolvere le contraddizioni.
            -> advance_time ->
        Ettore: <i>Contraddizioni</i>?
        Paola: Quando avrai due informazioni contrastanti su un personaggio, ti si aprirà sul taccuino la possibilità di scegliere cosa è vero e cosa no.
        Paola: Sarai tu a decidere quando avrai abbastanza informazioni per dare una risposta, e a quel punto incriminare la persona responsabile.
        Paola: Due minuti per schiarirvi le idee, ammasso di coglioni.
        Paola: Poi ripartiamo dalla scena in cui muoio!
        ~ peopleTalking = true
        
        -> advance_time ->
        -> resting_time ->
        
    -> intro



=== talking_tutorial
            ~ move_first_entity_to_second_entity_location(Paola,Ettore)
        Paola: Madre santa, che fatica prepararvi per questo pezzo!
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Greta: Cosa ho sbagliato ora?!?
        Paola: A nascere.    
        Paola: Ettore, Ettore. Nel teatro di improvvisazione il ritmo è importante, sono io a dovertelo dire?
            ~ move_first_entity_to_second_entity_location(Elia,Ettore)
            ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
        Elia: A dire il vero, sì.
        Paola: CHI TI HA INTERPELLATO, EUNUCO?!?
            ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
        Paola: Dicevo, Ettore. Se vedi che i personaggi non ti dicono nulla di nuovo, non ti viene il dubbio che...
        Ettore: Che si siano annoiati?
            -> advance_time ->
        Zeca: Che potrebbero dire cose diverse se sono in stanze diverse, o con persone diverse. O da sole.
        Paola:"Grazie. Leccaculo.
        Paola: Ma stavo pensando anche a un'altra cosa: i personaggi parlano tra loro anche quando tu non ci sei. Hai mai pensato che, con le giuste condizioni, potresti <i>origliare</i> una conversazione?
        Paola: Cavolo, sei bellino ma non sei sveglio, eh?
        Paola: Centoventi secondi di riposo, non uno di più, non uno di meno!
        Paola: Poi ripartiamo da dopo la mia morte.
        Paola: Peccato sia solo recitazione.
        ~ peopleTalking = true
        
        -> advance_time ->
        -> resting_time ->
        
    -> intro



//MORTE DI PAOLA
=== paolaIsDeadStorylet
{debug: <i>paolaIsDeadStorylet</i>}
        Greta: Paola, ma questa roba non ha senso!
        Greta: Come dovrebbe capire Ettore chi è l'assassino e perché?
        Greta: Ma poi qui ci sono motivi a sufficienza per tutti!
        Greta: Paola, mi senti?!?
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
        
            -> advance_time ->
            
            + Ettore: Scusate, ma la scena della morte non doveva arrivare dopo la cena?
            + Ettore: Greta ha ragione, non ci sto capendo nulla.
            + Ettore: Mmm, avete provato a farle il solletico?
            -
        Elia: Ettore, non è uno scherzo, non è recitazione! Paola è morta davvero.
        Matteo: Merda, non toccatela.
        Zeca: E perché?
        Greta: Perché potrebbero rimanere le impronte.
        Elia: State parlando di mia sorella, ve ne rendete conto?!?
        Greta: Ettore, tieni, chiama la polizia!
        Greta: Sei l'unico che non la conosce, e che può riuscire a non balbettare.
        
        ~ activePhone = true
        ~ tierState = SecondTier
        ~ gretaHaLaLettera = false
        -> advance_time ->

    -> intro
