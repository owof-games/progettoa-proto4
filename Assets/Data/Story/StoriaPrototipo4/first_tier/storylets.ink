=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}

{loopableVariables has dontCheckStorylets:
    ->->
}
{
//MATERIALI PER TUTORIAL

    - currentTime >= 360 && activeObjects && not activeNotebook && peopleTalking == false:
            -> notebook_tutorial

    - currentTime >= 300 && not activeObjects:
            -> objects_tutorial


//SCENA INIZIALE
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not startingDinnerStorylet && peopleTalking == false && new_this_loop(->startingDinnerStorylet) :
            -> startingDinnerStorylet

    - pauseStorylet:
        // evita che tutti gli storylet dopo questo possano partire attaccati l'uno all'altro
        ->->


//STORYLET "NORMALI"
    - are_two_entities_together(Matteo, Ettore) && not are_two_entities_together(Elia, Ettore) && not are_two_entities_together(Ettore, Zeca) && not are_two_entities_together(Ettore, Greta) && peopleTalking == false && new_this_loop(->marryMeStorylet):
            -> marryMeStorylet


    - are_three_entities_together(Elia, Matteo, Ettore) && not are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Greta) && (marryMeStorylet.matteoSiSposa or marryMeStorylet.matteoSiSposa2) && peopleTalking == false && new_this_loop(->weddingAtThePubStorylet):
            -> weddingAtThePubStorylet
    
    
    - are_two_entities_together(Matteo, Ettore) && inventoryContents has AnticoPugnale && peopleTalking == false && new_this_loop(->aStrangeKnifeStorylet):
            -> aStrangeKnifeStorylet


    - are_two_entities_together(Zeca, Ettore) && not are_two_entities_together(Elia, Ettore) && not are_two_entities_together(Ettore, Matteo) && not are_two_entities_together(Ettore, Greta) && peopleTalking == false && new_this_loop(->worstBestManStorylet):
            -> worstBestManStorylet
    


//CONVERSAZIONI ORIGLIATE
    - (are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Elia, Ettore)) && is_this_entity_near_Ettore(Elia) && peopleTalking == false && new_this_loop(->sheIsTheBestStorylet):
            -> sheIsTheBestStorylet
            
    - elia_acting.sincero && (are_two_entities_together(Elia, Greta) && not are_two_entities_together (Elia, Ettore)) && is_this_entity_near_Ettore(Elia) == true && peopleTalking == false && new_this_loop(->anEavesdropAboutFriendshipStorylet):
            -> anEavesdropAboutFriendshipStorylet

    - hardTrueFeelingsStorylet && (are_two_entities_together(Matteo, Greta) && not are_two_entities_together(Matteo, Ettore)) && is_this_entity_near_Ettore(Matteo) &&  peopleTalking == false && new_this_loop(->itsOverisntItStorylet):
            -> itsOverisntItStorylet



//La morte di Paola deve arrivare solo quando abbbiamo fatto tutti i tutorial
    -  currentTime >= 600 && activeObjects && activeNotebook && peopleTalking == false:
            -> paolaIsDeadStorylet
    

    -else: ->->
}



/* ---------------------------------

   Storylets

 ----------------------------------*/


