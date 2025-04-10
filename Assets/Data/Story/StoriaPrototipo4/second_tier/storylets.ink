=== second_tier_storylets

{loopableVariables has dontCheckStorylets:
    ->->
}

{

//SCENA INIZIALE
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && peopleTalking == false && (not reStartingDinnerStorylet):
    -> reStartingDinnerStorylet
    

    - pauseStorylet:
        // evita che tutti gli storylet dopo questo possano partire attaccati l'uno all'altro
        ->->

//STORYLET "NORMALI".
//Obiettivo: le conversazioni che sono direttamente con Ettore partono sempre, con la formula però "se c'è X non parlo.". Quelle invece tra personagge, che non riguardano noi, non possiamo skipparle.

        //Condizioni necessarie: no Paola vicina.
    - elia_talking_second_tier.indagini3 && are_three_entities_together(Elia, Ettore, Zeca) && (not are_two_entities_together(Elia, Paola)) && pauseStorylet == false && new_this_loop(-> liarCallLiarStorylet):
            -> liarCallLiarStorylet
        
        //Condizioni necessarie: no Greta vicina. Foto. Elia e Paola non vincolanti.
    - inventoryContents has Foto && are_two_entities_together(Zeca, Ettore) && new_this_loop(-> iLlKillThatBitchStorylet):
        -> iLlKillThatBitchStorylet
        
        //Condizioni necessarie: Ettore e Matteo soli. Paola non necessaria.
    - are_two_entities_together(Matteo, Ettore) && not new_this_loop (->trueLoveStorylet) && new_this_loop(->forMeHeIsStupidAFStorylet):
        -> forMeHeIsStupidAFStorylet
        
        //Condizioni necessarie: Matteo ed Ettore nella YellowRoom
    - are_entities_together_in(Matteo, Ettore, YellowRoom) && new_this_loop(->notABigSecretPartOneStorylet):
            -> notABigSecretPartOneStorylet
        
        //Condizioni necessarie: Matteo ed Elia nella YellowRoom
    - are_entities_together_in(Ettore, Elia, YellowRoom) && new_this_loop(->notABigSecretPartTwoStorylet):
            -> notABigSecretPartTwoStorylet    

//CONVERSAZIONI ORIGLIATE

        //Sappiamo della prossima estromissione di Elia dalla Londar.
    - greta_talking_second_tier.indagini && (are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Ettore)) && is_this_entity_near_Ettore(Elia) && loopableVariables has EliaSpaventatoPerZeca && new_this_loop(-> whisperingSecretsStorylet):
            -> whisperingSecretsStorylet
    
        //Condizioni: Zeca ha scoperto di Greta ed Elia. No vincoli altri png.
    - iLlKillThatBitchStorylet && (are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Ettore)) && is_this_entity_near_Ettore(Elia) && new_this_loop(-> trueLoveStorylet):
        -> trueLoveStorylet
        
        //Condizioni: Matteo sa che Paola ha sentito litigare lui e Zeca.
    - matteo_talking_second_tier.allestimento && (are_two_entities_together(Matteo, Zeca) && not are_two_entities_together(Matteo, Ettore)) && is_this_entity_near_Ettore(Matteo) && new_this_loop(-> iTryToBeAGoodFriendStorylet):
        -> iTryToBeAGoodFriendStorylet
    
        //Condizioni: Greta ed Elia da soli.
    - (are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Ettore)) && is_this_entity_near_Ettore(Matteo) && new_this_loop(-> liesAndPromisesStorylet):
        -> liesAndPromisesStorylet
    


// MORTE DI PAOLA
    - currentTime >= 600:
    -> paolaIsDeadStorylet    

- else: ->->


}



/* ---------------------------------

   Storylets

 ----------------------------------*/
 
 
