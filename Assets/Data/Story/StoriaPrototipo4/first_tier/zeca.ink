=== cb_first_tier_zeca ===
{debug: <i>passo per first_tier_zeca</i>}

+ {are_two_entities_together(Zeca, Ettore) && peopleTalking==false} [character:Zeca] {debug: <i>Ho scelto di parlare con Zeca</i>}
    -> zeca_acting ->
    
+ {are_two_entities_together(Zeca, Ettore) && peopleTalking} [character:Zeca]
    -> zeca_talking ->    
-

-> intro




/* ---------------------------------
Opzioni di dialogo con il personaggio Zeca
 ----------------------------------*/


=== zeca_acting
    {debug: <i>Passo per zeca_acting</i>}
    ~ move_locked_entities(false)
    -> first_tier_storylets ->
    //INFO GENERALI//

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Tu e Paola eravate molto legati?
        Zeca: Non mi va di parlarne ora, Ettore.
        Zeca: Forse più tardi, forse.
        Zeca: Ma grazie per l'interessamento, davvero.
        Zeca: Mentre qui cercano già di scannarsi a vicenda, almeno tu hai del buon cuore.
        Zeca: Sono sicuro che le saresti piaciuto così tanto.
        Zeca: Povera Paola.
        Zeca: Povera, povera Paola.
                -> advance_time ->
                ~ pauseStorylet = true
            -> zeca_acting

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Non voglio essere indelicato, ma hai idea di chi possa averla uccisa?
                ~ inConversazione += Zeca
        Zeca: Greta credo la invidiasse.
        Zeca: Ma le era anche riconoscente, perché è stata Paola ad accoglierla quando è entrata nella famiglia.
        Zeca: Matteo la ammirava tantissimo.
        Zeca: E a volte si può uccidere anche la propria divinità.
        Zeca: <joy>Elia ha il cuore di un bambino.</joy>
        Zeca: <fear>Ma anche un bambino può essere crudele.</fear>
            -> advance_time ->
        Zeca: E a me ha tolto tanto, se non tutto.
        Zeca: Ma l'ha fatto per il mio bene.
        Zeca: Immagino che tu ci faccia poco con tutto questo.
        Zeca: Ma togliere una vita è cosa così facile e insieme così grave.
        Zeca: Chiunque potrebbe averlo fatto.
        Zeca: Soprattutto se è una persona che fa molte domande.
            ~ pauseStorylet = true
            -> advance_time ->



    //SCELTE CONDIZIONALI//
    + (sposo) {marryMeStorylet && new_this_loop(->sposo) && not hardTrueFeelingsStorylet.ah or not hardTrueFeelingsStorylet.mono} Ettore: [Matteo ed io ci sposeremo!]<joy>Matteo ed io ci sposeremo!</joy>
                ~ inConversazione += Zeca
            Zeca: E immagino sia una cosa buona?
            Ettore: Non è il modo più nobile di stare assieme?
            Zeca: Nobile, è un parolone: Non è forse più nobile decidere giorno per giorno se stare assieme, senza vincoli esterni?
            Zeca: Svegliarsi e decidere di affrontare la giornata uno fianco all'altro, e non per la paura.
            Zeca: Paura di un giuidizio esterno, di un costo economico, di un vincolo legale, di un dio iracondo.
            Ettore: Sei mai stato innamorato, Zeca?
            Zeca: Buffo: Matteo mi ha chiesto la stessa cosa quando mi ha detto del matrimonio.
                -> advance_time ->
            Ettore: Te l'ha detto stasera?
            Zeca: No. Matteo mi ha detto che ti avrebbe sposato mesi fa, quando ha prenotato il luogo, l'orchestra e mandato gli inviti.
            Ettore: Ma a me ha fatto la proposta solo pochi minuti fa!
            Zeca: Matteo è una persona lungimirante, che si organizza in anticipo.
            Zeca: Non sono persona da gossip, ma <hesitate>una cosa però te la devo dire.
            - -(matrimonio) Zeca: Matteo e Paola hanno litigato per il matrimonio, perché Paola pensa che lui ti stia usando solo per candidarsi come sindaco.
            Zeca: Sposare un povero lo renderebbe molto popolare.
                -> advance_time ->
            Ettore: Ma non sono povero! Vivo in un bilocale e riesco persino a pagarmelo!
            Zeca: Nella nostra famiglia, in quella parte della nostra famiglia per lo meno, è stato perso da tempo il contatto con la realtà.
            Ettore: Credi quindi che non mi ami davvero? Matteo, intendo.
            Zeca: Non sta a me dirlo.
            Zeca: Spero sia cambiato con gli anni, ma il Matteo che conoscevo amava solo una cosa: Matteo.
            Zeca: E tu mi sembri un bravo ragazzo. Vedi di badare a te stesso.
                -> advance_time ->
                    ~ pauseStorylet = true
                    -> zeca_acting

    + (mollato) {hardTrueFeelingsStorylet && new_this_loop(->mollato) && not are_two_entities_together(Zeca, Matteo) && not are_two_entities_together(Zeca, Greta)} Ettore: Matteo mi ha mollato.
                ~ inConversazione += Zeca
            {zeca_acting.matrimonio: Zeca: Sai già che per me questa è una buona cosa per te.}
            Zeca: E come mai ti avrebbe lasciato?
            Ettore: Dice che ama Greta.
            Zeca: Ah, questa è buffa, davvero buffa come cosa.
            Zeca: Non voglio dire che le persone non cambino.
            Zeca: Ma in quarant'anni non ricordo una volta in cui Matteo abbia degnato di uno sguardo una donna.
            Zeca: A parte nonna, che ha sempre adorato.
                -> advance_time ->
            Ettore: Forse si è scoperto bisessuale?
            Ettore: C'è così tanto pregiudizio nella comunità gay che a volte è difficile anche solo pensarlo.
            Zeca: O forse la nostra sorellastra ha in mente qualcosa.
            Zeca: Sinceramente, non ho mai creduto che a Greta interessi tanto il pub, quanto controllare Elia.
            Zeca: E non ho mai creduto molto nell'amicizia tra lei e Paola.
            - -(matteoGreta) Zeca: Non mi stupirebbe se Greta stesse ricattando Matteo in qualche modo.
            Ettore: Ricattando? E per cosa?
            Zeca: Per l'unica cosa che conta in questa famiglia:<hesitate> i soldi.
            Zeca: No, non è vero: <i> l'affetto dei nonni </i> e i soldi.
                -> advance_time ->
                ~ pauseStorylet = true
                -> zeca_acting    
    
    //SCELTE CONDIZIONALI OGGETTI//
    + (pugnale) {inventoryContents has AnticoPugnale && new_this_loop(->pugnale)} Ettore: Ehi Zeca, riconosci questo pugnale!
        Zeca: Matteo lo usa in modo <b>ossessivo</b> per pulirsi la soletta delle scarpe!
        {
        - are_two_entities_together(Ettore, Matteo): Matteo: Non sono ossessivo!
            Matteo: E ora me lo riprendo, grazie mille!
            ~ inventoryContents -= AnticoPugnale
            ~ objectStorageContents += AnticoPugnale
            }
        -> advance_time ->
        ~ pauseStorylet = true
            -> zeca_acting
    
    + (spiedino) {inventoryContents has SpiedinoCocktail && new_this_loop(->spiedino)} Ettore: Questo spiedino da cocktail ti dice qualcosa?
                ~ inConversazione += Zeca
            Zeca: Che mi manca uno spritz a modo, e una manciata di noccioline.
            Zeca: Sai cosa stavo pensando, Ettore?
            Zeca: Che sei una benedizione per la famiglia.
            Zeca: Paola è morta, ma tutti si stanno facendo i cavoli loro.
            Zeca: E invece tu cerchi di capire cosa sia successo e perché.
            Zeca: E sei un po' come questo spiedino, che sa tenere assieme cose di norma destinate a restare separate.
            Zeca: O forse, forse è la morte di Paola, lo spiedino?
            Zeca: <hesitate>Ci devo pensare.
            -> advance_time ->
            ~ pauseStorylet = true
                -> zeca_acting
    
    + (minacce) {inventoryContents has Lettera && new_this_loop(->minacce)} Ettore: Hai mai visto questa lettera?
            Zeca: No, mi spiace, mio giovane amico.
    
    + (limetta) {inventoryContents has LimettaUnghie && new_this_loop(->limetta)} Ettore: Sai chi potrebbe aver perso questa limetta?
            Zeca: Una persona che non bada troppo agli orpelli, direi.
            Zeca: Potrebbe starmi persino simpatica.
    
    + (torta) {inventoryContents has Torta && new_this_loop(->torta)} Ettore: Hai portato tu questa torta, Zeca?
            Zeca: No. Anche perché probabilmente l'avrei mangiata tutta per strada.
            Zeca: Pensi c'entri con l'omicidio?
                + + Ettore: Lo trovo improbabile.
                + + EttorE: Non escludo niente.
                - -
            Zeca: Di certo sarebbe un colpo di scena, non trovi?
            Zeca: Una persona così motivata da spaccare la trachea di un'altra a suon di briciole.
            Zeca: Con tale costanza potrebbe salvare il mondo, altro che uccidere una sola persona.
            Zeca: O forse ha pensato di salvarlo, il mondo, uccidendola?
            Zeca: Quasi quasi anche io mi metto a indagare.
                -> advance_time ->
                    ~ pauseStorylet = true
                    -> zeca_acting
            
    + (vino) {inventoryContents has BottigliaDiVino && new_this_loop(->vino)} Ettore: Hai idea di chi può aver portato questa bottiglia?
            Zeca: Assolutamente no, ma ora è mia.
                ~ inventoryContents -= BottigliaDiVino
                ~ objectStorageContents += BottigliaDiVino
            Ettore: Ma potrebbe essere avvelenata!
            Zeca: E io potrei essere un furgoncino.
            Zeca: Scherzi a parte, non la berrò, promesso.
            Zeca: Ma è gentile da parte tua preoccuparti per me.
                -> advance_time ->
                ~ pauseStorylet = true
                    -> zeca_acting
                
    + (asma) {inventoryContents has FlaconcinoAsma && new_this_loop(->asma)} Ettore: Non riesco a capire a chi appartenga questo flaconcino.
            Zeca: Mai visto, mi dispiace. Però ha una forma molto carina.
            
    + (sigaretta) {inventoryContents has SigarettaElettronica && new_this_loop(->sigaretta)} Ettore: Sei tu che fumi le sigarette elettroniche?
            Zeca: No, giovane amico.
            Zeca: La mia unica droga è l'alcool.
            Zeca: E Schopenhauer.
            Zeca: E non ho ancora capito chi dei due mi ucciderà per primo.
            Zeca: Ma nessuno dei due ha questo odore terribile.
                -> advance_time ->
                ~ pauseStorylet = true
                    -> zeca_acting
    
    
    + [Chiedi a Zeca di raccontarti qualcosa di sè]
        -> esplora_zeca_personaggia
    + [Te ne vai]
        -> intro
    -