//SCENA INIZIALE
=== startingDinnerStorylet
{debug: <i>Passo per startingDinnerStorylet</i>}
        Matteo: No, ma ti giuro Paola, ti giuro! Faceva tutto lo sborone quello.
        Matteo: Poi ho chiamato nonno e: tadaaan! Silenzio.
        Matteo: Tutto il consiglio di amministrazione muto.
        Matteo: E il progetto per la piscina sul tetto del grattacielo è passato.
        Greta: <joy>Urrà!</joy> Forse uno degli stronzi che sta rovinando questa città imparerà a volare!
            -> advance_time ->
        Paola: Greta! Non si dicono le parolacce.
        Elia: Quindi è permesso augurare la morte a qualcuno? Perché avrei un po' di nomi, nel caso.
        Zeca: Elia, almeno tu mantieni la tua innocenza, ti prego!
            + Ettore: Ehm, ehm. Scusate se vi disturbo.
            + Ettore: Salve a tutti!
            + Ettore: Interessante: chi posso spingere dal grattacielo?
            -
        Matteo: <joy>Amore!</joy> Non ti avevo proprio sentito arrivare!
        Matteo: Fratelli, sorella, Greta.
        Greta: Fottiti.
            -> advance_time ->
        Matteo: Vi presento l'uomo che amo: Ettore. Ettore, loro sono i miei familiari.
            + Ettore: Finalmente incontro il famoso Elia!
                Elia: Famoso? Sono finito su Tik Tok?
                Greta: No, nel Guinness dei Primati come primo essere umano vivo eppure senza cervello.
            + Ettore: Paola! Matteo ti ammira molto.
                Paola: Oh, sono sicura che esageri su un sacco di cose, sai?
                Matteo: Gli parlo di rado di te. A parte a pranzo, cena, letto e durante le preghiere.
            + Ettore: Zero memoria dei vostri nomi: ho scolato una boccia di gin prima di venire qui.
                Greta: Bene Matteo, finalmente ci presenti qualcuno di interessante!
                Zeca: E almeno abbiamo qualcosa in comune.
            -
        Paola: Bene! Ora che ci siamo tutti, possiamo anche brindare al motivo per cui siamo qui!
        Elia: Sapete che oggi ho finalmente aperto la porta dal lato giusto?
        Elia: Nessun livido, <joy>guardate!</joy>
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
        Greta: Merda, la torta!
            ~ move_this_entity_in_a_different_room(Greta)
        Matteo: Secondo me la stanza rossa può diventare una bellissima piscina.
            ~ move_this_entity_in_a_different_room(Matteo)
        Zeca: Credo di aver visto una bottiglia di vino nella stanza gialla.
            ~ move_this_entity_in_a_different_room(Zeca)
        Elia: Vado a fare due flessioni e torno.
            ~ move_this_entity_in_a_different_room(Elia)
            + Ettore: Bella festa, davvero. Grazie.
            + Ettore: Boh, a questo punto me ne vado anche io.
            + Ettore: C'è dell'altro vino in giro?
            -
            -> advance_time ->
        
            ~ move_entity(Paola,WhiteRoom)
            Paola: <cry>Adgg!</cry>
            ~ change_status(Paola, PaolaUnalived)
            ~ move_entity(Elia,WhiteRoom)
        Elia: Paola, non mi sembra il momento per dormire.
            ~ move_entity(Zeca,WhiteRoom)
        Zeca: Per non farmi bere ti sei scolata tutto il vino?
            ~ move_entity(Matteo,WhiteRoom)
        Matteo: No, la finestra dà sulla Accademia. Nessuno vuole nuotare davanti a quei falliti.
            ~ move_entity(Greta,WhiteRoom)        
        Greta: Certo che questo posto è tutto uguale.
        Greta: Raga, ma Paola sta bene?
        
            -> advance_time ->
            
        Zeca: Mmm, è tiepida.
        Elia: <hesitate>E non respira.
        Greta: Sempre pensato che fosse un vampiro.
        Matteo: Ha delle ferite sul petto!
        Matteo: E non ha polso.
        Greta: Questo non cambia la mia teoria.
        Matteo: Fratelli, Greta: Paola è morta!
            + (paolaMorta) Ettore: [Chiamiamo la polizia!]<fear>Chiamiamo la polizia!</fear> 
            -
        Matteo: Non esiste.
        Greta: Qui le cose si affrontano in famiglia.
        Zeca: E infatti ci odiamo tutti.
        Elia: <fear>Io me ne vado!</fear> 
        
            -> advance_time ->
            
        Matteo: Non puoi. Paola ha pagato un buttadentro perché ci chiudesse qui fino alle 23:00.
        Greta: Ma che cazzata è?
        Zeca: Temeva scappassi di nuovo, immagino.
        Elia: E ha requisito tutti i cellulari.
        Ettore: Anche il mio, come diavolo ha fatto?!?
        Zeca: Beh, rega, io mi faccio due passi per queste stanze.
        Matteo: Però potrei chiedere a nonno di far abbattere l'Accademia. Fammi prendere due misure.
        Elia: <fear>E io, io, io ho paura!</fear>
            -> advance_time ->
            ~ pauseStorylet = true
        -> intro



