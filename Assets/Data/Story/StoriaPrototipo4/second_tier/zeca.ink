=== cb_second_tier_zeca ===
{debug: <i>passo per second_tier_zeca</i>}

+ {are_two_entities_together(Zeca, Ettore)} [character:Zeca]
    -> zeca_talking_second_tier ->    

+ {are_two_entities_together(Zeca, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Zeca]
    -> paola_is_dead_zeca ->
-    


-> intro




/* ---------------------------------
Opzioni di dialogo con la persona Zeca
 ----------------------------------*/

=== zeca_talking_second_tier
 {debug: <i>Passo per zeca_talking_second_tier</i>}
 {loopableVariables has pausaRapportoZeca: Zeca: Ma stammi lontano, cafone! -> intro.}
    //INFO GENERALI//
    + (loop) {new_this_loop(->loop)} Ettore: Zeca, non hai notato cose strane negli ultimi minuti?
        Zeca: Tipo?
        Ettore: Che sembra che state dimenticando le cose, e fate cose strane.
        Zeca: Tipo?
        Ettore: Tipo: durante la recita prima Paola è morta, morta davvero, e ora fate finta di niente.
        Zeca: Tipo?
        Ettore: Tipo ora tu, che mi chiedi "Tipo?" invece di essere preoccupato.
        Ettore: Ecco: come prima, quando abbiamo ripetuto la scena della cena.
        Ettore: E Paola gridava cose strane e voi ridevate.
        Zeca: Embè?
        Zeca: Scusa ciccio, ma non c'ho testa ora.
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
        Zeca: C'ho la mafia gay.
        Ettore: Non era la lobby gay?
        Zeca: No, quella è quella che ha creato M¥SS KETA.
        Zeca: La mafia gay è quella che ti fa i quality check prima di entrare nelle disco.
        Zeca: O prima di entrare in uno spazio nerd.
        Zeca: Quella che decide se sei bono abbastanza o se ti deve buttare in un bidone di acido ialuronico.
        Ettore: Ahah divertente.
        Zeca: DIVERTENTE?!?!
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
        Zeca: Non sto scherzando.
        Zeca: Ho chiesto loro un prestito di quindici palestronze all'avvio della palestra.
        Zeca: Per fare un po' di hype insomma, per attirare i morti di cazzo.
        Zeca: Ma preso dalle cose da fare ho perso il senso del tempo e saltato due, ehm, tre pagamenti.
        Zeca: E ora i debiti sono alti. Incolmabili.
        Ettore: E cosa vogliono da te?
        Zeca: Quote della Londar Cosmetics.
        Zeca: E un incremento della produzione di costumi furry da lontra.
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Zeca: E SE NON LA SMETTI DI RIDERE TI MENO!
        Zeca: Perché ne va della mia pelle. Hai visto cosa hanno fatto a Chiara Iezzi?
        Zeca: Prima l'hanno cancellata per omofobia, poi l'hanno riportata in auge contro la sua volontà.
        Zeca: Giusto per farle vedere chi comanda.
        Zeca: Ma cosa ti dico queste cose a te?
        Zeca: Sei così vestito male che sei o etero o woke.
        Zeca: Devo chiedere aiuto a Paola, è l'unica opzione che mi rimane.
            -> advance_time ->      
                 -> zeca_talking_second_tier

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Tu e Paola andate d'accordo?
        Zeca: Non mi dispiace, ma non ci pigliamo.
        Zeca: Lei è un po' troppo bossy, non so se ci capiamo.
        Zeca: Cosa che adoro in una donna, ma fa troppo elder millenial.
        Zeca: La nostra generazione preferisce qualcosa di più diretto e meno sofisticato.
        Zeca: Demure.
        Zeca: Tipo Jennifer Coolidge.
        Ettore: Quindi, hai stima di Paola?
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Zeca: Mmm. No. Ora che ci penso, no.
        Zeca: PERO'. PERO'.
        Zeca: Ci uscirei a fare serata e sparlare di Elia, quello sì.
            + + [Cambi argomento] -> zeca_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Secondo te qualcuno potrebbe volere del male a Paola?
        Zeca: Tesoro.
        Zeca: CHI non vorrebbe farle del male?
        Zeca: O almeno dirle due paroline a modo.
        Ettore: E tu, le vuoi male?
        Zeca: Naa, ci saremo parlate tre volte in due anni.
        Zeca: PERO'. PERO'.
        Zeca: Se continua a trattare così di merda Elia, potrei farci un pensierino.
        Zeca: Solo io posso insultarlo.
        - (omicidio2) Zeca: Per il resto: farei qualsiasi cosa per proteggere Elia.
        -> advance_time ->
            -> zeca_talking_second_tier

    + [Chiacchiera con Zeca] -> esplora_zeca

    // OPZIONE PER IL FINALE
    + {primaContraddizione && secondaContraddizione} [È il momento di fermare l’omicida di Paola!] Ettore: Venite tutti, ho bisogno di parlarvi! -> arringa_finale


    //SCELTE CONDIZIONALI//
    + (allestimento4) {notABigSecretPartTwoStorylet.allestimento && new_this_loop(->allestimento4)} Ettore: Zeca, ho una domanda sul buffet e su chi se ne è occupato.
        Zeca: Ecco che torna a fare domande.
        Ettore: Ok, niente domande allora.
        Ettore: Elia prima mi ha detto che tu e Matteo vi siete occupati del cibo e delle sigarette di Paola.
        Zeca: Sai che anche se non ci metti un punto interrogativo, questa è una domanda?
        Zeca: PERO'. PERO'.
        Zeca: Continuo a non capire questa fissa per il buffet.
        Ettore: Mi annoio, può andare?
        Zeca: Povera stellina, povera.
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
        Zeca: Comunque sì, Matteo ed io ci siamo occupati di tabacco e cibo, ma non abbiamo preparato noi il buffet.
        Zeca: Né io né Matteo abbiamo messo piede nella stanza gialla prima delle prove.
        - (allestimento) Zeca: Abbiamo lasciato le cose fuori dalla porta e chiesto a Greta di occuparsene, perché c'erano dei problemi coi costumi.
        Zeca: O per dirla diversamente: Greta si deve essere scofanata un cavallo dalle ultime prove, perché ora non ci entra più in quel vestito.
        Zeca: Hai altre domande, Sherlock?
                + + {elia_talking_second_tier.allestimento}Ettore: Sì; mi sembra buffo quel che dici, perché Elia giura di averti lasciato il vino, perché lui e Greta avevano un problema coi tavoli.
                    Zeca: <i>Buffo>/i> che tu non sappia farti un giro di cazzi tuoi, Ettore.
                    Zeca: Vero, Elia mi ha chiesto di farlo, ma io non gli ho mai detto di sì.
                        -> advance_time ->
                                                {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
                    Zeca: Ma visto che sono una signora ci ho pure provato qualche minuto dopo a portare un paio di bottiglie.
                    Zeca: E magari ad aprirmene una.
                    Zeca: PERO'. PERO'.
                    Zeca: La sala gialla, dove dovevamo fare il buffet, era serrata.
                    Zeca: E qualcuno dentro ansimava come se avesse fatto le scale di corsa, molto di corsa.
                    Zeca: E per scale, intendo tutta una squadra di calcio.
                    - (allestimento2) Zeca: Forse era Paola col suo vibratore a saltellare sul tavolo del buffet. Una elder millenial sicuro che ne ha sempre uno con sé.
                    Zeca: Anche se non ho sentito il solito puzzo di cesso delle sue sigarette elettroniche.
                     -> advance_time ->
                        -> zeca_talking_second_tier
                
                + + {paola_talking_second_tier.allestimento} Ettore: Paola dice di aver sentito litigare te e Matteo nella stanza gialla.
                    Ettore: Ma prima hai detto di non essere mai entrato nella stanza gialla prima delle prove.
                    Zeca: Oh va bene, mi hai colto in flagrante.
                    Zeca: Tira fuori le manette e sculacciami perché sono un bimbo cattivo.
                    Zeca: Ho mentito.
                    Zeca: PERO'. PERO'.
                    Zeca: Non ti sei chiesto il perché, Sherlock?
                    Zeca: È perché non sono cazzi tuoi.
                        -> advance_time ->
                                                {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
 
            }
                    Zeca: Gli amici litigano.
                    Zeca: Gli amici fanno la pace.
                    Zeca: Gli sconosciuti litigano.
                    Zeca: Gli sconosciuti NON fanno la pace.
                    Zeca: Non so se ci siamo capiti.
                       + + + {matteo_talking_second_tier.allestimento} Ettore: Quando ho detto la stessa cosa a Matteo, è corso a cercarti.
                            Zeca: E ci siamo trovati, e ora va tutto bene.
                       + + +Ettore: Forte e chiaro.
                      
                    Zeca: Bene. Ora lasciami nel mio silenzio a odiare te e il resto del mondo, grazie.
                        -> advance_time ->       
                            -> zeca_talking_second_tier
                + + Ettore: Ehm, no, niente di utile, no.
                    Zeca: Come sempre, insomma.
                    -> advance_time ->
                        -> zeca_talking_second_tier
    

    + (love){zeca_talking_second_tier.omicidio && new_this_loop(->love)} Ettore: Zeca, prima hai detto che faresti di tutto per Elia.
        
        + + (love2){paola_talking_second_tier.money && new_this_loop(->love2)} Ettore: Secondo Paola, è perché i tuoi soldi provengono da Elia.
            Zeca: Al massimo è il contrario.
            Zeca: Prima della nostra collab Elia proponeva foto a sciampiste su Grindr.
            Zeca: Ora c'ha questo ammasso di fustacchiotti fissati con la barra e le proteine, che vanno in burnout se in vacanza non hanno la palestra vicino.
            Zeca: Le fotine giuste, e loro si sentiranno sempre brutti e verranno alla mia palestra, e continueranno a farsi fare foto da Elia.
            Ettore: Non è poco etico?
            Zeca: E cosa c'è di etico ormai a questo mondo?
                -> advance_time ->
                                        {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
            Zeca: Sei qui pagato da soldi che Paola guadagna sfrattando poveracci e chiudendo piccoli negozi a gestione familiare.
            Zeca: Il cibo del buffet viene dalla grande distribuzione, ovvero: ti sei mangiato un po' di sfruttamento.
            Zeca: E la storia scritta da Paola è un crimine contro la decenza.
            Zeca: Io alla fine spingo gente senza vita e senza obiettivi ad averne uno.
            Zeca: Dovrebbero farmi santa.
            Zeca: E piuttosto: invece di rompere le balle a me, c'è qualcun altro a cui Paola dovrebbe fare le pulci.
            Ettore: E chi? Greta?
            - (money) Zeca: No: Matteo è l'unico qui dentro che campa sulle spalle dei due fratelli.
                -> advance_time ->    
                    -> zeca_talking_second_tier
        + + (love3){trueLoveStorylet && new_this_loop(->love3)} Ettore: Come ti senti, ora che Elia ti ha dichiarato il suo amore?
            Zeca: E come lo sai?
            Zeca: Merda, quanto siete pettegole!
            Zeca: Ci scometto che è stato Matteo, quello sa ingoiare solo a letto, il maledetto.
            Zeca: PERO'. PERO'.
            Zeca: Sto bene.
            Zeca: Spaventato, ma bene.
            Ettore: Spaventato?
                -> advance_time ->
                                        {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
    
            }
            Zeca: Beh: a tutti fa piacere l'idea di avere un bellissimo labrador in casa.
            Zeca: Ma sei dello stesso avviso quando ti ha rotto il vaso di zia?
            Zeca: Quando ti ha cagato sulle coperte appena lavate?
            Zeca: Quando ha ringhiato contro il tuo date e ti tocca una notte senza cazzo?
            Zeca: Non ho mai avuto manco un criceto, e ho il timore di annoiarmi entro un paio di settimane.
            Zeca: Nel caso lo passo a quella disperata di Greta.
                -> advance_time ->
                    -> zeca_talking_second_tier

        + + (love4){elia_talking_second_tier.indagini2 && greta_talking_second_tier.indagini && not are_two_entities_together(Elia, Zeca)} Ettore: Sapevi che Paola vuole estromettere Elia dalla Londar?
            Zeca: Quindi lo sta per fare davvero? La stronza!
            Ettore: Ed Elia non l'ha presa bene. Se provo a parlargli della cosa, mette la musica a manetta e non mi ascolta.
            Zeca: Ok, ci penso io.
            Zeca: Povero stupido bimbo.
            Zeca: Povero.
            Zeca: Stupido.
            Zeca: Bimbo.       
                -> advance_time ->
                    -> zeca_talking_second_tier

    //SCELTE CONDIZIONALI OGGETTI//
    + (lettera) {inventoryContents has Lettera && new_this_loop(->lettera)} Ettore: Hai idea di chi sia questa lettera?
        Zeca: No, mai vista.
        + + {matteo_talking_second_tier.lettera2} Ettore: Eppure Matteo crede l'abbia scritta tu.
            Zeca: Se per questo Matteo crede pure di poter piacere a qualcuno.
            Zeca: E non è mai successo.
        + + ->
        - -
        Zeca: Comunque so chi potrebbe ricevere una lettera, presto a tardi.
        Ettore: E chi?
        Zeca: Tu, da parte di uno degli avvocati dei fratellini.
        Zeca: Se c'è una cosa che Paola odia, sono le domande indiscrete.
            -> advance_time ->
                    -> zeca_talking_second_tier
    + (torta) {inventoryContents has Torta && new_this_loop(->torta)} Ettore: Hai mai...
        Zeca: Visto questa torta?
        Zeca: Mangiato questa torta?
        Zeca: Leccato questa torta?
        Zeca: Desiderato carnalmente questa torta?
        Zeca: Desiderato di schiacchiarti la torta in faccia perché fai un sacco di domande?
        Zeca: E poi buttarti in un formicaio e farti divorare vivo?
        Zeca: Forse.
        Zeca: PERO'. PERO'.
        Zeca: No, non è vero.
        Zeca: QUALCUNO HA VISTO DELLE FORMICHE?!?!?
        -> advance_time ->
                    -> zeca_talking_second_tier
    + {inventoryContents has BottigliaDiVino && new_this_loop(->allestimento)} Ettore: Hai comprato tu questa bottiglia di vino?
       - (allestimento3) Zeca: Sì, la boccia l'abbiamo presa Matteo ed io.
        Zeca: Mmm, ora che ci penso, non esattamente.
        Ettore: In che senso?
        Zeca: Ufficialmente l'ha comprata Matteo, per quanto fossimo assieme.
        Zeca: PERO'. PERO'.
        Zeca: Anticipava i soldi di Elia, per cui in teoria l'ha comprata Elia.
        Zeca. PERO'. PERO'.
        Zeca: I soldi di Elia sono della Londar e quindi di fatto di Paola, per cui la risposta è:
        Zeca: Non l'ho comprata io. Sorry.
            -> advance_time ->
                    -> zeca_talking_second_tier
    + (asma) {inventoryContents has FlaconcinoAsma && new_this_loop(->asma)} Ettore: Hai mai visto questo flaconcino per l'asma?
        Zeca: Dio.
        Zeca: Se mai la vita dovesse portarmi a un tale entusiasmo per un flaconcino, uccidetemi.
                    -> zeca_talking_second_tier
    + (sigaretta) {inventoryContents has SigarettaElettronica && new_this_loop(->sigaretta)} Ettore: Sai di chi sia questa sigaretta elettronica?
        Zeca: Di Paola, è lei la tossica del gruppo.
        Zeca: No, quello sono io.
        Zeca: Ma è lei che fuma,
                    -> zeca_talking_second_tier
    
      
    + [Ti allontani]
    -> intro
    -
    
    -> zeca_talking_second_tier
    

= esplora_zeca
{debug: <i>Passo per esplora_zeca</i>}


{
- ZecaTalking > 1: Zeca: Ettore, che non c'hai di meglio da fare? Via, sciò, smamma!
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA ZECA

= first_qn
~ ZecaTalking++
    Zeca: Vuoi sapere una cosa buffa?
    Zeca: Certo che vuoi sapere una cosa buffa, sei un impiccione impagabile.
    Zeca: E ci scometto che ti piaccono pure le cose tristi.
    Zeca: E questa è buffa <b>e</b> triste.
    Zeca: Ho aperto una palestra perché non mi piaccio fisicamente.
    Zeca: Ma proprio perché non riesco a guardarmi allo specchio senza sentire disagio, se non rabbia.
    Zeca: Quando qualcuno a letto mi dice che gli piaccio, mi smonto, sono sicuro che stia mentendo.
    Zeca: Ho questa sensazione spaventosa.
        -> advance_time ->
                                {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
    Zeca: Di non essere davvero <i>questa</i> cosa, di non assomigliarmi per nulla.
    Zeca: E a volte mi ci avvicino quasi perfettamente al capire cosa non mi torna.
    Zeca: Ma un terrore indicibile mi scaglia all'indietro, lontano da ogni risposta.
    Zeca: Con la sola voglia di fare ancora più palestra.
    Zeca: Dire ancora più cattiverie.
    Zeca: E non sapere altro.
    Zeca: Perché ho questa amara certezza che se dovessi davvero vedere quella cosa, quella verità, perderei tutto.
    Zeca: E insieme, non potrei più far finta di essere me, ora, davvero me.
            -> advance_time ->   
            -> zeca_talking_second_tier 

= second_qn
 ~ ZecaTalking++
    Zeca: Qual è la cosa che detesti in una persona?
        + Ettore: L'ipocrisia.
            Zeca: Banale.
        + Ettore: La mancanza di coraggio.
            Zeca: Da motivational quote.
        + Ettore: "Ma allora il sette ottobre?!?!?"
            Zeca: Quella è red flag sicura
        -
    Zeca: A me c'è una cosa sola che uccide: la fiducia.
    Zeca: Non è per essere cinico, ma questo mondo non ti dà fiducia e non ne merita.
    Zeca: Ok, forse è da cinici.
    Zeca: Ma quando vedo uno che dice "Facciamo questo e le cose andranno meglio".
    Zeca: O: "Lo so, ha fatto un errore, ma dobbiamo dargli un'altra chance", a me viene l'orticaria.   
        -> advance_time ->
                                {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
    Zeca: E con l'orticaria la voglia di tirargli due sberle.
    Zeca: Di dirgli "Svegliati! Così non ci arrivi ai quaranta!"
    Zeca: E lo sai la cosa peggiore?
    Zeca: Che questi sopravvivono.
    Zeca: Saltellano inconsapevoli mentre tutto il mondo attorno esplode e non si rendono conto di niente.
    Zeca: "Non ti preoccupare, ora ci sono io". Ciccio, è quello che mi preoccupa!
    Zeca: Ora ci sei tu, ma se mi affido a te, come posso sopravvivere quando te ne andrai?
    Zeca: Per questo odio Matteo. E gli voglio bene. Ma lo odio tanto tanto tanto.
        -> advance_time ->
        -> zeca_talking_second_tier    

= third_qn
~ ZecaTalking++
    Zeca: Conosciamoci meglio.
    Zeca: Dio, perché mai vorrei farlo?!?
    Zeca: Conoscimi meglio!
    Zeca: Cosa vuoi sapere di me?
    Zeca: No dai, che poi ti innamori.
    Zeca: Ma invece, che ne pensi di Elia?
         -> advance_time ->
                                 {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        + Ettore: Mi sembra un idiota.
            Zeca: Eh sì, fa quella prima impressione.
            Zeca: E la seconda. E la terza.
        + Ettore: Mi sembra un ragazzo semplice.
            Zeca: L'eufemismo del secolo.
            Zeca: Un sasso è una cosa semplice. Elia è vuoto.
            Zeca: Se urli in un orecchio, ci senti l'eco che grida aiuto.
        + Ettore: Mi sembra impossibile che nessuno l'abbia ancora strozzato.
            Zeca: Oh, ma è già successo due volte.
            Zeca: Questa settimana.
            Zeca: Ed era il prete di famiglia.
        + Ettore: No no scusa non c'ho tempo per questa conversazione.
            Zeca: Cafone! Col cazzo che mi chiedi ancora qualcosa!
                ~ loopableVariables += pausaRapportoZeca
                -> intro
        -
    Zeca: E di Greta, che idea ti sei fatto?
        + Ettore: Una ragazza curiosa.
            Zeca: Curiosa?
            Zeca: Curiosa è la gazza che viene a rovistare nella spazzatura.
            Zeca: Curiosa è Alfonso Signorini.
            Zeca: Quella donna è una idrovora di informazioni.
            Zeca: Sa le cose prima ancora che ti accadano.
        + Ettore: Un concentrato di ansia.
            Zeca: PERO'. PERO'.
            Zeca: Secondo me fa un po' finta. Lo fa per sentirsi importante.
            Zeca: Perché chi se la incula a quella, detto tra noi?
            Zeca: Così invece prima o poi uno sfigato glielo chiede "tutto bene?".
            Zeca: E a quel punto quella si azzecca per i prossimi tre anni.
        + Ettore: Una specie di emblema millenial.
            Zeca: TOTALE!
            Zeca: Si lamenta sempre, si sente sempre al centro dell'attenzione, ed è sempre su Instagram.
            Zeca: Sfigata.
        -
            -> advance_time ->   
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
 
            }
        Zeca: E di Matteo, quanto lo detesti?
            + Ettore: In realtà mi piace molto.
                Zeca: COOOOOOOOOOOOOSA?
                Zeca: A quella?
                Zeca: A quella ti piace?!?
                Zeca: Ma se è così noisa?
                Zeca: Ma se parla solo che lavora troppo e che non c'ha un compagno.
                Zeca: E io vorrei dirgli: ma ti sei vista, sorella? Con quelle occhiaie ti ci fai la controfigura di Michael Myers, altro che il maritino.
                Zeca: Ma senti un po', ti piace.
                Zeca: Povera sfigata.
            + Ettore: No dai, è un tipo mediocre.
                Zeca: Uh, mi stupisci.
                Zeca: Pensavo l'avresti difeso o che.
                Zeca: Pensavo avresti detto che è una persona gentile e affettuosa.
                Zeca: Son contento che tu non abbia il paraocchi.
                Zeca: PERO'. PERO'. 
                Zeca: Gli voglio bene, sia chiaro!
                Zeca: Ma è così pesante.
                Zeca: Così pesante!
            + Ettore: Se ci prova ancora, urlo.
                Zeca: Anche con te?!?
                Zeca: Dio, quella è disperata!
                Zeca: Pensa che sta sempre in casa di Elia.
                Zeca: Per le pulizie, dice.
                Zeca: Certo, per pulirgli con la linga la banana.
                Zeca: Non so se mi sono spiegata.
                Zeca: Aspetta che ti faccio il gesto.
            -    
              -> advance_time ->
                                      {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Zeca: E Paola? che ne pensi di Paola?
            + Ettore: Non capisco perché tutti la detestino qui dentro.
                Zeca: Datti ancora un paio di prove e vedrai.
            + Ettore: Antipatica, ma non così tanto da ucciderla.
                Zeca: Mh, vedremo.
            + Ettore: Se cadesse dalle scale, insomma, non la fermerei.
                Zeca: E probabilmente l'avrei spinta io.
            -
        Zeca: E infine, cosa ne pensi di me? Sincero, zero complimenti.
             + Ettore: Che meno ti devo parlare meglio è.
                Zeca: Ah, è facile: non ti parlo più, così stai bene, stronzetta.
                    ~ loopableVariables += pausaRapportoZeca
                -> advance_time ->
                -> intro
            + Ettore: Sei acidello, ma divertente.
                Zeca: Ho sentito di peggio, dai.
                Zeca: Mia madre a sedici anni mi ha portato dall'esorcista.
                Zeca: La meglio scopata della mia vita, ma è un altro capitolo.
            + Ettore: Fai il duro, ma nascondi un cuore tenero.
                Zeca: Così mi fai sciogliere!
                Zeca: Nel senso che mi fai sciogliere i maroni proprio.
                Zeca: Le palle colate sul pavimento!
            -
        -> advance_time ->
                                {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
  
            }
    Zeca: Bene, ora posso dirti cosa penso di te.
    Zeca: Non molto, a dire il vero, a parte che sei molto curioso.
    Zeca: Ma visto che non sei bruciato come noi, ti do un consiglio: stai lontano dai casini di questa famiglia.
    Zeca: Incluso me, incluso Matteo.
-> zeca_talking_second_tier



/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/
 
=== paola_is_dead_zeca
    
    Zeca: {~ Devo tirare su di morale Elia.|Non il momento migliore. Non. Il. Momento. Migliore.|Sinceramente: mi ha stupito ci sia voluto così tanto tempo perché qualcuno la uccidesse.|Era così odiosa che pensavo fosse immortale, come un'erbaccia o un demone.}

-> advance_time ->
->->

