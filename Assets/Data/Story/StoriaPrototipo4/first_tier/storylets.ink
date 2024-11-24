=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}

{loopableVariables has dontCheckStorylets:
    ->->
}

{
//MATERIALI PER TUTORIAL
    - currentTime >= 510 && activeObjects && activeNotebook && not talking_tutorial && peopleTalking == false: -> talking_tutorial
    
    
    - currentTime >= 405 && activeObjects && not activeNotebook && peopleTalking == false:
            -> notebook_tutorial

    - currentTime >= 300 && not activeObjects:
            -> objects_tutorial


//SCENA INIZIALE
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not startingDinnerStorylet && peopleTalking == false && new_this_loop(->startingDinnerStorylet) :
            -> startingDinnerStorylet


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
    - are_two_entities_together(Elia, Greta)  && not are_two_entities_together(Elia, Matteo) && not are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Ettore) && elia_acting.sincero && is_this_entity_near_Ettore(Elia) == true && peopleTalking == false && new_this_loop(->anEavesdropAboutFriendshipStorylet):
            -> anEavesdropAboutFriendshipStorylet


    - are_three_entities_together(Matteo, Greta, Ettore) && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Matteo, Zeca) && hardTrueFeelingsStorylet && peopleTalking == false && new_this_loop(->itsOverisntItStorylet):
            -> itsOverisntItStorylet


//CONVERSAZIONI IN ALTRE STANZE, CHE NON ORIGLIAMO, E CHE CONTINUANO QUANDO ENTRIAMO
    - sheIsTheBest != -1 && are_three_entities_together(Matteo, Elia, Ettore) && currentTime <= sheIsTheBest +30:
            -> sheIsTheBestStorylet







//La morte di Paola deve arrivare solo quando abbbiamo fatto tutti i tutorial e abbiamo compiuto le scelte su Matteo e Zeca
    -  currentTime >= 600 && activeObjects && activeNotebook && talking_tutorial && peopleTalking == false:
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
        Matteo: <joy>Amore!</joy> Non ti avevo sentito proprio arrivare!
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
        Greta: Anche io ho scordato una cosa!
            ~ move_this_entity_in_a_different_room(Greta)
        Matteo: A questo punto faccio una chiamata.
            ~ move_this_entity_in_a_different_room(Matteo)
        Zeca: E io ne approfitto per scappare.
            ~ move_this_entity_in_a_different_room(Zeca)
        Elia: Allora mi sparo due flessioni di là.
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
        Matteo: Sembra che ci sia un problema con la piscina.
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
        Matteo: E io sento il mio avvocato.
        Elia: <fear>E io, io, io ho paura!</fear>
            -> advance_time ->
        
        -> intro



//STORYLET "NORMALI"

=== weddingAtThePubStorylet
{debug: <i>Passo per weddingAtThePubStorylet</i>}
~ inConversazione += Matteo
~ inConversazione += Elia
        Matteo: Te l'ho già detto più volte, Elia: è una scelta pacchiana.
        Elia: Ma il nostro pub non è pacchiano!
            + {weddingAtThePubStorylet > 1} [Ti allontani.] -> intro
            + {weddingAtThePubStorylet > 1} [Resti]
            + ->
            -
        Elia: Una volte c'è venuta anche Antonella Elia!
        Matteo: No. Ho già prenotato al Superbo Castello dei Conti de Viscontinis.
        Elia: Ma non facciamo mai nulla in famiglia, mai!
        + (matteoSiSposa) Ettore: Amore, Elia ha ragione.
            Ettore: Non è meglio restare in famiglia?
        + (matteoSiSposa2) Ettore: Elia, ehm, perdonami[...],ma Matteo mi ha raccontato che avete letteralmente una famiglia stabile di blatte nel pub.
        -
            Matteo: Elia, non festeggerò mai il mio matrimonio nel tuo bar triste con la tua insopportabile collega!
            Matteo: Questa è la cosa peggiore che potrebbe capitarmi, ed è il <b>mio</b> matrimonio, capito?!?
            Elia: <rage>Sei<waitrage> uno<waitrage> stronzo!</rage>
            Elia: Me ne vado.
                    ~ move_this_entity_in_a_different_room(Elia)
                    -> advance_time ->
            -> intro