//SCENA INIZIALE
=== reStartingDinnerStorylet
    {debug: <i>Passo per startingDinnerStorylet</i>}
        Matteo: No, ma ti giuro Paola, ti giuro! Faceva tutto lo sborone quello.
            -> advance_time ->
        Matteo: Poi ho chiamato nonno e: bang!
        Matteo: <joy>Tutto il consiglio di amministrazione muto.</joy>
        Matteo: E il progetto per la piscina sul tetto del grattacielo è passato.
        Greta: Un giorno annegherete tutti, e sarà festa nazionale.
        Paola: <cry>Nnn</cry>
        Elia: Quindi è permesso augurare la morte a qualcuno? Perché avrei un po' di nomi, nel caso.
        Zeca: Elia, almeno tu mantieni la tua innocenza o perderei l'unica spinta a sacrificarti.
            + Ettore: Eccomi! In tutto il mio splendore!
            + Ettore: Cosa diavolo è successo?!?
            + Ettore: Interessante: chi devo spingere dal grattacielo?
            -
            -> advance_time ->
        Matteo: <joy>Amore!</joy> Non ti avevo sentito proprio arrivare!
        Matteo: Fratelli, sorella, Greta.
        Greta: Fottiti.
        Matteo: Vi presento l'uomo che amo: Ettore. Ettore, loro sono i miei familiari.
            + Ettore: Finalmente incontro il famoso Elia!
                Elia: Famoso? Sono finito su Tik Tok?
                Greta: No, nel Guinness dei Primati come primo essere umano senza cervello.
            + Ettore: Tu devi essere Paola! Matteo parla un sacco di te!
                Paola: Non voglio morire non voglio morire non voglio morire non voglio.
                Matteo: Non ti parlo così tanto di lei. A parte a pranzo, cena, letto e durante le preghiere.
            + Ettore: [Perché state facendo finta di nulla?!?.]<cry>Perché state facendo finta di nulla?!?</cry>
                Greta: Bene Matteo, finalmente ci presenti qualcuno di interessante!
                Zeca: E almeno abbiamo qualcosa in comune.
            -
            -> advance_time ->
        Paola: <cry>Non</cry>
        Elia: Sapete che nemmeno oggi ho aperto la porta dal lato giusto?
        Elia: Sono tutto un livido, guardate!
        Greta: Questo è un buon motivo per festeggiare in effetti.
        Matteo: Nessuno ha detto che dobbiamo festeggiare.
        Matteo: Però brindiamo! Perché siamo qui ad affrontare l'alcolismo di Zeca, e farlo smettere di bere.
            + Ettore: E avete pensato di partire con un brindisi?
                Zeca: Ettore, giusto? Ecco, Ettore: non farti domande su questa famiglia, o c'è da perdere il senno.
            + Ettore: Ehm, e io che c'entro?
                Matteo: Tu sei il testimone speciale, vedrai!
            + Ettore: Sono ubriaco? Era tutta una allucinazione?
            -
            -> advance_time ->
            
        Paola: <cry>Non voglio</cry>
             ~ move_this_entity_in_a_different_room(Paola)
        Greta: Ho scordato una cosa!
            ~ move_this_entity_in_a_different_room(Greta)
        Matteo: A questo punto faccio una chiamata.
            ~ move_this_entity_in_a_different_room(Matteo)
        Zeca: E io ne approfitto per scappare.
            ~ move_this_entity_in_a_different_room(Zeca)
        Elia: Beh, a questo punto me ne vado anche io!    
            ~ move_this_entity_in_a_different_room(Matteo)
            + Ettore: Bella festa, davvero. Grazie.
            + Ettore: RAGA, MA NON POTETE FARE FINTA DI NULLA!
            + Ettore: Ma non è che c'è dell'altro vino in giro?
            -
            -> advance_time ->
            
            - (restart)
            ~ move_entity(Elia,WhiteRoom)
        Elia: Siamo tutti colpevoli...
            ~ change_status(Elia, EliaUnalived)
            ~ move_entity(Zeca,WhiteRoom)
        Zeca: ... condannati alla ripetizione.
            ~ change_status(Zeca, ZecaUnalived)
            ~ move_entity(Matteo,WhiteRoom)
        Matteo: Ripetendo nel possesso...
            ~ change_status(Matteo, MatteoUnalived)
            ~ move_entity(Greta,WhiteRoom)
        Zeca: <cry>Vendetta!</cry>
        Greta: ... la nostra eterna dannazione.
            ~ change_status(Greta, GretaUnalived)
            ~ move_entity(Paola,WhiteRoom)
            ~ change_status(Paola, PaolaUnalived)

            -> advance_time ->

            + (tuttiMorti) Ettore: Perché vi comportate così?!?!
            -
        Paola: <fear>NON VOGLIO MORIRE!</fear>
            -> advance_time ->
            ~ change_status(Greta, GretaLive)
        Greta: <cry>BASTAAAAAAA! Questo script è tremendo!</cry>
            ~ change_status(Zeca, ZecaLive)
        Paola: <fear>Tremendo.</fear>
            ~ change_status(Elia, EliaLive)
        Elia: Basta, basta, basta. Prendiamoci dieci minuti di riposo.
            ~ change_status(Matteo, MatteoLive)
        Paola: <hesitate>Riposo.
            ~ change_status(Paola, EliaLive)
            ~ peopleTalking = true
            -> advance_time ->
    -> intro



//STORYLET "NORMALI"

=== liarCallLiarStorylet
~ inConversazione += Zeca
~ inConversazione += Elia
        Zeca: Devi smetterla di fidarti di lei, Elia.
        Zeca: Lo dico per il tuo bene.
                + {liarCallLiarStorylet > 1} [Ti allontani.] 
                ~ pauseStorylet = true
                -> intro
                + {liarCallLiarStorylet > 1} [Resti.]
                + ->
                -
        Elia: Ma è mia sorella.
        Elia: Sono sicuro che ci sia una spiegazione.
        Elia: Greta può aiutarmi.
        Zeca: Quella, certo.
        Zeca: Elia, li hai letti i giornali?
        Elia: I cosa?
            -> advance_time ->
            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
            - (indagini) Zeca: La polizia ha avuto accesso a dati personali di Paola. Dati che solo la sua segretaria potrebbe avere.
        {are_two_entities_together(Zeca,Greta): Greta: Zeca, non sai di cosa stai parlando e stai confondendo il povero Elia.}
        {are_two_entities_together(Zeca,Greta): Zeca: Zitta, stronza.}      
        Zeca: PERO'. PERO'.
        Zeca: A te non ha detto nulla la tua amica, vero?
        Zeca: E non ha fatto un passo che uno per aiutarti quando Paola ha iniziato a mettere in giro voci per incolparti.
        {are_two_entities_together(Zeca,Matteo): Matteo: Greta non farebbe male a una mosca.}
        {are_two_entities_together(Zeca,Matteo): Zeca: È arrivata Pollyanna.}
        Elia: Cosa sono i giornali?
        Zeca: <joy>Elia: tu hai solo me.</joy>
        Zeca: Gli altri se ne approfitteranno sempre della tua innocenza.
        Zeca: Sono l'unica cosa che ti rimane.
            + Ettore: Cringe.
                Zeca: <rage>Fottiti. E non osare più parlarmi.</rage>
                ~ loopableVariables += pausaRapportoZeca
            + Ettore: Romantico.
                Zeca: Si tratta di lavoro, solo di lavoro.
            -
            -> advance_time ->  
            ~ pauseStorylet = true
            -> intro