->->

= esplora_zeca_personaggia
{debug: <i>Passo per esplora_zeca_personaggia</i>}
~ move_locked_entities(false)

{
- ZecaActing > 1: Zeca: Amico mio, amo le tue domande, ma ora devo riposare un poco.
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    }
}


    = first_qn
    ~ ZecaActing++
                ~ inConversazione += Zeca
        Ettore: Ti era mancato vedere i tuoi fratelli e sorelle?
        Zeca: Avrei preferito un contesto diverso, ma sì, mi sono mancati.
        Zeca: Anche se credo mi manchi qualcosa che non c'è più, il passato con loro.
        Zeca: <joy>Quando eravamo poveri, ma felici.</joy>
        Zeca: Quando nessuno di noi doveva tuffarsi in alcool, lavoro o cazzate spirituali per sopravvivere un'altra giornata.
        Zeca: Mi sembra di stare in una stanza piena di ragazzini che ancora vogliono compiacere papà e mamma.
        Zeca: <hesitate>Anche se son morti da decenni.
        Zeca: E alla fine cosa mi rimane da fare se non riprendere a ignorarli e bere?
                -> advance_time ->
                ~ pauseStorylet = true
            -> zeca_acting 

    = second_qn
     ~ ZecaActing++
                 ~ inConversazione += Zeca
            Ettore: Sai, Matteo non mi parla mai molto di te. Cosa fai nella vita?
            Zeca: Un po' questo, un po' quello.
            Ettore: Nel senso di tanti lavoretti?
            Zeca: No no, nel senso letterale del termine.
            Zeca: Ci sono giornate in cui esploro il <i>questo</i>, tutto ciò che è prossimo, vicino, a contatto con la mia pelle.
            Zeca: E notti in cui esploro il <i>quello</i>, l'alieno, fuori e dentro di me.
            Ettore: Eh, ehm, cosa trovi dentro di te?
            Zeca: <joy>Principalmente arachidi e superalcolici.</joy>
                    -> advance_time ->
                    ~ pauseStorylet = true
            -> zeca_acting     

    = third_qn
    ~ ZecaActing++
                ~ inConversazione += Zeca
        Zeca: Ettore, tu sei in giro a fare un sacco di domande, ma ti sei mai chiesto la cosa più grande?
        Ettore: E quale sarebbe?
        Zeca: La grande domande non è chi avrebbe avuto motivo di uccidere Paola, ma chi avrebbe avuto un motivo per tenerla in vita.
        Zeca: <fear>Quello è il crimine più grande.</fear>
        Zeca: Davanti a questo mondo che brucia, infettato dal fascismo, distrutto dal capitalismo e dall'individualismo, dimmi:
        Zeca: non è forse più crudele volere che qualcun altro viva un solo giorno in tutto questo?
        Zeca: Forse, giovane amico, stai indagando sul crimine sbagliato.
        Zeca: Pensaci su, mentre vado a cercare del pastis.
                -> advance_time ->
                ~ pauseStorylet = true
            -> zeca_acting




