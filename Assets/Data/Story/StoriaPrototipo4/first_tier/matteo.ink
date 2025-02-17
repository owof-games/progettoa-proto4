=== cb_first_tier_matteo ===
{debug: <i>passo per first_tier_matteo</i>}
+ {are_two_entities_together(Matteo, Ettore) && peopleTalking==false} [character:Matteo] {debug: <i>Ho scelto di parlare con Matteo</i>}
    -> matteo_acting ->

+ {are_two_entities_together(Matteo, Ettore) && peopleTalking} [character:Matteo]
    -> matteo_talking ->    
-

-> intro



/* ---------------------------------
Opzioni di dialogo con il personaggio Matteo
 ----------------------------------*/


=== matteo_acting
    {debug: <i>Passo per matteo_acting</i>}
    ~ move_locked_entities(false)
    -> first_tier_storylets ->
    //INFO GENERALI//

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Amore tu e Paola eravate davvero legati?
                    ~ inConversazione += Matteo
        Matteo: Sai come sono: lavoro lavoro lavoro.
        Matteo: Ogni tanto mi chiamava, ma non avevo mai tempo per rispondere.
        Matteo: Però le mandavo gli auguri a Natale.
        Matteo: E dei meme carini.
        Matteo: Che recuperava la mia segretaria.
        Matteo: I meme intendo.
        Matteo: Gli auguri glieli scrivevo io.
                    -> advance_time ->
            + + Ettore: E come stai ora? Ora che è morta?
                Matteo: Sai come sono: cerco sempre di andare avanti come un treno.
                Matteo: Vorrei mettermi subito a lavorare.
                Matteo: Prima ho provato a chiamare la mia segretaria, ma ha risposto la segreteria telefonica: ironico, vero?
                Matteo: Allora ho provato a distrarmi masturbandomi.
                Matteo: Ma non c'è vera privacy in questo posto.
                Matteo: Però magari potresti darmi una mano.
                Matteo:<joy>Lì, sotto la tovaglia?</joy>
                    -> advance_time ->
                Ettore: Magari non ora, amore.
                Matteo: Non mi giudicare: ognuno elabora il lutto come può.
                ~ pauseStorylet = true
                    -> matteo_acting    
            + + [Cambi argomento]
                -> matteo_acting

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Chi potrebbe aver ucciso Paola?
                    ~ inConversazione += Matteo
        Matteo: La mafia russa.
        Ettore: La mafia russa?
        Matteo: Sì. Aveva debiti con mezzo mondo, Paola.
        Matteo: E un giro di prostituzione da far paura al Vaticano.
        Matteo: E c'è chi giura che abbia inventato lei, l'ananas sulla pizza.
        Ettore: Io, ehm. Io. Madonna, sembrava una persona così carina.
            -> advance_time ->
        Matteo: Ahah ci sei cascato, vero?
        Matteo: Lo sapevo!
        Matteo: Sapevo di essere fatto per fare l'attore!
        Matteo: Che ne dici, provo con un casting?
        Ettore: Amore, io...
        Matteo: Comunque no, nessuno avrebbe potuto odiarla, figurarsi ucciderla.
        Matteo: Eppure è morta.
        Matteo: <hesitate>La vita è un mistero.
             -> advance_time ->
             ~ pauseStorylet = true
                -> matteo_acting  
    
    //SCELTE CONDIZIONALI//
    
    + (paolaSiSposa) {elia_acting.paolaSiSposa} Ettore: Matteo, ma tu sapevi che Paola si stava per sposare?
        {not marryMeStorylet: Matteo: Era un po' un segreto di pulcinella.}
        {marryMeStorylet: Matteo: Paola ha organizzato il matrimonio appena le ho confidato che avrei voluto sposarti, la stronza.}
        + + {marryMeStorylet && not are_two_entities_together(Zeca, Matteo)} Ettore: E come l'hai presa?
            Matteo: Mi sono incazzato. Ma non così tanto da volerla uccidere, se è quello il tuo dubbio.
            - - (paolaZeca) Matteo: Ma la cosa più ridicola è che abbia chiesto a Zeca di fare da testimone.
            Matteo: Quando sappiamo tutti in famiglia che Zeca odia Paola da sempre!
            Matteo: E non a me, il fratello fedele che le dava un sacco di soldi per le sue opere di carità.
            Matteo: No, al fallito, a quello che fa vergognare tutta la famiglia.
            Matteo: Quello che si è rovinato la vita per tirare su <rage>un<waitrage> collettivo<waitrage> di<waitrage> videogiochi</rage>.
            Matteo: Ma andasse a zappare!
            -> advance_time ->
                ~ pauseStorylet = true
                    -> matteo_acting 
                    
    + (sposo) {new_this_loop(->sposo) && new_this_loop(->hardTrueFeelingsStorylet)} {elia_acting.uniti && not are_two_entities_together(Greta, Matteo)} Ettore: Amore, avrei un favore da chiederti in merito al matrimonio.
            ->hardTrueFeelingsStorylet->
    
    + (sposo2) {new_this_loop(->sposo2) && zeca_acting.sposo2 && new_this_loop (-> hardTrueFeelingsStorylet)} Ettore: Zeca dice che mi sposi perché ti torna comodo.
            Matteo: E se anche fosse?
            Matteo: Ogni relazione è una relazione di comodo.
            Matteo: Per compensare la solitudine.
            Matteo: Per denaro.
            Matteo: Per del sesso garantito.
            Matteo: Tu avrai tutte e tre queste cose da me, per cui non farmi la morale.
            Matteo: E ora vai dal tuo nuovo amico alcolizzato e digli di andare a cagare.
            {are_two_entities_together(Zeca, Matteo): Zeca: Ettore, spero davvero tu possa aprire gli occhi.}
                -> advance_time ->
                ~ pauseStorylet = true
                    -> matteo_acting 
        
            
        
    //SCELTE CONDIZIONALI OGGETTI//
    + (pugnale) {inventoryContents has AnticoPugnale && new_this_loop(->pugnale)} Ettore: Hai mai visto questo spiedino?
            Matteo: No.
                ~ pauseStorylet = true
                -> matteo_acting
                
    + (spiedino) {inventoryContents has SpiedinoCocktail && new_this_loop(->spiedino)} Ettore: Hai mai visto questo spiedino?
            Matteo: Mmm, hai in mente qualcosa di kinky?
                ~ pauseStorylet = true
                -> matteo_acting            
                
    + (minacce) {inventoryContents has Lettera && new_this_loop(->minacce)} Ettore: Riconosci questa lettera?
            Matteo: Come? <fear>Mettila via, subito!</fear>
            Ettore: Perché?
            Matteo: <cry>SUBITO!</cry>
                ~ pauseStorylet = true
                    -> matteo_acting 
    
    + (limetta) {inventoryContents has LimettaUnghie && new_this_loop(->limetta)}Ettore: Sai di chi sia questa limetta?
            Matteo: Pacchiana, economica, e con tracce di schifo? Deve essere di Greta.
                ~ pauseStorylet = true
                    -> matteo_acting 
    
    + (torta) {inventoryContents has Torta && new_this_loop(->torta)} Ettore: Hai portato tu questa torta?
            Matteo: Palesemente è stata cucinata, e io non ho il tempo di cucinare.
            Matteo: Lo sai che ho la mia azienda da portare avanti!
                ~ pauseStorylet = true
                    -> matteo_acting 
    
    + (vino) {inventoryContents has BottigliaDiVino && new_this_loop(->vino)} Ettore: Riconosci questa bottiglia di vino?
            Matteo: Dai qui. Uh, un negroamaro.
            Matteo: Profumo intenso, sontuoso direi, quasi balsamico.
            Matteo: Eppure è austero, persino salato.
            Matteo: E un aroma di prugne, di rabarbaro.
            Matteo: Come le caramelle che ci dava nonna da piccoli.
            Matteo: Come un momento di rara felicità.
            Matteo: Come quando eravamo al sicuro, prottetti, e non lo sapevamo.
            Matteo: Fa schifo, portalo via!
            -> advance_time ->
                ~ pauseStorylet = true
                    -> matteo_acting 
    
    + (asma) {inventoryContents has FlaconcinoAsma && new_this_loop(->asma)} Ettore: Sai chi ha problemi d'asma?
            Matteo: Chi non lavora.
            Ettore: Non è che prendi l'asma se non lavori.
            Matteo: Questo lo dici tu.
            Matteo: Se lavori, se lavori <b>davvero</b>, non hai tempo per ammalarti.
            Matteo: La malattia è una invenzione di ecologisti e comunisti, tutti scansafatiche!
            Ettore: Stai tremando, sai?
            Matteo: Ah sì, ho la dengue da un paio di giorni, niente di grave.
            -> advance_time ->
                ~ pauseStorylet = true
                -> matteo_acting 
    
    + (sigaretta) {inventoryContents has SigarettaElettronica && new_this_loop(->sigaretta)} Ettore: Tu sai chi possa fumare questa roba?
            Matteo: <i>Tu sai chi possa fumare questa roba?</i>
            Matteo: Lasciami lavorare, Ettore.
            Ettore: Ma non stai facendo niente.
            Matteo: Lo sto facendo <b>dentro</b>.
            Matteo: Un imprenditore lavora sempre.
            Matteo: Anche mentre dorme.
            Matteo: Anche mentre scopa.
            Ettore: Uh, questo è poco lusinghiero.
            Matteo: Con le lusinghe non si manda avanti l'economia, <joy>non si salva il Paese!</joy>
            Matteo: Ora via, che c'ho da pensare!      
            -> advance_time ->
                ~ pauseStorylet = true
                -> matteo_acting 
      
    + [Chiedi a Matteo di raccontarti qualcosa di sè]
        -> esplora_matteo_personaggia
    + [Te ne vai]
        -> intro
    -
->->

    = esplora_matteo_personaggia
    {debug: <i>Passo per esplora_matteo_personaggia</i>}
    ~ move_locked_entities(false)
    
    {
    - MatteoActing > 1: Matteo: Cucciolo, fai due passi, che paparino ha da fare due chiamate di lavoro.
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
    ~ MatteoActing++
            Ettore: Come posso tirarti su il morale, Matteo?
            Matteo: Un pompino in bagno?
            Ettore: Non credo sia il caso.
            Matteo: Ma sei così bello.
            {not hardTrueFeelingsStorylet.ah or hardTrueFeelingsStorylet.mono: Ettore: E Paola è così morta, no?}
            {hardTrueFeelingsStorylet.ah or hardTrueFeelingsStorylet.mono: Ettore: Ma non ami Greta?}
            Matteo: E quindi non dovremmo celebrare la vita?
            Matteo: Diffondere l'amore, saziarci nei nostri corpi fino a raggiungere le stelle.
            Ettore: Ti va una merendina?
            Matteo: Ecco, sì, una merendina sarebbe perfetta.
                    -> advance_time ->
                    ~ pauseStorylet = true
                -> matteo_acting 

    = second_qn
     ~ MatteoActing++
            Ettore: Non mi parli mai molto della tua famiglia, come mai?
            Matteo: Ovvio: sono tutti invidiosi.
            Matteo: Zeca è un fallito e pensa solo a chiedermi prestiti.
            Matteo: Elia ha il cervello di un labrador nel corpo di un trentenne disgraziato.
            Matteo: Paola giudica chiunque non rinunci a ogni piacere possibile.
            Matteo: Greta pensa che essere acide sia un tratto distintivo.
            Matteo: E i nonni sono i nonni. Insomma, son vecchi e quindi noiosi.
            Matteo: Ma almeno mi hanno dato una mano con l'azienda.
            Matteo: Ma solo una mano, giuro, il resto ho fatto da solo!
                    -> advance_time ->
                    ~ pauseStorylet = true
                -> matteo_acting     

    = third_qn
    ~ MatteoActing++
        Matteo: Ti ricordi la sera in cui ci siamo conosciuti?
        Ettore: E come potrei dimenticarla? Pensavo sarebbe stato un semplice colloquio di lavoro, ed eccoci quì.
        Matteo: Sai qual è stata la prima cosa che ho pensato quando ti ho visto entrare?
        Matteo: <joy>Bel culo</joy>. Questo tizio ha davvero un <joy>gran bel culo</joy>.
        Ettore: Me lo dicesti pure. Mi imbarazzai un sacco.
        Matteo: Eh, son sempre stato una persona diretta, vero?
        Matteo: Anche se mi son dovuto dare una calmata, dopo quelle denunce.
        Matteo: Certi ragazzi non sanno stare più allo scherzo.
        Ettore: E cosa pensi di me, ora?
        Matteo: Che ti porterei in bagno e te lo mangerei, quel gran bel culo.
                    -> advance_time ->
                    ~ pauseStorylet = true
                -> matteo_acting




/* ---------------------------------
Opzioni di dialogo con la persona Matteo
 ----------------------------------*/

=== matteo_talking
 {debug: <i>Passo per matteo_talking</i>}
 ~ move_locked_entities(false)
    //INFO GENERALI//
    + [Provi a conoscere Matteo]
        -> esplora_matteo
    + [Ti guardi attorno]
        -> intro
    -
    
    -> matteo_talking

    = esplora_matteo
    {debug: <i>Passo per esplora_matteo</i>}
    
    {
    - MatteoTalking > 0: Matteo: Perdonami, ma ho del lavoro arretrato da fare mentre riposate.
        -> advance_time ->
        -> intro
    - else:
        { shuffle once:
        -   -> first_qn
        -   -> second_qn
        - {not are_two_entities_together(Matteo, Paola)}  -> third_qn
        
        }
    }

//DOMANDE SUllA PERSONA MATTEO

    = first_qn
    ~ MatteoTalking++
                    ~ inConversazione += Matteo
        Matteo: Mi sa ma tra una cosa e l'altra non ci siamo presentati, vero?
        Matteo: Mi chiamo Matteo, e sono intrappolato quasi contro la mia volontà in questa recita.
        Matteo: Ma ci sono cose peggiori, direi.
        Matteo: E tu invece?
            + Ettore: Mi chiamo Ettore, piacere.
                Matteo: Ok, quindi la maledizione del nome uguale per il personaggio non ha risparmiato nemmeno te.
            + Ettore: Sono colpevole di essere qui per scelta.
                Matteo: Beh, almeno se butta male puoi andartene.
            -
        Ettore: Ma come mai sei obbligato ad essere qui?
        Matteo: Oh, lo siamo un po' tutti, direi.
            -> advance_time ->
        Matteo: Greta è la segretaria di Paola.
        Matteo: Io faccio le pulizie a casa di Elia, e lavoro in un call center dell'azienda di Paola.
        Matteo: Se da qualche parte c'è Elia, Zeca è sempre dietro di lui.
        Matteo: Ed Elia è qui perché non sa mai dire di no a Paola.
        Matteo: Anche se, e rimanga tra noi, sono settimane che litigano, e di brutto, davvero di brutto.      
        Ettore: Hai idea del perché?
        Matteo: <hesitate> Diciamo che non sono cose che si dicono a chi non fa parte dell'inner circle.
        Matteo: Ma se ti capitasse un cellulare sotto mano, beh: cerca Londar INC tra le notizie e avrai le idee un po' più chiare.
                -> advance_time ->
            -> matteo_talking 

    = second_qn
     ~ MatteoTalking++
                     ~ inConversazione += Matteo
        Matteo: Dio, quanto vorrei avere il ruolo del morto, almeno potrei dormire.
        Ettore: Sei molto stanco?
        Matteo: Questa risposta è sempre vera negli ultimi sei anni.
        Matteo: Per campare in questa economia mi tocca fare due lavori. E ora persino recitare.
        Matteo: Ironico che Paola mi abbia appioppato il ruolo del ricco idiota che non sa fare niente.
        Matteo: Una manco velata rappresentazione di come lei vede Elia, sinceramente.
        Matteo: E a proposito dell'altro Matteo: mi spiace di dover essere un fidanzato di merda, sinceramente.
        Matteo: {hardTrueFeelingsStorylet: Soprattutto quella faccenda con Greta|E il peggio deve ancora arrivare}.
                -> advance_time ->
                + Ettore: Fa parte del lavoro, non ti preoccupare.
                    Matteo: Beh, non mi piace comportarmi da stronzo, mai.
                + Ettore: Paola non apprezza Elia?
                    Matteo: Al lupo importa qualcosa della preda che sta per addentare?    
                -
        Matteo: Ma che ne dici se dopo tutto questo casino <joy>ci beviamo qualcosa</joy>?
        Matteo: Non è un appuntamento, tranqui.
        Matteo: Ma non so da quanto tempo non ho una conversazione che non sia di lavoro.
        Matteo: O con qualcuno con cui non lavoro.
        Matteo: Che poi ok, stiamo lavorando assieme ora. Ma almeno non mi stai urlando in faccia.
                + Ettore: Appena stacchiamo viene a prendermi la persona con cui sto.
                    Matteo: Come non detto. Spero ci si ribeccherà di nuovo allora.
                        + + Ettore: Ma non è un problema, per noi. Insomma, non è una relazione esclusiva.
                            Matteo: Allora birrettona a tre?
                        + + Ettore: Volentieri!
                + Ettore: Volentieri! Birretta e cazzate?
                    Matteo: La serata migliore direi!
                + Ettore: La risposta è sì. E non mi spiacerebbe fosse un appuntamento.
                    Matteo: Sapevo che avrei dovuto mettere la camicia migliore, cavolo!
                    Ettore: Beh, possiamo risolvere rimanendo nudi.
                -
        Matteo: Grazie per questo momento di umanità, Ettore. Lo dico col cuore.
                -> advance_time ->                       
            -> matteo_talking    

    = third_qn
    ~ MatteoTalking++
                    ~ inConversazione += Matteo
        Matteo: Ehi Ettore!
        Matteo: Come te la cavi con le bugie?
            + Ettore: Mi faccio sgamare in tre secondi.
                Matteo: Ahah allora capirai il mio dramma.
            + Ettore: Sono un attore, vivo di bugie.
                Matteo: Naa, hai una faccia troppo simpatica, non ti credo.
            -
        Matteo: Metti che ti è stato chiesto di occuparti di una cosa importante.
        Matteo: Ma non l'hai fatta, e hai chiesto a qualcun altro di fare quella cosa.
        Matteo: E quella persona quella cosa l'ha fatta, ma non sai se bene o meno.
        Matteo: E chi ti ha chiesto di fare quella cosa ti ha riempito di complimenti, complimenti che però non andrebbero davvero dati a te.
        Matteo: <hesitate>Quale sarebbe la cosa giusta da fare?    
            -> advance_time ->
            + Ettore: Chi ha deciso di aiutarti ha accettato le conseguenze.
                Matteo: Una visione pragmatica.
            + Ettore: Dì a chi ti ha aiutato che i complimenti sono per lei.
                Matteo: Così li abbiamo entrambi?
            -
        Matteo: Se non fosse stata Paola, a chiedermi di fare quella cosa, la sincerità sarebbe una opzione.
        Matteo: Ma lei si arrabbia se esisti, figuriamoci se non hai fatto le cose come vuole lei.
        Matteo: Però ha davvero apprezzato la torta.
        Matteo: Esteticamente, per lo meno, non l'ha ancora mangiata.
        Matteo: E spero non lo faccia mai.
        Matteo: Scusa ma devo controllare una cosa, a dopo!            
            -> advance_time ->
            ~ move_this_entity_in_a_different_room(Matteo) 
        -> intro