=== iLlKillThatBitchStorylet
~ inConversazione += Zeca
        Zeca: <cry>DAMMI SUBITO QUELLA FOTO!</cry>
            ~ inventoryContents -= Foto
            ~ objectStorageContents += Foto
        Zeca: <cry>QUELLA GRANDISSIMA STRONZA!<cry>
                + {iLlKillThatBitchStorylet > 1} [Ti allontani.] 
                ~ pauseStorylet = true
                -> intro
                + {iLlKillThatBitchStorylet > 1} [Resti.]
                + ->
                -        
        {are_two_entities_together(Zeca, Greta):Zeca: <rage>Ti uccido Greta, io ti uccido!</rage>|Zeca: <rage>La uccido Greta, io la uccido!</rage>}
        {are_two_entities_together(Zeca, Elia): Zeca: E tu, Elia. tu!|Zeca: E lui. Lui. Lui.}
        Zeca: Io. Io.
        Zeca: Solo.
        Zeca: <fear>Sono solo.</fear>
        {are_two_entities_together(Zeca, Paola): Zeca: E ovviamente tu sapevi tutto, Paola, vero?}
        {are_two_entities_together(Zeca, Paola): Paola: Sì. Ma questa cosa ha stupito anche me.}
        {are_two_entities_together(Zeca, Paola): Paola: Ho sempre pensato che Elia avesse più buongusto.}
        {are_two_entities_together(Zeca, Greta): Greta: Zeca, la stai facendo più grossa del dovuto. Non siete solo colleghi?}
        {are_two_entities_together(Zeca, Greta): Zeca: Io, io. Fanculo. Tu. Tu. Fanculo!}           
        Zeca: VATTENE TU ETTORE, AMEBA, ORA!        
        Zeca: <cry>Anzi no, me ne andrò io.</cry>
            -> advance_time -> 
            ~ move_this_entity_in_a_different_room(Zeca)
                 ~ pauseStorylet = true
    -> intro  


=== forMeHeIsStupidAFStorylet
~ inConversazione += Matteo
    Matteo: Non me lo sarei mai aspettato.
    Ettore: Cosa?
        {
            - are_two_entities_together(Matteo,Greta) or are_two_entities_together(Matteo, Elia) or are_two_entities_together(Matteo, Zeca): Matteo: Scusa, parlavo tra me e me.
                Matteo: C'è troppa gente qui, ora.
                Matteo: Ma se rimanessimo soli...
                ~ pauseStorylet = true
                -> intro
            - else:
                ->->
    
        }
    Matteo: Che Elia confessasse i suoi sentimenti a Zeca.
    Ettore: {trueLoveStorylet: Mi sembra una cosa tenera|Non ne sapevo nulla}.
    Matteo: Detto fra me e te: adoro Elia, ma è un coglione.
    Matteo: E sono sicuro che farà del male a Zeca.
    Matteo: Ma si dice che si impara al meglio dai nostri errori, no?
    Matteo: Mi chiedo chi altri soffrirà per tutto questo.
        
        + {greta_talking_second_tier.indagini3}Ettore: Greta. Greta è innamorata di Elia.
            -> advance_time ->
            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
            Matteo: Quindi lo sapevi anche tu?
            Ettore: {iTryToBeAGoodFriendStorylet: Prima stavi cercando di farlo capire a Zeca, vero?|Greta è stata molto diretta.}
            Matteo: {iTryToBeAGoodFriendStorylet: Sì. Ma poi ho tentennato, e ora me ne vergogno.|Interessante. So che lei è forte, ma magari vedo di tirarle su il morale.}
        
        + Ettore: Voglio rimanere ottimista. L'amore è amore.
            Matteo: E la cicuta è cicuta, e per questo ti uccide.
            Ettore: Non credi nell'amore?
            Matteo: Sì, ma non credo in Elia. Quel ragazzo è così confuso da scambiare il suo naso per una pinna.
            Matteo: E la sua amicizia per amore. Ma magari mi sbaglio.
        -
    Matteo: Se non è un problema, vorrei rimanere un poco da solo, Ettore.
        -> advance_time ->  
        ~ pauseStorylet = true
    -> intro


//CONVERSAZIONI ORIGLIATE

=== whisperingSecretsStorylet
~ inConversazione += Elia
~ inConversazione += Zeca
        Elia: Sono la ciotola, o sono il cane? 
        Zeca: Che stai dicendo? 
            + {whisperingSecretsStorylet> 1} [Ti allontani.] 
            ~ pauseStorylet = true
            -> intro
            + {whisperingSecretsStorylet> 1} [Resti.]
            + ->
            -         
        Elia: Paola, vuoi fare del male a Paola? 
        Zeca: Tutti i giorni, Elia. 
        Elia: E sono la ciotola o il cane? 
        Elia: Mi bevi, o mi coccoli? 
        Elia: Le fai del male per me? 
        Zeca: Perché dovrei farle del male per te? 
            -> advance_time ->   
        Elia: Dici sempre che fai di tutto per proteggermi. 
        Elia: Paola forse mi vuole fare male. 
        Elia: E tu che fai? 
        Zeca: Sei preoccupato? O speri che ti protegga? 
        Elia: <joy>Voglio essere il tuo cane.</joy> 
        Elia: <fear>Ma ho paura di essere solo la cotola.</fear> 
        Elia: <fear>Non bermi.</fear> 
            -> advance_time ->  
            ~ pauseStorylet = true
    -> intro