/* ---------------------------------
Opzioni di dialogo con la persona Zeca
 ----------------------------------*/

=== zeca_talking
 {debug: <i>Passo per zeca_talking</i>}
 ~ move_locked_entities(false)
    //INFO GENERALI//
    + [Scambia due parole con Zeca]
    -> esplora_zeca
      
    + [Te ne vai]
    -> intro
    -
    
    -> zeca_talking
    

= esplora_zeca
{debug: <i>Passo per esplora_zeca</i>}

{
- ZecaTalking > 0: Zeca: Ora ho bisogno di riflettere su tutti gli errori che mi hanno portato a questo momento, levati.
    -> advance_time ->
    -> intro
- else:
    { shuffle once:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA ZECA

    = first_qn
    ~ ZecaTalking++
                ~ inConversazione += Zeca
        Zeca: Puoi dirmelo se ti piace, lo capirei. Non si può negare che è <joy>irresistibile.</joy>
        Ettore: Chi? Cosa? Quando? Come?
        Zeca: Elia, ovviamente. Se ne innamorano tutti, subito. Quel ragazzo ha un superpotere.
            + Ettore: Non mi piacciono i ragazzi.
                Zeca: Oh, ma Elia trascende queste cose. Lui è come un dio sceso tra noi!
            + Ettore: Non mi piacciono i palestrati.
                Zeca: Mi spiace tu sia nato senza buongusto, ma in fondo è una dote rara.
            + Ettore: Ha il suo fascino, direi.
                Zeca: GIU' LE MANI!
                Zeca: Scherzo, ovviamente. Siamo solo amici. E lui è etero. Povero me.
            -    
        Zeca: Lui per me è come il boccettino dell'asma per Paola: senza, non respiro.
        Zeca: Ma non so come farglielo capire, sai?
                -> advance_time ->
        Zeca: Tu cosa faresti al mio posto?
            + Ettore: Confesserei i miei sentimenti.
                Zeca: E chi ha parlato di sentimenti, scusa?!
                Zeca: Non sono qui per maritarmi con lui!
            + Ettore: Mi godrei la bella amicizia che avete.
                Zeca: Hai provato a ragionarci, vero?
                Zeca: Quel ragazzo è sexy solo quando sta in silenzio.
            + Ettore: In questi momenti benedico di essere aromantico.
                Zeca: Tesò, se vuoi ti faccio un disegno, ma io stavo a parlare di scopà, non di matrimonio.
                Zeca: Vuoi seriamente che il mio bell'uccello rimanga per sempre in un solo nido?
            -
        Zeca: Comunque sono contento che non dobbiamo litigarcelo.
        Zeca: Che poi, insomma:
        Zeca: <fear>con quel fisico che ti ritrovi, davvero non avresti avuto possibilità.</fear>
        Zeca: Cosa sei? Un metro e settanta per settanta chili?
        Zeca: Pancetta da birra, occhiaie da canne e pippe.
        Zeca: Tieni il mio numero. Non per scopà, sia chiaro. Ma per venire a provare i nostri workout.
        Zeca: <joy>Forse c'è speranza anche per te.</joy>
                    -> advance_time ->
            -> zeca_talking 
    
    = second_qn
     ~ ZecaTalking++
                 ~ inConversazione += Zeca
        Zeca: Che hai visto Anastasia per caso?
        Ettore: Anastasia?
        Zeca: Sì, l'orfanella. Greta. L'hai vista?
        Ettore: Greta è orfana?
        Zeca: Roba triste tipo genitori morti quando era piccolissima lacrime e tristezza blah blah blah.
        Zeca: L'hai vista quindi, sì o no?
        Ettore:{are_two_entities_together(Ettore, Greta): Guarda che è letteralmente in questa stanza|No, mi spiace}.
        Zeca: <cry>GRETAAAAAAAAAA! GRETAAAAAA!</cry> Ti ho portato la scheda glutei e la nuova dieta.
        Zeca: Sono troppe 300 kcal al giorno?!?
                -> advance_time ->
                ~ move_this_entity_in_a_different_room(Zeca)
            -> intro

    = third_qn
    ~ ZecaTalking++
                ~ inConversazione += Zeca
        Zeca: Ci mancava la lettera del mistero, mannaggia al gatto del prete.
        Ettore: Lettera del mistero?
        Zeca: Lascia fare. Qui si sta a fare un casino tra oggetti di scena, oggetti privati e casini personali.
        Zeca: Ti giuro che io per primo non capisco chi recita e chi è sincero.
        Zeca: Tu però te la cavi bene, non hai mai tentennato!
            + Ettore: Sai com'è, faccio questo lavoro da una vita!
                Zeca: Ehi, vola basso uccellino.
                Zeca: Che questo posto è già pieno a sufficienza di dive.
            + Ettore: Sei molto gentile.
                Zeca: Non ti montare la testa ora, uccellino!
                Zeca: Non sei di certo Mandy Moore, per dire.
            -
                -> advance_time ->
        Ettore: Comunque anche tu mi hai stupito: non assomigli per nulla allo Zeca della recitazione.
        Zeca: In che senso?
        Ettore: Beh, sei più, sei meno, sei...
            + Ettore: Più diretto dell'altro Zeca.
                Zeca: Davanti a certe frasi di Matteo in effetti gli avrei tirato sberle su sberle.
            + Ettore: Più pragamtico, diciamo.
                Zeca: Quando sei vicino a Greta, o fai così o scleri.
            + Ettore: Direi che tu sei stronzo. Più stronzo.
                Zeca: Grazie. Sono dell'idea che se sei frocio a questo mondo devi esser stronzo, o il mondo ti mangia.
            -    
        Zeca: Quindi, me lo trovi un lavoretto?
        Ettore: In che senso?
        Zeca: A teatro, con te!
            -> advance_time ->
        Zeca: Palese che c'ho tutto no? Capacità, presenza, umorismo.
        Zeca: So anche fare lo stand-up commedian.
        Zeca: Che la gente impazzisce perché posso dire <joy>frocio</joy> perché son <joy>frocio</joy> e loro no e tutte le volte non sanno se ridere e mostarsi prese male. Adoro.
        Zeca: Quindi?
        Ettore: Non sono io a decidere, è l'agente che se ne occupa.
        Zeca: A bene perfetto bravo, digli al tuo agente di trovarmi un lavoro e di chiamarmi.
        Zeca: Magari con <joy>Filippo Timi</joy>, che è così bono!
        Zeca: Devo assolutamente dirlo ad Elia.
        Zeca: <cry>ELIAAAAAAAAA! ETTORE MI FA LAVORARE CON TIMI! ELIAAAAA!</cry>
        {are_two_entities_together(Zeca, Elia): Elia: La pianta?} 
                -> advance_time ->
                ~ move_this_entity_in_a_different_room(Zeca)
            -> intro