//CONVERSAZIONI ORIGLIATE

=== anEavesdropAboutFriendshipStorylet
{debug: <i>Passo per anEavesdropAboutFriendshipStorylet</i>}
~ inConversazione += Elia
~ inConversazione += Greta
        Elia: <i><fear>Quindi ora vuoi uccidermi?</fear></i>
        Greta: <i>Ucciderti?</i>
            + {anEavesdropAboutFriendshipStorylet > 1} [Ti allontani.] -> intro
            + {anEavesdropAboutFriendshipStorylet > 1} [Resti]
            + ->
            -
        Elia: <i>Come hai fatto con Paola. Per via dei senzatetto e del pub!</i>
        Greta: <i>Elia. Credi davvero che. Oh, lascia che ti spieghi una cosa.</i>
        Greta: <i>Prima che le nostre madri si fidanzassero, sono stata povera.</i>
        Greta: <i>Papà era un influencer, ma dopo lo scandalo del torrone ha perso followers e non ha saputo più come affrontare la realtà.</i>
        Greta: <i>E così papà ed io abbiamo vissuto per mesi per strada.</i>
        {
                - are_two_entities_together(Ettore, Elia) or are_two_entities_together(Elia, Matteo) or are_two_entities_together(Elia, Zeca): -> quickTalk
                -else: -> one
        }    
            
            
        = one
                -> advance_time ->
            Greta: <i>Me ne sono sempre vergognata così tanto, sai?</i>
            Greta: <i>Mesi e mesi a vedere le persone passarci davanti.</i>
            Greta: <i>A spiare dentro la nostra roulotte.</i>
            Greta: <i>A farci commenti spietati sul colore della carrozzeria.</i>
            Greta: <i>Una volta<hesitate> ho dovuto persino rinunciare a una borsetta Hermes.</i>
            Elia: <i>Deve essere stato tremendo.</i>
            Greta: <i>Non ne hai idea. E per questo ora non voglio rivivere quel trauma.</i>
            Greta: <i>Non posso aver contatto con altri senzatetto puzzolenti, mi capisci Elia, vero?</i>
            Elia: <i>Io. No, ma sarò sempre dalla tua parte Greta, promesso!</i>
                    -> advance_time ->
                -> intro

    
    = quickTalk
        -> advance_time ->
            <i>Greta: Ma ovvio che tu sei lì a raccontare i cazzi tuoi e entra qualcun altro.</i>
            <i>Greta: Scusa Elia, ne riparliamo in un altro momento.</i>
        -> intro


