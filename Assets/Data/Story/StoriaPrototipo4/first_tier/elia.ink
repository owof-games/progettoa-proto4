=== cb_first_tier_elia ===
{debug: <i>passo per first_tier_elia</i>}
+ {are_two_entities_together(Elia, Ettore) && !peopleTalking} [character:Elia]
    {debug: <i>Ho scelto di parlare con Elia</i>}
    -> elia_acting ->
    
+ {are_two_entities_together(Elia, Ettore) && peopleTalking} [character:Elia]
    -> elia_talking -> 
    
-

-> intro

/* ---------------------------------
Opzioni di dialogo con il personaggio Elia
 ----------------------------------*/


=== elia_acting
    {debug: <i>Passo per elia_acting</i>}
    //INTERAZIONI GENERALI//
    + [Prova ad avere una conversazione con Elia] -> esplora_elia_personaggia
    + Ettore: Sai chi potrebbe avere ucciso Paola?
        Elia: Nessuno.
        Elia: Paola era perfetta, impeccabile.
        Elia: Quindi direi che è stato un suicidio.
        Ettore: Ma ci sono dei colpi d'arma nel petto, come avrebbe potuto suicidarsi?
        Elia: E infatti è impossibile, perché il suicidio è contro Dio.
        Elia: E Paola non va contro Dio. E quindi:
        Elia: Paola non è morta.
        Elia: Il caso è chiuso.
    //SCELTE CONDIZIONALI//
    + (senzatetto){greta_acting.missioneGreta && new_this_loop(->senzatetto) && not are_two_entities_together(Greta, Elia)} Ettore: Sai Elia, Greta vorrebbe parlare con te.
        Elia: Così può uccidere anche me?
        Ettore: In che senso?
        Elia: Chi altri avrebbe potuto uccidere Paola?
        Elia: Paola voleva rilevare il pub per trasformarlo in un rifugio per senzatetto.
        Elia: E Greta ha detto cose terribili e ripetuto che avrebbe fatto di tutto per fermarla.
        Elia: Di tutto.
        Elia: Per cui se sei un suo semplice, vattene!
        Ettore: Semplice?
        Elia: Hai capito. Via!
        -> advance_time ->
        // route "lo mandi nella stanza di Greta con una trappola"
        
        // route "lo mandi da Greta proponendo uno scambio"
    +  (uniti){weddingAtThePubStorylet && new_this_loop(->senzatetto) && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Greta, Elia)} Ettore: Ho una proposta da farti: io faccio una cosa per te, e tu vai da Greta. Che ne dici?
        Elia: Qualcosa a che fare con la mia micia?
        Elia: Perché ormai non credo più a nessuno che vuole toccare la mia micia.
        {!elia_acting.third_qn: Ettore: Ehm, no. Manco sapevo avessi una micia.}
        {elia_acting.third_qn: Ettore: No, non c'entra Sonia.}
        Ettore: So che tu e Matteo avete litigato, per via del matrimonio.
        Ettore: Tu vuoi che festeggiamo al pub, lui non ne vuole sapere. Se lo convinco, andrai da Greta?
        Elia: Quindi vuoi davvero che io muoia? Va bene.
        Elia: Se ci riesci, parlerò con quella arpia.
        Elia: Ma magari aiutami a proteggermi!
        -> advance_time ->   
    
    + {seen_in_this_loop(->senzatetto) && !hardTrueFeelingsStorylet && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Greta, Elia) && (not loopableVariables == EliaRaggiungeGreta)} Ettore: Sto ancora cercando il modo di convincere Matteo, ma ce la farò!
        Elia: Non ho fretta di morire, tranquillo!

    + (missioneGreta){hardTrueFeelingsStorylet && not are_two_entities_together(Greta, Elia) && seen_in_this_loop(->senzatetto) && not loopableVariables == EliaRaggiungeGreta} Ettore: Ho convinto Matteo!
        Ettore: Faremo la cerimonia da voi, al pub.
        Ettore: In fondo cosa c'è di più romantico di un esercito di comici ubriachi e incapaci?
        Ettore: Quindi, ora parlerai con Greta?
        Elia: Mi dai qualcosa per difendermi da lei?
        {
            - inventoryContents has Lettera: Ettore: Puoi provare a minacciarla?
                ~ inventoryContents -= Lettera
                ~ objectStorageContents += Lettera
            - inventoryContents has AnticoPugnale: Ettore: Con questo puoi richiamare i Grandi Antichi!
                ~ inventoryContents -= AnticoPugnale
                ~ objectStorageContents += AnticoPugnale
            - inventoryContents has LimettaUnghie: Ettore: Puoi grattarle i calli?
                ~ inventoryContents -= LimettaUnghie
                ~ objectStorageContents += LimettaUnghie
            - inventoryContents has Torta: Ettore: Puoi provarla a farle venire il diabete?
                ~ inventoryContents -= Torta
                ~ objectStorageContents += Torta
            - inventoryContents has BottigliaDiVino: Ettore: Che ne dici di farla ubriacare?
                ~ inventoryContents -= BottigliaDiVino
                ~ objectStorageContents += BottigliaDiVino
            - inventoryContents has FlaconcinoAsma: Ettore: Ehm, puoi fare qualcosa con un flaconcino?
                ~ inventoryContents -= FlaconcinoAsma
                ~ objectStorageContents += FlaconcinoAsma
            - inventoryContents has SigarettaElettronica: Ettore: Puoi sempre infastidirla col puzzo di questo coso?
                ~ inventoryContents -= SigarettaElettronica
                ~ objectStorageContents += SigarettaElettronica
            - else: Ettore: Ehm, il tuo smagliante sorriso?    
        }
        Elia: "Grazie. In qualche modo me la caverò."
        Elia: "Bene, vado, dove la trovo?"
            -> advance_time ->
            ~ move_entity_from_object_storage_to_Ettore_location(SpiedinoCocktail)
        + + {whiteRoomContents hasnt Ettore} Ettore: Ti aspetta nella stanza bianca.
                ~ move_entity(Elia, WhiteRoom)
                {
                - whiteRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
        + + {greenRoomContents hasnt Ettore} Ettore: La trovi nella stanza verde.
                ~ move_entity(Elia, GreenRoom)
                {
                - greenRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
        + + {yellowRoomContents hasnt Ettore} Ettore: Sta cazzeggiando nella stanza gialla.              
                ~ move_entity(Elia, YellowRoom)
                {
                - yellowRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
        + + {redRoomContents hasnt Ettore} Ettore: Nella stanza rossa.             
                ~ move_entity(Elia, RedRoom)
                {
                - redRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }      
                
   
    + (sincero) {hardTrueFeelingsStorylet  && not are_two_entities_together(Greta, Elia) && not loopableVariables == EliaRaggiungeGreta} Ettore: Matteo mi ha detto di lui e di Greta.
            Elia: Merda, mi spiace. Per questo volevo fare il matrimonio al pub.
            Elia: Sapevo da tempo che Matteo provava qualcosa per Greta, ma non sapevo come dirtelo!
            Elia: Andrò da Greta, te lo devo.
            Ettore: Sei un amico.
            Elia: Dove la trovo?
            -> advance_time ->
            ~ move_entity_from_object_storage_to_Ettore_location(SpiedinoCocktail)
            + + {whiteRoomContents hasnt Ettore} Ettore: Ti aspetta nella stanza bianca.
                ~ move_entity(Elia, WhiteRoom)
                {
                - whiteRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
            + + {greenRoomContents hasnt Ettore} Ettore: La trovi nella stanza verde.
                ~ move_entity(Elia, GreenRoom)
                {
                - greenRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
            + + {yellowRoomContents hasnt Ettore} Ettore: Sta cazzeggiando nella stanza gialla.              
                ~ move_entity(Elia, YellowRoom)
                {
                - yellowRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
            + + {redRoomContents hasnt Ettore} Ettore: Nella stanza rossa.             
                ~ move_entity(Elia, RedRoom)
                {
                - redRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }      
                
                
    
        -          
        
    //SCELTE CONDIZIONALI OGGETTI//
     + (pugnaleMatteo){inventoryContents has AnticoPugnale} Ettore: Ehi Elia, hai mai visto questo pugnale?
            Elia: Sì!
            Elia: Matteo era disperato, l'aveva perso da settimane!
            {
            - are_two_entities_together(Matteo, Elia): Matteo: E ora me lo riprendo. Grazie amore mio!
                ~ inventoryContents -= AnticoPugnale
                ~ objectStorageContents += AnticoPugnale
            }
            Elia: Una volta mi ha detto che avrebbe risvegliato un antico demone, col sangue giusto.
            {are_two_entities_together(Matteo, Elia): Matteo: Era solo una battuta, Elia!}
            Elia: E una sera mi ha punto con quel coltello tutto contento ed ero terrorizzato.
            {are_two_entities_together(Matteo, Elia): Matteo: Avevi sei anni ed era l'unico modo per farti un test rapido del sangue.}
            Elia: E nessuno sa come ne sia venuto in possesso, manco lui.
            {are_two_entities_together(Matteo, Elia): Matteo: Questo è vero, me lo sono ritrovato in casa una volta e boh. l'ho preso come un segno del destino.}
            Elia: Paola dice che è un santanista e per questo finirà all'inferno.
            {are_two_entities_together(Matteo, Elia): Matteo: All'inferno ci finirò ascoltando queste cazzate.}
            -> advance_time ->
    
    + {inventoryContents has SpiedinoCocktail} Ettore: Elia, ti è caduta quest'arma dalla tasca!
        Elia: Non ho mai visto questa roba, mai.
        {elia_acting.first_qn: Ettore: Ma ci sono le iniziali del tuo locale, vedi?}
        Elia: Lasciami in pace!
        + + (paolaSiSposa) Ettore: Sarebbe perfetto per uccidere qualcuno!
            Elia: No, una cosa perfetta per uccidere qualcuno è la morte!
            Elia: L'ho portato a Paola per vedere se va bene per il matrimonio.
            {!hardTrueFeelingsStorylet.matteoGreta: Ettore: Il matrimonio mio e di Matteo?}
            {hardTrueFeelingsStorylet.matteoGreta: Ettore: Il non più matrimonio mio e di Matteo?}
            Elia: No, il suo. Paola si sposa.
            Elia: Ha organizzato un matrimonio in fretta e furia, manco sappiamo con chi.
            -> advance_time ->
        - -
    + (minacce){inventoryContents has Lettera} Ettore: Elia, tu sai chi possa aver scritto questa lettera?
            Elia: Ehm, cosa, ehm.
            Elia: Cosa c'è scritto?
            Ettore: Hai dimenticato gli occhiali?
            Elia: Sì sì, gli occhiali. Esatto.
            Ettore: <i>So cosa hai fatto e la pagherai!</i>, ma non c'è il nome.
            Elia: Sembra una roba da Matteo. Quando è pissato è capace di dire qualunque cosa.
            Elia: Una volta da piccoli mi ha fatto mangiare le crocchette del gatto.
            Elia: E solo perché era convinto che fossero avvelenate.
            -> advance_time ->
    + {inventoryContents has LimettaUnghie} Ettore: Sai di chi è questa limetta per le unghie?
            Elia: Zeca?
            è plausibile che in realtà limetta non sarà mai in lista
    + {inventoryContents has Torta} Ettore: Sai chi potrebbe aver portato la torta?
            Elia: Il fornaio?
            Ettore: Intendi il catering?
            Elia: No no, il fornaio.
            Elia: Matteo dice sempre che sta aspettando qualcuno per la farina.
            Elia: E la farina la usa il fornaio.
            Elia: E i dolci son del fornaio, no?
            Elia: E Paola che dice che non capisco nulla.
            -> advance_time ->
    + {inventoryContents has BottigliaDiVino} Ettore: Hai mai visto questa bottiglia di.
            Elia: No non bevo grazie.
            Ettore: No, ti chiedevo se avessi mai
            Elia: Non insistere, no.
            Elia: Non voglio fare la fine di Zeca.
            Ettore: Elia: vorrei solo sapere chi
            Elia: Guarda che è maleducato insistere quando
            Ettore: CHI HA PORTATO QUESTA BOTTIGLIA?!?
            Elia: Paola. Credo sia della collezione di Paola.
            Elia: E guarda che non serve urlare!
            -> advance_time ->
    + {inventoryContents has FlaconcinoAsma} Ettore: Sei tu a soffrire d'asma?
            Elia: È quella cosa che ti viene quando hai paura di tutto?
            Ettore: Intedi l'ansia? Che non è proprio così comunque.
            Elia: È quella cosa che hanno le camicie?
            Ettore: Quella è l'asola.
            Elia: Uh, forse in garage ne ho una.
            Ettore: Di asola? O di asma?
            Elia: No, di quelle per saltare.
            Ettore: Quella è, oh, lascia fare.
            -> advance_time ->
    + {inventoryContents has SigarettaElettronica} Ettore: Sai di chi sia questa sigaretta elettronica?
            Elia: Non dovrebbe essere "a liquidi?"
            Elia: Che poi Greta mi dice sempre di tenere lontane le cose elettroniche dall'acqua.
            Elia: Quindi perché qualcuno dovrebbe mettere assieme le due cose, e persino in bocca?
            Elia: Non mi sembra una cosa intelligente, no.
            Elia: Però una volta ho fumato della noce moscata, ma non è successo nulla.
            Ettore: Quindi non sai di chi sia?
            Elia: No, non posso saperlo, non ora. Non so se mi capisci.
            Ettore: No Elia, non ti capisco.
            Elia: Nessuno mi capisce, è sempre stato così.
            -> advance_time ->
    
      
    + [Allontanati]
        -> intro
    -
->->

= esplora_elia_personaggia
{debug: <i>Passo per esplora_elia</i>}

{
- EliaActing > 1: Elia: Scusa Ettore ma devo segnarmi una battuta bellissima ora.
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    }
}


= first_qn
~ EliaActing++
    + Ettore: Come sta andando con il pub?
    Elia: Il <i>Funny Elia & Greta</i>? Benissimo! L'altro sabato abbiamo avuto addirittura tre comici di fila.
    Elia: Anche se uno era così ubriaco che si è addormentato durante il suo sketch.
    Elia: Ma è stato anche il momento in cui il pubblico ha riso di più.
    Elia: E ora sto cercando di convincere Greta a portare dei cani sul palco.
    Elia: Ma lei dice che ne abbiamo già abbasta sufficienza.
    Elia: Cosa che non ha senso perché l'unico cane che può entrare è Grisù, il labrador della signora cieca del terzo piano.
    Elia: Ma Greta dice che non importa che io capisca, fintanto che faccio buoni cocktail.
    Elia: E stia lontano dalla cassa.
    Elia: E dalla lista degli ospiti.
    Elia: E dalle decisioni per il locale.
    Elia: E dalla commercialista.
    -> advance_time ->
    
    -
-> elia_acting 

= second_qn
 ~ EliaActing++
    Elia: Posso farti una domanda, Ettore?
    Elia: Cosa ci trovi in mio fratello?
        + Ettore: Mi fa sentire al sicuro.
        + Ettore: Mi fa sentire desiderato.
        + Ettore: A volte me lo chiedo anche io.
        -
    Elia: Sai, Paola diceva che stavi con lui solo per i soldi.
    Elia: E io ripetevo che non aveva senso, perché i soldi sono dei nonni, non suoi.
    Ettore: In che senso?
    Elia: Beh, l'azienda è dei nonni. Ma sono sicuro che stia facendo un grande lavoro.
    Elia: Anche se poi si è rifiutato più volte di assumermi.
    Elia: Anni fa, quando nonno ha insistito, mi ha messo a distribuire pacchi e comunicazioni.
    Elia: Ma mi ha licenziato quando, vestito da Babbo Natale, gli ho portato in ufficio i carabinieri con un avviso di garanzia.
    Elia: Quando ho cantato "Merry Xmas" i carabinieri hanno dovuto staccarmelo di forza.
    -> advance_time ->
   
    -
-> elia_acting     

= third_qn
~ EliaActing++
    Elia: Non ci credo che se ne sia andata, non ci credo.
    Ettore: Le volevi molto bene?
    Elia: Sì, anche se la conoscevo da poco.
    Ettore: Non era tua sorella?
    Elia: La consideravo più una figlia. L'ho praticamente vista crescere.
    Ettore: Ma non era molto più grande di te?
    Elia: Nell'anima di sicuro. Ma non ti preoccupare: so per certo che la raggiungerò presto.
    Ettore: Elia: se hai bisogno di sfogarti sono qui, ma non fare gesti dati dalla disperazione.
    -> advance_time -> 
    Elia: No, non sono così disperato, alla fine starà via un paio d'ore.
    Ettore: Elia, guarda che è morta.
    Elia: Come, morta?
    Ettore: Non hai visto prima? Quando eravamo tutti assieme, che l'hanno pugnalata?
    Elia: No, no, no!
    Elia: Povera la mia cucciola, nooooo!
    Elia: Dov'è la mia micetta, dov'è?
    Ettore: Ma di chi stai parlando, Elia?
    Elia: Di Sonia, la mia certosina, la mia povera piccola angioletta.
    Ettore: Io, io. Niente. Lascia fare.
    -> advance_time ->    
    -    
-> elia_acting

/* ---------------------------------
Opzioni di dialogo con la persona Elia
 ----------------------------------*/

=== elia_talking
 {debug: <i>Passo per elia_talking</i>}
    -> resting_time ->
    //INFO GENERALI//
    + Fai domande sulla persona Elia -> esplora_elia

    //SCELTE CONDIZIONALI//
    

    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Torta} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai -> intro
    -
    
    -> elia_talking

= esplora_elia
{debug: <i>Passo per esplora_elia</i>}
-> resting_time ->

{
- EliaTalking > 1: Elia: "Non mi va di rispondere ad altre domande personali".
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SULLA PERSONA ELIA

= first_qn
~ EliaTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> elia_talking 

= second_qn
 ~ EliaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> elia_talking    

= third_qn
~ EliaTalking++
    Elia dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> elia_talking