//STORYLET "NORMALI"

=== weddingAtThePubStorylet
{debug: <i>Passo per weddingAtThePubStorylet</i>}
~ inConversazione += Matteo
~ inConversazione += Elia
        Matteo: Te l'ho già detto più volte, Elia: è una scelta pacchiana.
        Elia: Ma il nostro pub non è pacchiano!
            + {weddingAtThePubStorylet > 1} [Ti allontani.]
                ~ pauseStorylet = true
                -> intro
            + {weddingAtThePubStorylet > 1} [Resti]
            + ->
            -
        Elia: Una volte c'è venuta anche Antonella Elia!
        Matteo: No. Ho già prenotato al Superbo Castello dei Conti de Viscontinis.
        Elia: Ma non facciamo mai nulla in famiglia, mai!
        Elia: Festeggiate il vostro matrimonio da me!
        Elia: Ettore, diglielo che sarebbe bellissimo festeggiare al pub!
        Elia: Ci sono anche i <joy>comici</joy>
        Matteo: Dio santissimo, i comici!
        
            + Ettore: Amore, Elia ha ragione.
                Ettore: Non è meglio restare in famiglia?
            + Ettore: Elia, ehm, perdonami[...],ma Matteo mi ha raccontato che avete letteralmente una famiglia stabile di blatte nel pub.
        - (matteoSiSposa)
            Matteo: Elia, non festeggerò mai il mio matrimonio nel tuo bar triste con la tua insopportabile collega!
            Matteo: Questa è la cosa peggiore che potrebbe capitarmi, ed è il <b>mio</b> matrimonio, capito?!?
            Elia: <rage>Sei<waitrage> uno<waitrage> stronzo!</rage>
            Elia: Me ne vado.
                    ~ move_this_entity_in_a_different_room(Elia)
                    -> advance_time ->
                    ~ pauseStorylet = true
            -> intro



//CONVERSAZIONI ORIGLIATE

=== anEavesdropAboutFriendshipStorylet
{debug: <i>Passo per anEavesdropAboutFriendshipStorylet</i>}
~ inConversazione += Elia
~ inConversazione += Greta
        Elia: <i><fear>Quindi ora vuoi uccidermi?</fear></i>
        Greta: <i>Ucciderti?</i>
            + {anEavesdropAboutFriendshipStorylet > 1} [Ti allontani.]
                ~ pauseStorylet = true
                -> intro
            + {anEavesdropAboutFriendshipStorylet > 1} [Resti]
            + ->
            -
        Elia: Come hai fatto con Paola. Per via dei senzatetto e del pub!
        Greta: Elia. Credi davvero che. Oh, lascia che ti spieghi una cosa.
        Greta: Prima che le nostre madri si fidanzassero, sono stata povera.
        Greta: Papà era un influencer, ma dopo lo scandalo del torrone ha perso followers e non ha saputo più come affrontare la realtà.
        Greta: E così papà ed io abbiamo vissuto per mesi per strada.
            -> advance_time ->
            
        Greta: Me ne sono sempre vergognata così tanto, sai?
        Greta: Mesi e mesi a vedere le persone passarci davanti.
        Greta: A spiare dentro la nostra roulotte.
        Greta: A farci commenti spietati sul colore della carrozzeria.
        Greta: Una volta<hesitate> ho dovuto persino rinunciare a una borsetta Hermes.
        Elia: Deve essere stato tremendo.
        Greta: Non ne hai idea. E per questo ora non voglio rivivere quel trauma.
        Greta: Non posso aver contatto con altri senzatetto puzzolenti, mi capisci Elia, vero?
        Elia: Io. No, ma sarò sempre dalla tua parte Greta, promesso!
        
                -> advance_time ->
                ~ pauseStorylet = true
            -> intro

    
    