=== iTryToBeAGoodFriendStorylet
~ inConversazione += Matteo
~ inConversazione += Zeca
        Zeca: Te lo ripeto: non voglio più parlare con te.
        Matteo: Zeca, Paola vuole mettere zizzania tra noi, e per ques-
        Zeca: Per quello basti tu. 
            + {iTryToBeAGoodFriendStorylet> 1} [Ti allontani.] 
            ~ pauseStorylet = true
            -> intro
            + {iTryToBeAGoodFriendStorylet> 1} [Resti.]
            + ->
            -          
        Matteo: Ma perché non vuoi ascoltarmi? 
        Zeca: PERO'. PERO'. 
        Zeca: Come se fosse possibile farti stare zitto. 
        Matteo: Sto cercando solo di essere un buon amico. 
        Matteo: E di evitare che tu stia male. 
        Zeca: <rage>No, tu sei solo geloso, e per questo vuoi sabotare la mia relazione.</rage>
            -> advance_time ->   
        Zeca: So che ti è sempre piaciuto Elia, non serve un genio per vedere come lo guardi. 
        Matteo: Zeca, lo guardo come un bambino guarderebbe un gorilla allo zoo: incuriosito e spaventato. 
        Matteo: Ma no, non mi piace Elia. 
        Matteo: Ma soprattutto, è inaffidabile. Ti farà del male. 
        Zeca: Ma non hai le prove, è solo una sensazione, no? Una comoda sensazione. 
        Matteo: Io, insomma, ho visto ma non posso perché, no. 
        Matteo: Zeca, ti prego, fidati di me. 
        Zeca: Matteo: io mi fido di te. 
            -> advance_time ->   
        Zeca: Ma sono innamorato di quel coglione. 
        Zeca: E su questo, non posso farci niente. 
        Matteo: Ha una tipa. Si scopa una tipa. 
        Zeca: Gli farò dimenticare qualsiasi cretinetta. 
        Matteo: Non è qualsiasi cretinetta, Zeca. 
        Zeca: E io non sono qualsiasi Zeca. 
        Zeca: Dammi il nome della stronza. 
        Matteo: Non posso. Mi spiace, non posso. 
        Zeca: Allora lasciami in pace. Ora. 
            -> advance_time ->   
            ~ pauseStorylet = true
    -> intro




=== liesAndPromisesStorylet
~ inConversazione += Greta
~ inConversazione += Elia
    Greta: Dimmelo di nuovo, ti prego. 
    Elia: Era una cosa sbagliata? 
            + {liesAndPromisesStorylet> 1} [Ti allontani.]
            ~ pauseStorylet = true
            -> intro
            + {liesAndPromisesStorylet> 1} [Resti.]
            + ->
            -     
    Elia: Sbaglio tutto io, scusa. 
    Greta: No no no, ridimmela perché è un cosa bella. 
    - (promise)Elia:  Ti amo, Greta. 
    Greta: <joy>Ti amo anche io, Elia.</joy>
    Elia: <joy>Ora mi fai i grattini?</joy>
    Greta: Alza quella maglietta e ti faccio tutti i grattini del mondo. 
        -> advance_time ->  
        ~ pauseStorylet = true
    -> intro


=== trueLoveStorylet
~ inConversazione += Zeca
~ inConversazione += Elia
        Zeca: No, non ti dico come lo so.
        Zeca: Quindi, ti scopi quella?
            + {trueLoveStorylet> 1} [Ti allontani.] 
            ~ pauseStorylet = true
            -> intro
            + {trueLoveStorylet> 1} [Resti.]
            + ->
            -           
        Zeca: La ami?
        Elia: No. Ma sai come faccio.
        Elia: Mi fanno i grattini, vado su di giri e poi accadono cose.
        Zeca: Con me non è mai successo.
        Elia: Perché con te é diverso.
        Elia: <joy>Tu sei un mio fratello.</joy>
            -> advance_time ->
                            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
        Zeca: Proprio quello che sognavo. 
        Elia: Vuol dire che mi sogni? Perché io ti sogno. 
        Elia: Sogno che ti proteggo. 
        Elia: Sogno che ti schiaccio forte a me. 
        Elia: Sogno che mi fai i grattini e poi mi eccito. 
        Elia: Ma tu non mi fai mai i grattini. 
        Zeca: E se volessi essere l'unica persona che ti fa i grattini, Elia? 
            -> advance_time ->
                            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
        Zeca: Se volessi che nessun altro, e nessuna stronza orfanella in particolare, ti facesse i grattini, per te sarebbe ok? 
        Elia: <joy>Me ne fai due qui?</joy> 
        Elia: <joy>Mi dici che sono un bravo ragazzo?</joy> 
        Elia: E non mi prendi in giro quando ti dico che ti amo? 
        Zeca: Elia, perché dovrei prenderti in giro? 
        Elia: <fear>Perché tutti pensano che sono stupido.</fear>
        Elia: E quindi lo sono anche i miei sentimenti. 
        Elia: <joy>Ma io so cosa provo quando sono con te.</joy> 
        - (promise) Elia: Abbracciami. Te lo prometto Zeca: basta grattini con Greta o qualsiasi altra persona. 
            -> advance_time ->  
            ~ pauseStorylet = true
    -> intro    