=== itsOverisntItStorylet
    Greta: <rage>Co<waitrage>glio<waitrage>ne</rage>.
    Greta: <i>Cosa cazzo vai in giro a dire che staremo assieme?</i>
    Greta: <i>Matteo, sei un coglione infinito.</i>
        + {itsOverisntItStorylet > 1} [Ti allontani.] -> intro
        + {itsOverisntItStorylet > 1} [Resti.]
        + ->
        -
    Matteo: <i>Non è quello che ti piace di me?</i>
    Greta: <i>No, non mi piace nulla di te, Matteo.</i>
    Greta: <i>A parte i soldi, ma sappiamo benissimo che non sono tuoi.</i>
    Matteo: <i>Ma quella scopata, dimmi che non è stata la scopata del secolo.</i>
    Greta: <i>Al massimo, del secondo.</i>
           -> advance_time ->
    {
        - greta_acting.loVoglio: -> perEttore
        - not greta_acting.loVoglio: -> poveroEttore

    }

    = perEttore
        Greta: <i>Ascoltami. Non so come sia possibile, ma quel disgraziato di Ettore ti ama ancora.
        Greta: <i>E credo sia pronto a perdonarti.</i>
        Greta: <i>Per cui vedi di fare qualcosa e andare da lui, ora, e facci la pace.</i>
        Matteo: <i>Quindi posso ritenere il nostro debito saldato?</i>
        Greta: <i>Oh no, piccolo animaletto da compagnia. Assolutamente no.</i>
        Matteo: <i>Ma col matrimonio...</i>
        Greta: <i>Pensi davvero che avrei accettato?</i>
        Greta: <i>Ora vai a fare qualcosa di buono nella tua vita, su.</i>
        Greta: <i>Io vado a lavarmi le orecchie da questa conversazione.</i></i>
                ~ move_this_entity_in_a_different_room(Greta)
                -> advance_time ->    
            -> intro
    
    =poveroEttore
        Greta: <i>Hai spezzato il cuore di un poveretto.</i>
        Greta: <i>E non dovrei essere io la persona che te lo dice, ma sei un coglione.</i>
        Greta: <i>Sai quante possibilità ci sono che qualcuno possa mai amare un idiota come te?</i>
        Matteo: <i>Ma tu mi vuoi!</i>
        Greta: <i>Cristo, come fai ad essere così coglione?</i>
        Greta: <i>No che non ti voglio. Voglio solo che chiudiamo il nostro accordo, una volta per tutte.</i>
        Matteo: <i>Quindi ora sono libero?</i>
        Greta: <i>Libero di andare a fanculo, sì. Ma non libero dal debito.</i>
        Greta: <i>Fatti una pugnetta, rilassati, e pensa a come darmi quel che mi spetta, coglione.</i>
        Greta: <i>E stammi lontano.</i>
            ~ move_this_entity_in_a_different_room(Greta)
            -> advance_time ->    
        
        -> intro



//CONVERSAZIONI IN ALTRE STANZE, CHE NON ORIGLIAMO, E CHE CONTINUANO QUANDO ENTRIAMO
TODO: quando clicco "ti allontani" mi ripropone comunque la conversazione da capo, cosa che non accade con le altre. Si ripete "sarai tu noioso"
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
{
    - currentTime == sheIsTheBest: ->step_one
    - currentTime == sheIsTheBest +15: ->step_two
    - currentTime == sheIsTheBest + 30: ->step_three
    - else: ->->
    }
    
    = step_one    
        Elia: Mi ha sempre sorpreso il modo in cui hai trattato Paola.
        Matteo: In che senso?
            + {sheIsTheBestStorylet.step_one > 1} [Ti allontani.] -> intro
            + {sheIsTheBestStorylet.step_one > 1} [Resti.]
            + ->
            -
        Elia: Beh, sei sempre stato crudele con lei.
        Elia: Eppure è stata Paola a convincere i nonni a prestarti tutti quei soldi!
        Elia: E non capisco come è possibile.
        Elia: Lei è così attenta.
        Elia: Così perfetta.
        Matteo: Così noiosa!
    
            -> advance_time ->
        -> step_two

    = step_two
        Elia: Sarai tu noioso, coso.
        Matteo: Così prevedibile.
            + {sheIsTheBestStorylet.step_two > 1} [Ti allontani.] -> intro
            + {sheIsTheBestStorylet.step_two > 1} [Resti]
            + ->
            -
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
            + {sheIsTheBestStorylet.step_three > 1} [Ti allontani.] -> intro
            + {sheIsTheBestStorylet.step_three > 1} [Resti.]
            + ->
            -
        Elia: Anche questo è vero.
        Elia: Ma io lo so, e infatti ho chiesto una mano a Greta.
        Elia: Tu pensi ancora di sapere gestire i soldi, e stai rischiando di finire in bancarotta.
        Matteo: <cry>Non sono in bancarotta!</cry>
        Elia: Certo che no, solo perché i nonni continuano a pararti il culo.
        Elia: Me ne devo andare da tutta questa negatività.
            ~ move_this_entity_in_a_different_room(Elia)
            -> advance_time ->
        -> intro