=== itsOverisntItStorylet
    Greta: <rage>Co<waitrage>glio<waitrage>ne</rage>.
    Greta: Cosa cazzo vai in giro a dire che staremo assieme?
    Greta: Matteo, sei un coglione infinito.
        + {itsOverisntItStorylet > 1} [Ti allontani.]
            ~ pauseStorylet = true
            -> intro
        + {itsOverisntItStorylet > 1} [Resti.]
        + ->
        -
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
                ~ pauseStorylet = true
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
            ~ pauseStorylet = true
        -> intro



//CONVERSAZIONI IN ALTRE STANZE, CHE NON ORIGLIAMO, E CHE CONTINUANO QUANDO ENTRIAMO
=== sheIsTheBestStorylet
~ inConversazione += Matteo
~ inConversazione += Elia
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

        Elia: Non trattare Paola come un autobus.
        Matteo: In che senso?
            + {sheIsTheBestStorylet > 1} [Ti allontani.]
                ~ pauseStorylet = true
                -> intro
            + {sheIsTheBestStorylet > 1} [Resti.]
            + ->
            -
        Elia: Beh, sei sempre stato crudele con lei.
        Matteo: E le persone sono crudeli con gli autobus?
        Elia: Sì: fanno tutto il lavoro ma poi dicono che sono brutti.
        Elia: Ed è stata Paola a convincere i nonni a prestarti tutti quei soldi!
        Elia: Devi volerle bene!
        Elia: Lei è così perfetta.
        Matteo: Così noiosa!
    
            -> advance_time ->


        Elia: Sarai tu noioso, coso.
        Matteo: Così prevedibile.
        Matteo: Così "So solo io quello che è giusto".
        Matteo: Sapessi cosa diceva di te alle tue spalle.
        Elia: Cosa hanno le mie spalle?!?
        Matteo: Dice che sarai sempre il più piccolo!
        Elia: Di spalle?
        Matteo: E il più empatico!
            -> advance_time ->

        Elia: Quella non ce l'ha Zeca per l'alcool?
        Matteo: E che non sai gestire gli affari!
        Elia: Questo lo dice anche Greta, ma mi sa che è vero.
        Elia: Tu invece pensi di capire i soldi, e stai finendo in rosso e in verde e in bianca rotta.
        Matteo: <cry>Non sono in bancarotta!</cry>
        Elia: Perché i nonni ti danno i soldi.
        Elia: Grazie a Paola.
        Elia: Mi sento troppo teso: devo fare due flessioni.
            ~ move_this_entity_in_a_different_room(Elia)
            -> advance_time ->
            ~ pauseStorylet = true
        -> intro


//CONFESSIONI SOLITARIE 
=== aStrangeKnifeStorylet
~ inConversazione += Matteo
{debug: <i>Passo per aStrangeKnifeStorylet</i>}
        Matteo: Ehi, ma quello è il mio antico pugnale sacrificale!
        Matteo: Grazie per avermelo riportato!
            + {aStrangeKnifeStorylet > 1} [Ti allontani.]
                ~ pauseStorylet = true
                -> intro
            + {aStrangeKnifeStorylet > 1} [Resti.]
            + ->
            -
        Ettore: In realtà.
        Matteo: Ecco, ora è di nuovo mio.
            ~ inventoryContents -= AnticoPugnale
            ~ objectStorageContents += AnticoPugnale
        Matteo: Non sai quali cose terribili potrebbero accadere.
        Matteo: Ahah scherzo, scherzo.
        Matteo: Dove trovo del sangue vergine per purificarlo dal tuo tocco impuro, ora?    
                -> advance_time ->
                ~ pauseStorylet = true
            -> intro


