=== cb_first_tier_greta ===
{debug: <i>passo per second_tier_greta</i>}
+ {are_two_entities_together(Greta, Ettore) && peopleTalking==false} [character:Greta] {debug: <i>Ho scelto di parlare con Greta</i>}
    -> greta_acting->
    
+ {are_two_entities_together(Greta, Ettore) && peopleTalking} [character:Greta] 
    -> greta_talking->    
-

-> intro


/* ---------------------------------
Opzioni di dialogo con il personaggio Greta
 ----------------------------------*/


=== greta_acting
    {debug: <i>Passo per greta_acting</i>}
    ~ move_locked_entities()
    -> first_tier_storylets ->
    //INFO GENERALI//

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Che rapporto avevi con Paola?
                ~ inConversazione += Greta
        Greta: Che rapporto avevi con Paola?
        Ettore: Ehi, era solo una domanda innocente!
        Greta: Ehi, era solo una domanda innocente!
        Ettore: Vabbè. Tanto i tuoi fratelli parlano un sacco, me lo diranno loro.
        Greta: Ma sanno solo sparare cazzate.
        Greta: Le volevo bene, ma eravamo molto diverse e quindi non ci capivamo.
        Greta: Contento?
                -> advance_time ->   
            + + Ettore: E come ti senti ora che è morta?
                Greta: Come dovrei sentirmi?
                Greta: C'è un buco da qualche parte, che non riesco a guardare.
                Greta: E una parte di me nega che tutto questo sia accaduto.
                Greta: E forse la domanda più grossa anche per questo è: <hesitate>cosa ne sarà di Elia?
                Greta: Cosa ne sarà di quel tontolotto incapace?
                Greta: Immagino che quando la polizia arriverà e finalmente potrò tornare a casa, riempirò quel vuoto di lacrime.
                Greta: E vodka.
                Greta: E kebab.
                        -> advance_time ->
                    -> greta_acting
            + + [Cambi argomento] -> greta_acting

        
    + (omicidio) {new_this_loop(->omicidio)} Ettore: Secondo te chi ha ucciso Paola?
            Greta: Un essere senza cuore, incapace di provare sentimenti.
            Greta: Destinato a osservare il mondo da un angolo buio, provando odio e rancore eterno.
            Greta: Spendendo ore su ore a immaginare modi atroci per distruggere sé stesso e il resto del mondo.
            Greta: Ma c'è solo una persona che può corrispondere a questa descrizione: <hesitate>io!
            Greta: E sono abbastanza sicura di non aver ucciso nessuno.
            Greta: Non stasera, per lo meno.
            Greta: Ma ti propongo un patto: ti dirò chi è l'unico plausibile assassino se tu convinci Elia a venire a parlarmi.
            Greta: Mi sta evitando da quando è venuta a mancare Paola, e non capisco perché.
                    -> advance_time ->   
                -> greta_acting

   
    
    //SCELTE CONDIZIONALI//

    + (elia) {seen_in_this_loop(->omicidio) && not are_two_entities_together(Greta, Elia) && loopableVariables hasnt EliaRaggiungeGreta && seen_in_this_loop(->elia)}  Ettore: Non sono ancora riuscito a convincere Elia.
            Greta: Mi stupisce: quel ragazzo {~ha il cervello di un pesce bollito|ha smesso di ragionare nel novantasei|ha un unico neurone, ed è disperso dall'undici settembre|crede che la noce moscata sia un insetto}, non deve essere difficile!
    
    + (paolaPerfetta) {loopableVariables has EliaRaggiungeGreta} Ettore: Ho fatto quello che mi hai chiesto, Greta.
            Greta: E Greta te ne è grata, gretino.
            Greta: Scusa, ti ho preso un po' in giro.
            Greta: Ma sinceramente, non ho idea di chi possa aver ucciso Paola, lei era perfetta.
            Greta: È l'unica persona che non posso davvero insultare, perché sarebbe come insultare un'icona.
            Greta: Fossi religiosa, penserei che l'abbia uccisa un demone.
            Greta: O il fisco. So che aveva aperto partita IVA da poco, ed è cosa peggiore dell'inferno.
                    -> advance_time ->
     
     + (matteoGreta) {hardTrueFeelingsStorylet && new_this_loop(->matteoGreta)} Ettore: Quindi, Matteo ti ama?
                 ~ inConversazione += Greta
            Ettore: Mi ha scaricato, vuole sposare te.
            Greta: Uh, questa mi è nuova.
            Ettore: Quindi non è vero che avete fatto sesso?
            Greta: Non ho detto questo.
            Greta: Abbiamo scopato solo una volta, ed ero molto molto molto ubriaca, e Matteo ha perso la testa.
            Greta: A un certo punto pensavo fosse mio padre.
            Greta: Scusa, un po' di daddy issues li abbiamo tutti, <hesitate>no?
                    -> advance_time ->
            Greta: Cioè, anche tu a uscire con Matteo, che ha ottant'anni da quando andava all'asilo.
            Greta: Ma no, niente amore, mai.
            Greta: Greta ama solo due cose: psilocibina e Kesha.
            Greta: Se lo becco provo a farlo ragionare.
            Greta: Ma vuoi ancora sposarlo, dopo questo numero?
                + + (loVoglio)Ettore: Sì, è l'uomo giusto per me.
                + + Ettore: No, te lo puoi tenere.
                - -
            Greta: Te la butto lì: fatti dare un indennizzo, tanto i nonni sono pieni di soldi.
            Greta: E facciamoci tre settimane in Messico a sperimentare un po' di <joy>allucinogeni</joy>.
            Greta: Comunque, nel dubbio, due chiacchiere con lui le faccio appena capita.    
                    -> advance_time ->

    //SCELTE CONDIZIONALI OGGETTI//
    + (minacce) {inventoryContents has Lettera && new_this_loop(->minacce)} Ettore: Sai da dove viene questa lettera?
        Greta: <fear>La calligrafia è di Paola</fear>. Dove l'hai trovata?
        Greta: Non importa, comunque. Questa rimane con me per un po'.
            ~ inventoryContents -= Lettera
            ~ objectStorageContents += Lettera
            ~ gretaHaLaLettera = true
                -> advance_time ->
    
    + (pugnale) {inventoryContents has AnticoPugnale && new_this_loop(->pugnale)} Ettore: Hai mai visto questo pugnale?
        Greta: Solo in qualche film dell'orrore.
        Greta: O al battesimo di mia zia Selma.
        Greta: Oh sì che sapeva come farci divertire, la vecchia sagoma!
    
    + (spiedino) {inventoryContents has SpiedinoCocktail && new_this_loop(->spiedino)} Ettore: Sai qualcosa su questo spiedino?
            Greta: <i>FEG</i>? Questa è la sigla del locale mio e di Elia, ma non ricordo di averne mai visto uno prima d'ora.
    
    + (limetta) {inventoryContents has LimettaUnghie && new_this_loop(->limetta)} Ettore: Riconosci questa limetta per unghie?
        Greta: Yep, è mia.
        Greta: Ho una seconda unghia che mi sta spuntando sull'alluce destro.
        Greta: Una cosa <joy>mostruosa</joy>, sinceramente.
        Greta: Elia ha anche proposto di vendere le sue foto su OnlyPiedini, e non è una cattiva idea.
        Greta: Devo limarla spesso o fa male.
        Greta: Ma non voglio levarla, lo schifo che mi genera è liberatorio.
        Greta: Per questo l'ho chiamata <i>Zeca</i>.
                -> advance_time ->
    
    + (torta) {inventoryContents has Torta && new_this_loop(->torta)} Ettore: Conosci questa torta?
        Greta: Naa, non le ho chiesto il nome, nulla.
        Greta: Abbiamo consumato l'atto anonimamente, come piace a me.
        Greta: E poi addio.
        Ettore: Quindi è un <i>no</i>?
        Greta: Quindi è un "Fintanto che farai domande stupide, avrai risposte stupide".
        Greta: Però sul sesso è un peccato: sei davvero belloccio.
        Greta: Ma ormai so troppo di te per poterti trovare sexy.
                -> advance_time ->
    
    + (vino) {inventoryContents has BottigliaDiVino && new_this_loop(->vino)} Ettore: Sai da dove viene questa bottiglia di vino?
        Greta: Puglia.
        Ettore: Ok, ma chi l'ha portata?
        Greta: Immagino una persona.
        Greta: O forse è venuta da sola.
        Greta: Sarebbe una scoperta interessante.
        Greta: E un segno di acutezza ben maggiore di quella di Elia.
        Greta: O di qualcuno che va in giro a fare domande a caso.
            -> advance_time ->
    
    + (asma) {inventoryContents has FlaconcinoAsma && new_this_loop(->asma)} Ettore: Greta, guarda questo flaconcino per l'asma!
        Greta: Non ho tempo, ho cose più interessanti da fare.
        Greta: Tipo sperare di venire uccisa dal serial killer.
        Ettore: Ma non c'è alcun serial killer, no?
        Ettore: C'è stato un solo omicidio.
        Greta: Dipenderà molto da quante domande continuerai a fare.
            -> advance_time ->
    
    + (sigaretta) {inventoryContents has SigarettaElettronica && new_this_loop(->sigaretta)} Ettore: Sai chi potrebbe averla persa?
        Greta: No.
        Ettore: Ma..
        Greta: <cry>No.</cry>

    + [Conosci meglio Greta] -> esplora_greta_personaggia
    + [Te ne vai]
        -> intro
      

    -
    -> greta_acting

    = esplora_greta_personaggia
    {debug: <i>Passo per esplora_greta_personaggia</i>}
    ~ move_locked_entities()
    {
    - GretaActing > 1: Greta: Ettore bello, mo basta, vai a giocare da un'altra parte!
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
    ~ GretaActing++
            Ettore: Com'è essere una sorella acquisita?
            Greta: Hai presente quando qualcuno della tua famiglia trova <joy>un gattino</joy> per strada,
            Greta: e quel gattino è adorabile e coccoloso e tutti lo coccolano,
            Greta: e magari all'inizio in famiglia dicono che no, non lo voglio un gattino,
            Greta: ma ora fanno a gara a chi lo carezza di più o gli dà da mangiare o lo fa giocare,
            Greta: e quella famiglia che magari prima era un po' infelice, ora ha qualcosa di bello attorno a cui riunirsi,
            Greta: e ogni giorno sembra Natale, una festa di compleanno, un matrimonio?
            Greta: Ecco, io per loro sono <joy>i vermi</joy> del micino, e la diarrea che ti caccerà per tutta casa.
                    -> advance_time ->
                -> greta_acting 

    = second_qn
     ~ GretaActing++
            Ettore: Come mai hai deciso di aprire il pub con Elia?
            Greta: Perché qualcuno doveva chiudere da qualche parte quella specie di labrador.
            Greta: E perché è un bel luogo dove insultare le persone.
            Greta: Tanto i comici che vengono sono solo dei falliti.
            Greta: E poi ho accesso infinito all'alcool, gratuitamente.
            Greta: Cosa che ora mi renderebbe tutto questo più sopportabile.
            Greta: E non intendo la morte di Paola.
            Greta: Intendo questa conversazione.
                    -> advance_time ->
                -> greta_acting     

    = third_qn
    ~ GretaActing++
            Greta: Chissà Matteo come sta.
            Ettore: Non sapevo fossi legata a Matteo.
            Greta: Vedrai presto che in questa famiglia tutti sono legati, quasi incollati, inchiodati.
            Greta: Non è una famiglia, è un culto.
            Greta: E se la divinità è Paola, Matteo è l'eretico che vuole prendere il suo posto, e amo gli eretici.
            Ettore: Anche Matteo ha stima di te. Racconta spesso di quello che pensi e dici.
            Greta: E cosa penserei?
            Ettore: Ehm, io ora non ricordo bene.
            Greta: Non parla mai di me, vero?
            Greta: Meglio: adoro essere ignorata dalla mia divinità, è una cosa così cattolica.
                    -> advance_time ->    
                -> greta_acting




/* ---------------------------------
Opzioni di dialogo con la persona Greta
 ----------------------------------*/

=== greta_talking
 {debug: <i>Passo per greta_talking</i>}
 ~ move_locked_entities()
    //INFO GENERALI//
    + [Fai una chiacchierata con Greta] -> esplora_greta
    + [Te ne vai] -> intro
    -
    
    -> greta_talking
    

    = esplora_greta
    {debug: <i>Passo per esplora_greta</i>}
    
    {
    - GretaTalking > 0: Greta: Non chiedermi altro ora: se Paola mi vede ferma mi uccide!
        -> advance_time ->
        -> intro
    - else:
        { shuffle once:
        -   -> first_qn
        -   -> second_qn
        - {not are_two_entities_together(Greta, Elia) && not are_two_entities_together(Greta, Zeca)}  -> third_qn
        
        }
    }

//DOMANDE SUllA PERSONA GRETA

    = first_qn
    ~ GretaTalking++
                ~ inConversazione += Greta
        Greta: Moriremo tutti, tutti.
        Ettore: Cosa è successo?
        Greta: <cry>COSA E' SUCCESSO?</cry>
        Greta: Ah, mi chiede cosa è successo.
        Ettore: Forse è il caso che me ne vada.
        Greta: <cry>NO, NON LASCIARMI SOLA!</cry>
        Ettore: Sono confuso in questo momento.
        Greta: Tu sei un attore professionista. Quindi, dimmi: quanto fa schifo questa roba?
                -> advance_time ->
            + Ettore: Dai, livello Alberto Tomba in "Alex l'ariete".
            + Ettore: Le blatte non se la sono cavata male.
            -
        Greta: Pensi di essere divertente?
        Greta: Paola mi aveva promesso le mie prime ferie da sei anni, se avessi fatto un buon lavoro.
        Greta: <cry>LE MIE PRIME FERIEEEEE!</cry>
        Greta: E ora il massimo del sole che prenderò sarà come sempre la luce del frigorifero.
        Greta: Forse, se faccio bere Paola a sufficienza, si potrebbe dimenticare di ogni cosa, no?
                -> advance_time ->
            -> greta_talking 

    
    = second_qn
     ~ GretaTalking++
                 ~ inConversazione += Greta
        Greta: Sapevi che questa prima era una fonderia?
        Greta: Poi hanno deciso di costruirci questo inferno social, dove vieni a farti le foto fighe etc etc.
        Greta: Paola aveva un amico di un amico che aveva un debito, e l'ha avuta a gratis.
        Greta: E così si è svegliata e ha detto: "Ma sì, oggi sono una regista!"
        Greta: Ma non poteva fare che ne so, un film, o "The Lady". No.
        Greta: Doveva tirare su questa cosa superimprovvisata che poi dovremmo ripetere dal vivo per una settimana.
        Greta: Portandoci dentro persone inconsapevoli che devono fare il tuo, di ruolo.
        Greta: Praticamente, un rapimento.
                -> advance_time ->
        Greta: E tu mi chiederai ora: perché mi stai dicendo tutto questo?
        Greta: Non è un po' troppo diretto, quasi uno spiegone?
        Greta: E avresti ragione. Ma c'è un grosso <i>ma</i>: queste cose avrei dovuto dirtele all'ingaggio.
        Greta: E invece ero così presa dai casini della Londar e dai malumori di Paola che alla fine al tuo agente ho solo dato orario e indirizzo.
        Greta: E ora mi sento in colpa perché mi chiedo: quando Paola è morta, hai capito che era una recita, o ti sei spaventato?
                -> advance_time ->
            + Ettore: Mi sono cagato addosso.
                Greta: Come temevo.
            + Ettore: Naa, era tutto troppo ridicolo.
                Greta: Bene, ma non dirlo a Paola o mi licenzia.
            -
        Greta: Fortuna comunque che il tuo agente ha firmato un accordo superrestrittivo per te.
        Greta: Per cui non potresti denunciarci neanche in caso di menomazione.
        Greta: A differenza della tizia dell'anno scorso.
        Greta: C'è altro?
                -> advance_time ->
            -> greta_talking    


    = third_qn
    ~ GretaTalking++
                ~ inConversazione += Greta
        Greta: Come ti trovi coi gossip?
            + Ettore: Non vivo senza.
                Greta: Siamo in due!
            + Ettore: Basta che non siano su di me.
                Greta: Tranqui, non sei così interessante.
            -
        Greta: Non so se l'hai notato, ma Elia e Zeca sono l'uno l'ombra dell'altro.
        Greta: E fuori da qui, lavorano assieme accaventiquattro su quel loro progetto di merda.
        Greta: Che è una specie di Onlyfans per sfigati narcisisti.
        Greta: E sai qual è la cosa più interessante?
        Greta: Che nessuno dei due è fidanzato.
        Greta: Anche se a volte sospetto che la fidanzata di Elia sia Zeca.
                -> advance_time ->    
        Greta: E non ci sarebbe niente di male, figurati.
        Greta: Solo che non mi piace essere tirata in giro.
        Greta: Cioè, prova a immaginare ad esempio una situazione in cui tu scopi con Elia.
        Greta: Non sempre, saltuariamente, proprio quando c'hai un prurito.
        Greta: E lui si scopa anche altra gente.
        Greta: Un po' la cosa ti farebbe incazzare, no?
        Greta: E mi immagino il povero Zeca, come potrebbe sentirsi.
        Greta: <hesitate> Soprattutto se questa ragazza immaginaria non fosse poi così tanto immaginaria.
                -> advance_time ->
            -> greta_talking