//CONFESSIONI SOLITARIE 
=== aStrangeKnifeStorylet
~ inConversazione += Matteo
{debug: <i>Passo per aStrangeKnifeStorylet</i>}
        Matteo: Ehi, ma quello è il mio antico pugnale sacrificale!
        Matteo: Grazie per avermelo riportato!
            + {aStrangeKnifeStorylet > 1} [Ti allontani.] -> intro
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
            -> intro


=== marryMeStorylet
~ inConversazione += Matteo
{debug: <i>Passo per marryMe</i>}
        Matteo: <joy>Finalmente soli, amore.</joy>
        Matteo: Dio, quanto sei bello, te l'ho mai detto?
            + {marryMeStorylet > 1} [Ti allontani.] -> intro
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
            Ettore: Chiudi i pantaloni, futuro marito.
                     -> advance_time ->
                -> intro
     
 
     = quickTalk   
        Matteo: Comunque non è il caso di farlo, qui, ora.
        Ettore: Ma cosa? Ma.
        Matteo: <cry>Inutile che insisti</cry>, amore.
        Matteo: Come sanno le altre persone in questa stanza, non si scopa nel raggio di dieci metri da un cadavere.
        Ettore: Ma io! Ma tu!
        Matteo: Me ne vado, così ti lascio ripensare a modo alla tua idea di moralità, Ettore.
            ~ move_this_entity_in_a_different_room(Matteo)
        -> intro


=== worstBestManStorylet
~ inConversazione += Zeca
{debug: <i>Passo per worstBestMate</i>}
    Zeca: Mio nuovo giovane amico, che bello rivederti.
    {not new_this_loop(->zeca_acting.rapportoPaola): Zeca: Forse adesso è un buon momento per rispondere alla tua domanda di prima.}
    Zeca: La vita sa essere crudele, sai?
        + {worstBestManStorylet > 1} [Ti allontani.] -> intro
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

    -> intro




//STORYLET A CUI ARRIVIAMO SOLO ATTRAVERSO UNA SCELTA
=== hardTrueFeelingsStorylet
~ inConversazione += Matteo
{debug: <i>Passo per hardTrueFeelingsStorylet</i>}
Matteo: Anche io.
Ettore: Uh, dimmi pure.
    + {hardTrueFeelingsStorylet > 1} [Ti allontani.] -> intro
    + {hardTrueFeelingsStorylet > 1} [Resti.]
    + ->
    -
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
        Ettore: <rage>E<waitrage> me<waitrage> lo<waitrage> dici<waitrage>  solo<waitrage> ora?</rage>
        Ettore: Dopo avermi chiesto la mano pochi minuti fa?
        Matteo: Ettore! Mi aspettavo una reazione più comprensiva.
        Matteo: Per me è una situazione difficile, dolorosa.
        Matteo: E tu mi fai questa scenata? Sei davvero egoista!
        Matteo: Fammi allontanare da tutta questa cattiveria prima che mi contagi.
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
    Matteo: Niente ma, <cry>vattene</cry>.
    Matteo: Anzi, me ne vado io.
        ~ move_this_entity_in_a_different_room(Matteo)
            -> advance_time ->
            
        -> intro


//MATERIALI PER TUTORIAL