=== marryMeStorylet
~ inConversazione += Matteo
{debug: <i>Passo per marryMe</i>}
        Matteo: <joy>Finalmente soli, amore.</joy>
        Matteo: Dio, quanto sei bello, te l'ho mai detto?
            + {marryMeStorylet > 1} [Ti allontani.]
            ~ pauseStorylet = true
            -> intro
            + {marryMeStorylet > 1} [Resti.]
            + ->
            -
        Ettore: Mai abbastanza, cucciolone.
        Matteo: E sai, c'è una cosa che vorrei dirti da un bel po'.
        Matteo: Hai presente che ho fatto ristrutturare l'ala nord del castello?
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
            Matteo: Stavo pensando a una <joy>fusione</joy> tra le nostre società.
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
            Matteo: Sii il <joy>mio</joy> direttore commerciale.
            Matteo: Sii la <joy>mia</joy> subholding.
            Matteo: Sii la firma sul <joy>mio</joy> accordo prematrimoniale.
            Matteo: La <joy>mia</joy> exit strategy.
            Matteo: Vieni a vivere con me.
            Matteo: Ettore, sei il miglior pacchetto azionario della mia vita, <joy>sposami!</joy>
            Ettore: Oh sì, sì, sì! Accetto!
            Matteo: Oh, sono così felice Ettore!
            Matteo: Ti va di fare quella fusione, ora?
                     -> advance_time ->
                     ~ pauseStorylet = true
                -> intro
     
 
     = quickTalk   
        Matteo: Comunque non è il caso di farlo, qui, ora.
        Ettore: Ma cosa? Ma.
        Matteo: <cry>Inutile che insisti</cry>, amore.
        Matteo: Come sanno le altre persone in questa stanza, non si scopa nel raggio di dieci metri da un cadavere.
        Ettore: Ma io! Ma tu!
        Matteo: Me ne vado, così ti lascio ripensare a modo alla tua idea di moralità, Ettore.
            ~ move_this_entity_in_a_different_room(Matteo)
            ~ pauseStorylet = true
        -> intro


=== worstBestManStorylet
~ inConversazione += Zeca
{debug: <i>Passo per worstBestMate</i>}
    Zeca: Mio nuovo giovane amico, che bello rivederti.
    {not new_this_loop(->zeca_acting.rapportoPaola): Zeca: Forse adesso è un buon momento per rispondere alla tua domanda di prima.}
    Zeca: La vita sa essere crudele, sai?
        + {worstBestManStorylet > 1} [Ti allontani.]
        ~ pauseStorylet = true
        -> intro
        + {worstBestManStorylet > 1} [Resti.]
        + ->
        -
    Zeca: Continuo a pensare a come eravamo io e Paola, da piccoli.
    Zeca: Hai mai avuto qualcuno che sembrava leggerti nel pensiero?
    {are_two_entities_together(Zeca, Elia): Elia: Cavolo, voi due da piccoli eravate quasi telepatici.}
    Ettore: Mai, non mi è mai capitato.
    Zeca: Come sensazione è magnifica. Ma dolorosa, quando si interrompe.
    
        -> advance_time ->
        
    Zeca: E il nostro legame è stato reciso violentemente.
    Zeca: <hesitate>E non ho ancora capito perché.
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
        ~ pauseStorylet = true
    -> intro