//CONFESSIONI SOLITARIE 
=== notABigSecretPartOneStorylet
~ inConversazione += Matteo
        Matteo: Uh, ehi, ciao Ettore.
        Matteo: Mi hai colto di sorpresa.
            + {allestimento> 1} [Ti allontani.]
                ~ pauseStorylet = true
                -> intro
            + {allestimento> 1} [Resti.]
            + ->
            -           
        Ettore: Tutto ok?
        Matteo: Sì, sì. Stavo solo sistemando due cose.
        Matteo: Rimasugli del buffet di prima.
            -> advance_time -> 
                    ~ updateEntitiesLocations()
            {
                - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Matteo, Ettore, Greta): -> quickTalk
            }
        - (allestimento) Matteo: Certo: Greta ed Elia potevano recuperare pure del vino decente. E hanno lasciato in tutta la stanza il puzzo delle loro cose da scenografi.
        Matteo: Due cose dovevano fare: riparare le seggiole, allestire il buffet.
        Matteo: E hanno fatto un disastro in tutte e due le occasioni.
                ~ pauseStorylet = true
            -> intro



    = quickTalk
        Matteo: Ma ecco che arriva qualcuno a rompere le scatole, e la nostra conversazione finisce qui.
        ~ pauseStorylet = true
        -> intro


=== notABigSecretPartTwoStorylet
~ inConversazione += Elia
        Elia: Non le trovo!
        Ettore: Cosa?
            + {allestimento > 1} [Ti allontani.] 
                ~ pauseStorylet = true
                -> intro
            + {allestimento > 1} [Resti.]
            + ->
            -          
        Elia: Eh, se lo trovassi saprei cosa.
        Ettore: Ma stai cercando qualcosa, giusto?
        Elia: Esatto, ma non le trovo.
        Ettore: E cosa vorresti trovare?
        Elia: Se posso scegliere tutto, un pallone.
        Elia: Vorrei fare due tiri.
                    -> advance_time -> 
             ~ updateEntitiesLocations()
            {
                - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Elia, Ettore, Zeca):
                    -> quickTalk
            }
        Ettore: Quindi ora non stai trovando un pallone?
        Elia: No, quello l'ho in garage.
        Elia: Sono le barrette che non trovo.
        Elia: Le mie proteine.
        Elia: <fear>Senza mi spariscono i muscoli.</fear>
        Ettore: Non credo che funzionino così.
        Elia: No no giuro me l'ha detto il tizio del negozio.
        Elia: Se non le mangio ogni tre ore perderò tutti i muscoli.
                    -> advance_time -> 
            ~ updateEntitiesLocations()
            {
                - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Elia, Ettore, Zeca):
                    -> quickTalk
            }
        Elia: Maledizione.
            - (allestimento) 
        Elia: Zeca e Matteo sono andati a prendere il cibo, e non le hanno prese.
        Elia: Sono passati anche in farmacia e dal tabacchi per la sigaretta di Paola, e anche lì ci sono le mie barrette.
        Elia: Ma non le hanno prese!
        Elia: Ora perderò tutti i miei muscoli e sarò una persona normale, come te!
        Elia: Povero me!
        ~ pauseStorylet = true
            -> intro

    = quickTalk
        Elia: Ma non siamo da soli e non posso lamentarmi, no no.
        Elia: Lamentarsi è brutto.
        Elia: Gli uomini non si lamentano.
        Elia: Gli uomini soffrono.
            
        ~ pauseStorylet = true
            -> intro