=== objects_tutorial
            ~ change_status(Paola, PaolaLive)
            ~ move_first_entity_to_second_entity_location(Paola,Ettore)
        Paola: <cry>Stop stop stop maledizione!</cry>
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Paola: <cry>Sant'iddio Greta, dove hai messo tutti i cazzo di oggetti? Mettili al loro posto, ora!</cry>
            ~ move_this_entity_in_a_different_room(Greta)
            ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
            ~ move_first_entity_to_second_entity_location(Elia,Ettore)
        Paola: Ettore, ricordati che se hai un oggetto in mano puoi mostrarlo e ottenere nuove informazioni.
            ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
        Elia: Cerca di trovare la limetta più avanti possibile perché è quella l'arma del delitto!
        Paola: <cry>Elia, imbecille!</cry> Ora vi tocca improvvisare, l'arma sarà un'altra.
        Paola: Mi spiace per il livello di non professionalismo, Ettore.
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
~ inConversazione += Paola
            ~ change_status(Paola, PaolaLive)
            ~ move_first_entity_to_second_entity_location(Paola,Ettore)
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
        Paola: Ma presta attenzione: molte verità si capiscono solo prestando attenzione anche a cose che sul taccuino non ci sono.
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


TODO: da vedere se serve davvero dopo i test. Perché da solo arrivo qui con le idee chiare (ovvio) e il risolvibile risolto, per cui potremmo cancellare un intero loop
=== talking_tutorial
~ inConversazione += Paola
            ~ change_status(Paola, PaolaLive)
            ~ move_first_entity_to_second_entity_location(Paola,Ettore)
        Paola: Madre santa, che fatica prepararvi per questo pezzo!
            ~ move_first_entity_to_second_entity_location(Greta,Ettore)
        Greta: Cosa ho sbagliato ora?!?
        Paola: <joy>A nascere.</joy> 
        Paola: Ettore, Ettore. Nel teatro di improvvisazione il ritmo è importante, sono io a dovertelo dire?
            ~ move_first_entity_to_second_entity_location(Elia,Ettore)
            ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
        Zeca: A dire il vero, sì.
        Paola: <cry>CHI TI HA INTERPELLATO, EUNUCO?!?</cry>
            ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
        Paola: Dicevo, Ettore. Se vedi che i personaggi non ti dicono nulla di nuovo, non ti viene il dubbio che...
        Ettore: Che si siano annoiati?
            -> advance_time ->
        Matteo: Che potrebbero dire cose diverse se sono in stanze diverse, o con persone diverse. O da sole.
        Paola: Grazie. Leccaculo.
        Paola: Ma stavo pensando anche a un'altra cosa: i personaggi parlano tra loro anche quando tu non ci sei. Hai mai pensato che, con le giuste condizioni, potresti <hesitate>origliare una conversazione?
        Paola: Cavolo, sei bellino ma non sei sveglio, eh?
        Paola: Centoventi secondi di riposo, non uno di più, non uno di meno!
        Paola: Poi ripartiamo da dopo la mia morte.
        Paola: Peccato sia solo recitazione.
        ~ peopleTalking = true
            ~ move_this_entity_in_a_different_room(Greta)
            ~ move_this_entity_in_a_different_room(Elia)
            ~ move_this_entity_in_a_different_room(Matteo)
            ~ move_this_entity_in_a_different_room(Zeca)
                    -> advance_time ->
                -> resting_time ->
            -> intro





//MORTE DI PAOLA


//MORTE DI PAOLA (COMUNE A PRIMO E SECONDO TIER)
TODO: mi è capitato, giustamente, che Ettore senta tutta la conversazione e risponda da un'altra stanza perché quando parte il dialogo non si può spostare. Come risolviamo? Mettendo la possibilità di muoversi, o forzando lo spostamento del personaggio nella stanza con Paola (non mi piace ma è pratica)?
=== paolaIsDeadStorylet
{debug: <i>paolaIsDeadStorylet</i>}
        Greta: Paola, ma questa roba non ha senso!
        Greta: Come dovrebbe capire Ettore chi è l'assassino e perché?
        Greta: Ma poi qui ci sono motivi a sufficienza per tutti!
        Greta: Quindi nel tuo piano tutti hanno ucciso Paola?
        Greta: <rage>Paola<waitrage> mi<waitrage> rispondi?!?</rage>
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