//STORYLET A CUI ARRIVIAMO SOLO ATTRAVERSO UNA SCELTA
=== hardTrueFeelingsStorylet
~ inConversazione += Matteo
{debug: <i>Passo per hardTrueFeelingsStorylet</i>}
Matteo: Anche io.
Ettore: Uh, dimmi pure.
    + {hardTrueFeelingsStorylet > 1} [Ti allontani.]
    ~ pauseStorylet = true
    -> intro
    + {hardTrueFeelingsStorylet > 1} [Resti.]
    + ->
    -
Matteo: Non voglio sposarti.
Ettore: Cos
    -> advance_time ->

{
    - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Zeca): -> quickTalk
}
    + (matteoGreta)Ettore: Matteo, così mi preoccupi.
    -
    
Matteo: Ettore: io amo Greta. Il matrimonio era solo una scusa per farla ingelosire.
    + (ah) Ettore: Ah. E da quando lo sai?
        Matteo: Mesi. Forse anni.
        Ettore: <rage>E<waitrage> me<waitrage> lo<waitrage> dici<waitrage>  solo<waitrage> ora?</rage>
        Ettore: Dopo avermi chiesto la mano pochi minuti fa?
        Matteo: Ettore! Mi aspettavo una reazione più comprensiva.
        Matteo: Per me è una situazione difficile, dolorosa.
        Matteo: E tu mi fai questa scenata? Sei davvero egoista!
        Matteo: Fammi allontanare da tutta questa cattiveria prima che mi contagi.
            ~ move_this_entity_in_a_different_room(Matteo)
            -> advance_time ->
            ~ pauseStorylet = true
        ->intro  
        
    + (mono) Ettore: Sai che non mi importa molto della monogamia.
        Matteo: Ma importa a me.
        Matteo: Perché se ora tu dai a me la possibilità di stare con altre persone, poi dovrò darla io a te.
        Matteo: E io non saprei gestire la mia gelosia.
        Ettore: Sono cose che si imparano.
        Matteo: Se hai un sacco di tempo libero.
        Matteo: Questa roba è per gente come te o Zeca.
        Matteo: Ma io ho una carretta da tirare avanti.
        Matteo: Dio, non credo di averti mai amato, sei così fastidioso!
        Matteo: Fammi andare via di qui!
            -> advance_time ->
            ~ move_this_entity_in_a_different_room(Matteo)
        ~ pauseStorylet = true
        -> intro


    = quickTalk
    Matteo: No no, è il caso di parlarne solo quando saremo soli.
    Ettore: Ma!
    Matteo: Niente ma, <cry>vattene</cry>.
    Matteo: Anzi, me ne vado io.
        ~ move_this_entity_in_a_different_room(Matteo)
            -> advance_time ->
            ~ pauseStorylet = true
        -> intro


//MATERIALI PER TUTORIAL