//STORYLET A CUI ARRIVIAMO SOLO ATTRAVERSO UNA SCELTA
=== evilJobStorylet
~ inConversazione += Matteo
    Matteo: Vuoi davvero ascoltare una storia lunga e noiosa?
        + Ettore: Forse non ho tutto questo tempo, scusa.
            ~ pauseStorylet = true
            -> intro
        + Ettore: Ho tutto il tempo del mondo.
            -> uno

    = uno
        Matteo: Sono entrato in Londar tre anni fa, e ci sono entrato grazie a Elia.
        Matteo: Per i primi mesi ho fatto il responsabili in un call centre, per la parte di recupero crediti.
        Matteo: E ammetto che mi piaceva: buono stipendio, e le pressioni per lo più erano su chi rispondeva.
        Matteo: Poi Elia e Paola hanno iniziato a litigare, e molto.
        Matteo: E una mattina mi viene detto che per questioni di ristrutturazione, verrò demansionato.
            + Ettore: Merda, mi spiace un sacco!
            + Ettore: Quindi non eri più nelle grazie di Paola?
            -
            -> advance_time ->
                {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
        Matteo: Diciamo che è stata una doccia fredda.
        Matteo: All'inizio il problema principale era trovarmi allo stesso posto di gente che fino al giorno prima avevo, detta come va detta, trattato di merda.
        Matteo: E dato che il capoccia nuovo era lì per volere di Paola, e io ero il pupillo di Elia, beh: ha lasciato che accadesse di tutto.
        Matteo: Ma il peggio è venuto dopo, perché fintanto che ero in quel ruolo, non avevo realizzato cosa <i>davvero</i> stessimo facendo.
        Matteo: Dovevo chiamare decine di persone al giorno e sostanzialmente minacciarle in burocratese di pagare cose che avevano preso con soldi che non avevano.
        Matteo: E se quando ero il capetto ero convinto che fossero tutti dei coglioni sprovveduti, quando ho iniziato a parlare con loro ho realizzato che erano per lo più poveracci.
        Matteo: Persone anziane o migranti a cui hanno fatto firmare contratti che non potevano capire.
            -> advance_time ->
            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
        Matteo: Lavoratori pieni di certezze che si son visti chiudere fabbrica o ufficio dall'oggi al domani.
        Matteo: Ma, sempre più spesso, persone cacciate in un modo o nell'altro dalla loro casa.
            + Ettore: E tu ti sentivi impotente.
                Matteo: Sì. Totalmente impotente.
                Matteo: E pieno di vergogna per come li ho giudicati prima, e per come avevo trattato i miei colleghi in passato.
            + Ettore: Davvero non se lo meritavano?
                Matteo: Chi se lo meriterebbe, Ettore?
                Matteo: Metti anche che hanno preso cose inutili e costose per sentirsi fighe, non è il mondo in cui viviamo che ci spinge a farlo?
                Matteo: Se ci sentiamo invisibili, non è umano fare di tutto per farci notare, almeno un po'?
            -
        Matteo: Pian piano inizio però a mettere assieme i pezzi.
        Matteo: E mi rendo conto che molti dei debiti vengono da aree che i comuni stanno gentrificando attraverso la Londar.
            -> advance_time ->
            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
        Matteo: Il pattern è lo stesso: Londar inizia ad acquisire quanti più uffici dismessi e case in svendita in aree periferiche.
        Matteo: Poi informa i comuni che sono disponibili a fare qualcosa di vistoso come un nuovo spazio di coworking o un giardinetto, se il comune rende lo spazio più sicuro.
        Matteo: Partono sgomberi, retate, la polizia compare dove non si è mai vista.
        Matteo: E nel mentre la voce che il quartiere sta per fare il salto di qualità gira, e i proprietari di casa aumentano gli affitti o cacciano chi è in nero.
        Matteo: E queste persone si ritrovano in città che non sono pensate per loro, costose a dismisura, ingestibili per chi fa due se non tre lavori.
        Matteo: E io ero lì a pensare che fossero sfigati per i debiti per la macchina, quando la macchina per loro era vita, perché dovevano andare a lavoro non più dall'interno della città, ma da un paese sfigato a sessanta chilometri di distanza.
            -> advance_time ->
            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
        Matteo: Ho provato a cercare contatti col comune, ma nulla. Nulla di nulla.
        Matteo: E poi un giorno parlando con una collega, mi dice "Se non fossi così appesa a un filo con questo lavoro, mi rifiuterei di spremere alcuni di questi poveracci."
        Matteo: E lì mi son detto: se riesco a migliorare la condizione dei miei colleghi, allora forse possiamo più facilmente dire di "no" alle richieste dei capi, e magari chiudere un occhio su alcune situazioni.
        Matteo: Niente di rivoluzionario, ma un piccolo inizio.
            + Ettore: Credo sia davvero ammirevole!
            + Ettore: E i tuoi colleghi come hanno reagito?
            -
        Matteo: <joy>I miei colleghi si sono mostrati entusiasti.</joy> Avevano bisogno di credere in qualcosa di nuovo.
        Matteo: Ne hanno tutt'ora.
            -> advance_time ->
            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
        Matteo: Alla prima riunione, molti di loro hanno detto che è solo questione di tempo, prima di ritrovarsi dall'altra parte del telefono.
        Matteo: Ora siamo solo all'inizio, abbiamo avuto un contatto da Risorse Umane che è stato totalmente disumano, hanno praticamente cercato di farci il lavaggio del cervello.
        Matteo: E Paola, qui, non ha ancora messo assieme i pezzi, credo.
        Matteo: <rage> Ma quando mi affronterà, si troverà davanti un osso duro.</rage> 
        Matteo: Sono stanco di questo sistema, e farò di tutto perché almeno qualcosa di piccolo possa cambiare.
        Matteo: <fear>Pensi sia un illuso?</fear>
            + Ettore: No. E ti ammiro tantissimo, Matteo.
                Matteo: Na, niente ammirazione. Ma se servirà, aiutaci.
            + Ettore: Credo non cambierà nulla, ma è bello vederti provare.
                Matteo: Non cambierà nulla se non facciamo nulla, mai. no?
                Matteo: Ma sono sicuro che stavolta sarà diverso.
            -
          -> advance_time ->
          ~ pauseStorylet = true
            -> intro


//SCENA ARRINGA
=== arringa_finale
    ~ move_first_entity_to_second_entity_location(Paola, Ettore)
    ~ move_first_entity_to_second_entity_location(Greta, Ettore)
    ~ move_first_entity_to_second_entity_location(Elia, Ettore)
    ~ move_first_entity_to_second_entity_location(Matteo, Ettore)
    ~ move_first_entity_to_second_entity_location(Zeca, Ettore)
    
    ~ currentTime = 585

Paola: Quindi, cos'è tutta questa urgenza? Abbiamo delle prove da riprendere.
Elia: Hai trovato le mie barrette proteiche?
Ettore: <cry>Silenzio!</cry>
Ettore: Siamo nel bel mezzo di un crimine.
Zeca: Un crimine peggiore della sceneggiatura di Paola?
Ettore: <cry>Silenzio!</cry>
Ettore: Durante la serata ho parlato con tutti voi, molte molte molte volte.
Elia: Ma io non ricordo che-
Greta: <cry>Silenzio!</cry>
Ettore: Grazie, Greta.
Ettore: Parlando con voi ho notato un sacco di discrepanze, di bugie, di informazioni non chiare.
Ettore: E la prima cosa piccola piccola e strane, è che sembra che nessuno di voi si sia occupato di allestire il buffet nella sala gialla.
Zeca: Greta e-
Elia: Matteo e-
Ettore: <cry>Silenzio!!!</cry>
Ettore: Ognuno di voi aveva un motivo per mentire.
    + Ettore: Per nascondere un litigio.
        Elia: Chi ha litigato?
    + Ettore: Per coprire una scopata.
        Greta: Evviva la privacy.
    -
Ettore: Ma la stanza gialla è importante, perché é lì che ho trovato la lettera.
Ettore: Ed è la lettera che ci porta al colpevole.
Paola: Del crimine non avvenuto?
Elia: Delle barrette?
Ettore: Quindi, partiamo dall'allestimento.
Ettore: Avete lavorato a coppie, ma solo due persone si sono effettivamente occupate di sistemare tutto.
    + (GE) Ettore: Greta e Elia!
            Ettore: Tutte le strade portano a voi.
            Elia: Non a Roma?
    + (MZ) Ettore: Matteo e Zeca!
            Zeca: Mannaggia il c-
            Matteo: Lascialo parlare.
    + (indeciso) Ettore: Ma ancora non riesco a prendere una decisione. 
    -
Ettore: Ora, passiamo alla lettera.
Ettore: C'era la generale convinzione che fosse stata scritta da Paola.
Paola: Io non scrivo lettere, solo mail e messaggi.
Ettore: Ci ho messo un po' a capirlo, e a quel punto mi son detto: perché lasciare in giro una finta lettera di Paola?
Ettore: Forse per fare paura a qualcuno?
Ettore: Ed è qui che si complicano le cose.
    + {matteo_talking_second_tier.lettera2 or liarCallLiarStorylet.indagini} Ettore: Ma la cosa importante, è chi l'ha scritta. -> scritto
    + {phone.sindacato or greta_talking_second_tier.indagini2 or greta_talking_second_tier.indagini or greta_talking_second_tier.indagini3} Ettore: Ma la cosa importante, è a chi era indirizzata. -> indirizzo
    + Ettore: E ancora non ho le idee chiare. -> oggetto

= scritto
    + (ZC) {matteo_talking_second_tier.lettera2} Ettore: Ed è stato Zeca.
        Ettore: Matteo mi ha dato l'indizio risolutivo.
            Ettore: Quando mi ha detto che una cosa del genere potevano averla scritta solo o Paola, o Zeca.
            Zeca: Andate a fanculo.  -> oggetto

    + (GR) {liarCallLiarStorylet.indagini} Ettore: Ed è stata Greta.
            Ettore: Zeca mi ha messo sulla buona strada, quando mi ha raccontato che la segretaria di Paola aveva accesso alle sue informazioni personali.
            Greta: Sai che notizia, è il mio lavoro.  -> oggetto


= indirizzo
    + (MT) {phone.sindacato or greta_talking_second_tier.indagini2} Ettore: La lettera è per Matteo.
        Ettore: Organizzare il sindacato nella Londar è un buon modo per farsi nemici, no?
        Matteo: Di certo il mio obiettivo non era di tirare su il gruppo della briscola.  -> oggetto

    + (EL) {greta_talking_second_tier.indagini or greta_talking_second_tier.indagini3} Ettore: Il destinatario è Elia.
        Ettore: Per essere tonto, ti sei ritrovato in un sacco di casini, vero?
        Elia: Niente barrette quindi?  -> oggetto



= oggetto
    Ettore: Non abbiamo ancora l'assassino, ma-
    Greta: Gasp!
    Paola: E vi lamentate delle mie sceneggiature?
    Paola: Nessuno è morto.
    Ettore: Paola: tu stai per morire.
    Zeca: <cry>Farnetichi!</cry>
    Elia: Questa sceneggiatura mi piace!
    Greta: Chi ha portato i funghetti e non li ha condivisi?
    Matteo: Ettore, tutto bene?
    Paola: <cry>LASCIATELO PARLARE!</cry>
    Paola: Sentiamo che cazzata ha da dire.
    Ettore: Grazie per la fiducia, davvero!
    Ettore: Dicevo: non abbiamo ancora l'assassino, ma c'è un ultimo elemento su cui riflettere.
    Ettore: Quale sarà lo strumento utilizzato?

        + (VN) {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Ettore: Il vino: è stato avvelenato.
                Ettore: C'è il veleno per topi.
                Ettore: E c'è la nicotina nelle sigarette elettroniche. 
        + (AS) {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Ettore: Il boccettino per l'asma è stato svuotato.
                Ettore: Questo posto è una cloaca, e Paola si lamenta del raffreddore da ore.
                Ettore: Evitarle la possibilità di salvarsi, è un modo per ucciderla.
        + (NI) {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} Ettore: Sigaretta e nicotina.
            {greta_talking_second_tier.allestimento2: Greta mi ha dato un'ottima dritta.}
            Ettore: La nicotina è un veleno potentissimo.
            Ettore: Può essere stato fatto ingerire, o lasciato a contatto con la pelle di Paola.
            Paola: Che schifo!
        + (TR) {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} Ettore: La torta e un classico shock anafilattico.
            Ettore: Quella torta è un concetrato di arachidi, e Paola è allergica alle arachidi.
        -
    Paola: Rimane il perché, però.
    Paola: Perché qualcuno dovrebbe uccidermi?
    Ettore: Proviamo a mettere assieme i pezzi.
    {GE: Ettore: Greta ed Elia si sono occupati di settare la stanza. La stanza dove è passato il cibo, dove c'era la lettera.}
    {MZ: Ettore: Zeca e Matteo si sono occupati di settare la stanza. La stanza dove è passato il cibo, dove c'era la lettera.}
    {indeciso: Ettore: Qualcuno tra voi si è occupato di settare la stanza. La stanza dove è passato il cibo, dove c'era la lettera.}
    {ZC: Ettore: La lettera scritta da Zeca.}
    {GR: Ettore: La lettera scritta da Greta.}
    {MT: Ettore: La lettera indirizzata a Matteo.}
    {EL: Ettore: La lettera indirizzata a Elia.}
    {VN: Ettore: La stanza dove si trovava il vino avvelenato.}
    {TR: Ettore: La stanza dove si trovava la torta piena di arachidi.}
    {AS: Ettore: Qualcuno ha svuotato il boccettino dell'asma di Paola.}
    {NI: Ettore: E un veleno potentissimo come la nicotina è stato accessibile per tutte le prove.}

    Ettore: Ora vorrei sentire da te il perché, però. Perché vuoi uccidere Paola...
        + (EC) Ettore: Elia? -> eliaConfessa
        + (GC) Ettore: Greta? -> gretaConfessa
        + (ZC) Ettore: Zeca? -> zecaConfessa
        + (MC) Ettore: Matteo? -> matteoConfessa
        + Ettore: No. Non ho abbastanza informazioni! [NOTA: Farai ripartire il loop] -> loop_reset
    
    = zecaConfessa
        Zeca: Perché? Lo sai già perché.
        Zeca: L'ho detto dall'inizio: <joy>farei di tutto per proteggere Elia.</joy>
        Zeca: E questa stronza sta per distruggere Elia.
        Paola: E casualmente, te.
        Paola: Non parlare di protezione: lo fai solo perché saresti nulla senza Elia.
        Paola: Lo estrometto dall'azienda per salvarlo da te!
        Zeca: <rage>Non dire cazzate.</rage>
        Paola: BRO è un colabrodo. Avete più debiti di un insulso paese del terzo mondo.
        Elia: Zeca, è vero?
        Zeca: Non è nulla di irrecuperabile, Elia, davvero.
        Paola: Tutto è irrecuperabile in quello che avete fatto.
        Paola: L'unica cosa sensata che potresti fare della tua vita, è sparire.
        Paola: E smetterla di importunare mio fratello.
             -> choice

    = gretaConfessa
        Greta: <joy>Vendetta.</joy>
        Greta: Lunga, lenta, coltivata vendetta.
        Paola: Cazzo stai a dire?!?
        Greta: Per i miei genitori.
        Greta: Sono morti per colpa tua, Paola.
        Greta: La tua azienda di merda prima li ha fatti sfrattare.
        Greta: Poi li ha riempiti di debiti facendo comprare loro cose inutili.
        Greta: E obbligandoli a spostarsi a decine di chilometri da dove lavoravano.
        Greta: Hanno perso tutto.
        Greta: Hanno perso il lavoro.
        Greta: E poi come dei mafiosi, come degli strozzini, siete arrivati per chiedergli soldi che non avevano più, che non avevano mai avuto.
        Greta: Si sono suicidati per colpa tua, Paola.
        Greta: <rage>Li hai uccisi tu.</rage>
        Paola: Mi deludi, Greta.
        Paola: Pensavo avessi imparato ormai a capire la realtà.
        Paola: A capire che i deboli per questo mondo sono una malattia.
        Paola: Ho solo aiutato ad accelerare la cura.
            -> choice

    = matteoConfessa
        Matteo: Sta distruggendo il mondo.
        Matteo: Con la Londar, sta distruggendo il mondo.
        Matteo: Sono stanco di rispondere tutti i giorni a gente disperata perché quell'azienda gli ha portato via tutto.
        Matteo: Punto.
        Matteo: Niente grandi elaborazioni.
        Matteo: Questo mondo fa schifo, fa schifo per gente come Paola.
        Matteo: E se è impossibile risolvere le cose scioperando.
        Matteo: Manifestando.
        Matteo: Votando.
        Matteo: <rage>Beh, allora resta solo la violenza.</rage>
            -> choice


    = eliaConfessa
        Elia: Non lo so. Davvero, non lo so.
        Elia: Ero solo stanco.
        Elia: Sono stanco.
        Elia: <fear>Stanco di essere una ciotola.</fear>
        Elia: <fear>Stanco di essere trattato da stupido.</fear>
        Elia: <fear>Stanco.</fear>
            -> choice


= choice
    Paola: Bene.
    Paola: Quindi abbiamo sentito inutili parole, una storia patetica.
    Paola: Ora sono salva però e possiamo tornare a lavorare.
    Paola: Muovete il culo.
    Ettore: In realtà non è così facile.
    Paola: Lavorare? Per voi non lo è mai.
    Ettore: Il veleno è già stato usato.
    Ettore: Usato durante il buffet.
    Ettore: Stai già morendo.
    Ettore: Sei sempre morta alle 22:10 in punto.
    Ettore: Buffo, l'ora è ferma da un bel po' oramai.
    Paola: <cry>COSA CAZZO STAI FARNETICANDO?!?!?</cry>
    Ettore: Sto viaggiando avanti e indietro nel tempo da non so quanto.
    Ettore: Cercando di capire cosa è successo.
    Ettore: Ma tutto si ripete, si ripete, si ripete.
    Matteo: E quindi, cosa rimane fare?
        + Ettore: Finire tutto questo.
            Ettore: Addio -> END
        + Ettore: Provare ancora una volta.
            -> loop_reset
        + {matteo_talking_second_tier.loop3 or matteo_talking_second_tier.loop2} Ettore: [Darti un ultimo bacio, prima di ricominciare.] <joy>Darti un ultimo bacio prima di ricominciare.</joy>
            Matteo: <joy>Non aspettavo altro.</joy>
            -> loop_reset  



