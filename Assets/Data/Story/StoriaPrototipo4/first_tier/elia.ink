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
    //INFO GENERALI//
    + [Prova ad avere una conversazione con Elia] -> esplora_elia_personaggia
    
    //SCELTE CONDIZIONALI//
    + (senzatetto){greta_acting.missioneGreta && new_this_loop(->senzatetto) && not are_two_entities_together(Greta, Elia)} Elia, Greta vorrebbe parlare con te.
        Elia: Così può uccidere anche me?
        Ettore: In che senso?
        Elia: Paola voleva rilevare il pub per trasformarlo in un rifugio per senzatetto, e Greta ha detto cose terribili e ripetuto che avrebbe fatto di tutto per fermarla.
        Elia: Di tutto.
        Elia: Per cui, vattene.
        // route "lo mandi nella stanza di Greta con una trappola"
        
        // route "lo mandi da Greta proponendo uno scambio"
    +  (uniti){weddingAtThePubStorylet && new_this_loop(->senzatetto) && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Greta, Elia)} Ho una proposta. So che tu e Matteo avete litigato, per via del matrimonio.
            Ettore: Tu vuoi che festeggiamo al pub. Se lo convinco, andrai da Greta?
            Elia: Se ci riesci, parlerò con quella arpia.
            
    + {!new_this_loop(->senzatetto) && !hardTrueFeelingsStorylet && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Greta, Elia)} Ettore: "Sto ancora cercando il modo di convincere Matteo, ma ce la farò!"

    + (missioneGreta){hardTrueFeelingsStorylet && not are_two_entities_together(Greta, Elia)} Ettore: "Ho convinto Matteo, ora parlerai con Greta?"
            Elia: "Bene, vado, dove la trovo?"
            ~ move_entity_from_object_storage_to_Ettore_location(SpiedinoCocktail)
        + + {whiteRoomContents hasnt Ettore} Ettore: "Ti aspetta nella stanza bianca."
                ~ move_entity(Elia, WhiteRoom)
                {
                - whiteRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
        + + {greenRoomContents hasnt Ettore} Ettore: "Ti aspetta nella stanza verde."
                ~ move_entity(Elia, GreenRoom)
                {
                - greenRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
        + + {yellowRoomContents hasnt Ettore} Ettore: "Ti aspetta nella stanza gialla."                
                ~ move_entity(Elia, YellowRoom)
                {
                - yellowRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }
        + + {redRoomContents hasnt Ettore} Ettore: "Ti aspetta nella stanza rossa."                
                ~ move_entity(Elia, RedRoom)
                {
                - redRoomContents has Greta:
                ~ loopableVariables += EliaRaggiungeGreta
                }      
                
   
    + (sincero) {hardTrueFeelingsStorylet} Ettore: "Matteo mi ha detto di lui e di Greta."
            Elia: "Merda, mi spiace. Per questo volevo fare il matrimonio al pub."
            Elia: "Andrò lo stesso da Greta, te lo devo."
            Ettore: "Ti aspetta nella stanza bianca."
            ~ move_entity_from_object_storage_to_Ettore_location(SpiedinoCocktail)
            
                ~ move_entity(Elia, WhiteRoom)
                ~ loopableVariables += EliaRaggiungeGreta
                
                
    
        -          
        
    //SCELTE CONDIZIONALI OGGETTI//
     + (pugnaleMatteo){inventoryContents has AnticoPugnale} Guarda questo pugnale!
            Elia: "Matteo era disperato, l'aveva perso da settimane!"
            {
            - are_two_entities_together(Matteo, Elia): Matteo: "E ora me lo riprendo. Grazie amore mio!"
                ~ inventoryContents -= AnticoPugnale
                ~ objectStorageContents += AnticoPugnale
            }
     + {inventoryContents has SpiedinoCocktail} Elia, hai lasciato alle tue spalle questo oggetto.
        + + (paolaSiSposa)Sarebbe perfetto per uccidere qualcuno!
            Elia si incazza
            Elia: "L'ho portato a Paola per valutarlo per il matrimonio."
            Ettore: "Il matrimonio mio e di Matteo?"
            Elia: "No, il suo. Paola si sposa."
        + + Cosa volevi farci?
            Elia ci dice che non l'ha mia visto.
        - -
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Briciole} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
        -> intro
    -
->->

= esplora_elia_personaggia
{debug: <i>Passo per esplora_elia</i>}

{
- EliaActing > 1: Elia: Scusa Ettore ma devo segnarmi una battuta bellissima ora.
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
~ EliaActing++
    + Ettore: Come sta andando con il pub?
    Elia: Benissimo, sai? L'altro sabato abbiamo avuto addirittura tre comici di fila.
    Elia: Anche se uno era così ubriaco che si è addormentato durante il suo stesso show.
    Elia: Ma è stato anche il momento in cui il pubblico ha riso di più.
    Elia: E ora sto cercando di convincere Greta a portare dei cani sul palco.
    Elia: Ma lei dice che ne abbiamo già abbastanza.
    Elia: Cosa che non capisco perché l'unico cane che può entrare è Grisù, il cane della signora cieca del terzo piano.
    Elia: Ma Greta dice che non importa che io capisca, fintanto che faccio buoni cocktail.
    Elia: E stia lontano dalla cassa.
    Elia: E dalla lista degli ospiti.
    Elia: E dalle decisioni per il locale.
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
    + {inventoryContents has Briciole} Guarda questo cibo!
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
    -> advance_time ->
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