=== objects_tutorial
            ~ change_status(Paola, PaolaLive)
            ~ move_first_entity_to_second_entity_location(Paola,Ettore)
            ~ inConversazione += Paola
        Paola: <cry>Stop stop stop maledizione!</cry>
        Paola: Non siete attori, siete <cry>CAPRE!</cry>
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Paola: <cry>Sant'iddio Greta, dove hai messo tutti i cazzo di oggetti? Mettili al loro posto, ora!</cry>
            ~ move_this_entity_in_a_different_room(Greta)
            ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
            ~ move_first_entity_to_second_entity_location(Elia,Ettore)
        Paola: Ettore, ricordati che se hai un oggetto in mano puoi mostrarlo e ottenere nuove informazioni.
            ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
        Elia: Cerca di trovare la limetta più avanti possibile perché è quella l'arma del delitto!
        Paola: <cry>Elia, imbecille!</cry> Ora vi tocca improvvisare, l'arma sarà un'altra.
        Paola: Mi spiace per la mancanza di professionalità, Ettore.
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
            -> advance_time ->
        Paola: Vediamo, ci sono altre cose che devo dirti, Ettore?    
        Paola: Sì: ricorda che la sera dello spettacolo il tuo personaggio rivivrà queste scene più volte.
        Paola: A differenza di questi cretini, intrappolati in un loop.
        Paola: Ma d'altronde ci sono abituati, coi microcervelli che si ritrovano.
        Paola: Quindi già da adesso tieni conto delle indicazioni che ti hanno dato questo ammasso di imbecilli coi loro personaggi.
        Paola: E spero tu abbia notato che ogni personaggio ha degli spostamenti schedulati: vanno in una certa stanza in un certo momento...
        Paola: ...salvo che con le giuste condizioni tu non li abbia convinti a fare diversamente.
        Paola: Ma a volte anche lasciarli da soli è utile: stando in una stanza vicina potresti sentire cose che non direbbero mai davanti a un'altra persona.
        {sheIsTheBestStorylet: Paola: Un po' come quando ti è successo di origliare la conversazione tra Matteo ed Elia.| Paola: Prova ad esempio ad ascoltare da una stanza vicina cosa hanno da dirsi Matteo ed Elia quando sono assieme.}
        Paola: Dio, dimmi che ti ricorderai tutto o urlo.
        Ettore: Quindi: a ogni prova gli altri seguiranno lo stesso copione, mentre io possono tenere conto delle informazioni che mi hanno dato nelle prove precedenti.
        Paola: Giusto.
        Ettore: E hanno degli spostamenti organizzati, per cui sono nello stesso posto alla stessa ora.
        Paola: Tranne...
        Ettore: Tranne se ho detto o fatto qualcosa che ha rotto quella routine.
        Ettore: E a quel punto possono accadere cose inaspettate.
        Paola: E infine...
        Ettore: Posso origliare alcune conversazioni se dei personaggi pensano di non essere sentiti.
        Paola: Credo di essere venuta.
        Paola: Vado a darmi una sciacquata.
        Paola: Due minuti e poi si riparte dall'omicidio!
            ~ peopleTalking = true
            ~ activeObjects = true
            ~ move_this_entity_in_a_different_room(Greta)
            ~ move_this_entity_in_a_different_room(Elia)
            ~ move_this_entity_in_a_different_room(Matteo)
            ~ move_this_entity_in_a_different_room(Zeca)
            -> resting_time ->
            -> advance_time ->
            
    -> intro



=== notebook_tutorial
    ~ change_status(Paola, PaolaLive)
    ~ move_first_entity_to_second_entity_location(Paola,Ettore)
    ~ inConversazione += Paola
            
        Paola: <cry>STOP STOP STOP DI NUOVO!</cry>
        Paola: <cry>GRETA! Ma l'hai dato il taccuino ad Ettore?!?</cry>
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Greta: Io, ehm, no, io...
        Paola: <cry>Daglielo, ora, svampita!</cry>
        Paola: Ettore, sono mortificata.
            ~ activeNotebook = true
            ~ move_first_entity_to_second_entity_location(Elia,Ettore)
            ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
        Paola: Il taccuino è fondamentale: tiene traccia degli elementi centrali per l'investigazione.
        Paola: Ma ricorda: molte verità si capiscono solo prestando attenzione anche a cose che sul taccuino non ci sono.
            ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
        Paola: E saranno indispensabili per risolvere le contraddizioni.
            -> advance_time ->
        Ettore: Contraddizioni?
        Paola: Ci sono un sacco di cose che non tornano in quel che dicono gli altri personaggi.
        Paola: Starà a te decidere quando avrai abbastanza informazioni per dare una risposta, e a quel punto incriminare la persona responsabile.
        Paola: Due minuti per schiarirvi le idee, ammasso di coglioni.
        Paola: Poi ripartiamo dalla scena in cui muoio!
            ~ peopleTalking = true
            ~ activeNotebook = true
            ~ move_this_entity_in_a_different_room(Greta)
            ~ move_this_entity_in_a_different_room(Elia)
            ~ move_this_entity_in_a_different_room(Matteo)
            ~ move_this_entity_in_a_different_room(Zeca)        
                    -> advance_time ->
                    -> resting_time ->
                    
                -> intro




//MORTE DI PAOLA


//MORTE DI PAOLA (COMUNE A PRIMO E SECONDO TIER)
=== paolaIsDeadStorylet
{debug: <i>paolaIsDeadStorylet</i>}
        Greta: Paola, ma questa roba non ha senso!
        Greta: Come dovrebbe capire Ettore chi è l'assassino e perché?
        Greta: Ma poi qui ci sono motivi a sufficienza per tutti!
        Greta: Quindi nel tuo piano tutti hanno ucciso Paola?
        Greta: <rage>Paola<waitrage> mi<waitrage> rispondi?!?</rage>
            //~ move_first_entity_to_second_entity_location(Ettore,Paola)
            ~ temp ettore_location = entity_location(Ettore)
            { ettore_location == YellowRoom:
                ~ move_entity(Ettore, GreenRoom)
                ~ ettore_location = GreenRoom
            }
            { ettore_location == GreenRoom:
                ~ move_entity(Ettore, RedRoom)
                ~ ettore_location = RedRoom
            }
            { ettore_location == RedRoom:
                ~ move_entity(Ettore, WhiteRoom)
                ~ ettore_location = WhiteRoom
            }
//Grida di chi è in scena
        {
        - are_two_entities_together(Elia, Paola):
            Elia: <fear>Oh merda merda merda non respira!</fear>
        }
        {
        - are_two_entities_together(Zeca, Paola):
            ~ move_first_entity_to_second_entity_location(Zeca,Paola)
            Zeca: Un ambulanza, qualcuno chiami un ambulanza!
        }
        {
        - not are_two_entities_together(Matteo, Paola):
            ~ move_first_entity_to_second_entity_location(Matteo,Paola)
            Matteo: <cry>AAAAAAAAAAAAAAAAAAAAAAAAAA!</cry>
        }
        {
        - not are_two_entities_together(Greta, Paola):
            ~ move_first_entity_to_second_entity_location(Greta,Paola)
            Greta: Ehi, smettila!
        } 


//Grida di chi non è in scena
        {
        - not are_two_entities_together(Elia, Paola):
            ~ move_first_entity_to_second_entity_location(Elia,Paola)
            Elia: Che succede?!
        }
        {
        - not are_two_entities_together(Zeca, Paola):
            ~ move_first_entity_to_second_entity_location(Zeca,Paola)
            Zeca: Qualcuno si è fatto male?!!
        }
        {
        - not are_two_entities_together(Matteo, Paola):
            ~ move_first_entity_to_second_entity_location(Matteo,Paola)
            Matteo: Hanno schiacciato la coda a un gatto?
        }
        {
        - not are_two_entities_together(Greta, Paola):
            ~ move_first_entity_to_second_entity_location(Greta,Paola)
            Greta: Di nuovo il tizio delle pizze?
        } 
        
                    -> advance_time ->
            
            + Ettore: Ma non doveva morire dopo cena?
            + Ettore: Greta ha ragione, non ci sto capendo nulla.
            + Ettore: Mmm, avete provato a farle il solletico?
            -
        Greta: Ettore, non è uno scherzo, non è recitazione! Paola è morta davvero.
        Matteo: Merda, non toccatela.
        Zeca: E perché?
        Greta: Perché potrebbero rimanere le impronte.
        Elia: <joy>C'è un gatto?</joy>
        Greta: Ettore, tieni, chiama la polizia!
        Greta: Sei l'unico che non la conosce, e che può riuscire a non balbettare.
        
            ~ activePhone = true
            ~ tierState = SecondTier
            ~ gretaHaLaLettera = false
            ~ loopableVariables += dontCheckStorylets
            ~ loopableVariables += PaolaDavveroMorta
                -> advance_time ->

    -> cb_second_tier
