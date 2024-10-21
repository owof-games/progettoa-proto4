=== second_tier_storylets

{

//SCENA INIZIALE
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && peopleTalking == false && new_this_loop(->reStartingDinnerStorylet):
    -> reStartingDinnerStorylet
    

//STORYLET "NORMALI"    

    - are_three_entities_together(Elia, Ettore, Zeca) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo) && elia_talking_second_tier.indagini3 && new_this_loop(-> liarCallLiarStorylet):
            -> liarCallLiarStorylet
    
    - inventoryContents has Foto && are_two_entities_together(Zeca, Ettore) && not are_six_entities_together(Zeca, Elia) && not are_two_entities_together(Zeca,Greta) && not are_two_entities_together(Zeca, Paola): -> iLlKillThatBitchStorylet    

    - are_two_entities_together(Matteo, Ettore) && not are_two_entities_together(Matteo,Greta) && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Matteo, Zeca) && not new_this_loop (->trueLoveStorylet) && new_this_loop(->forMeHeIsStupidAFStorylet):
        -> forMeHeIsStupidAFStorylet

//CONVERSAZIONI ORIGLIATE

    - are_two_entities_together(Elia, Zeca) && is_this_entity_near_Ettore(Elia) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo) && greta_talking_second_tier.indagini && loopableVariables == (EliaSpaventatoPerZeca) && new_this_loop(-> whisperingSecretsStorylet): -> whisperingSecretsStorylet
    
    - are_two_entities_together(Elia, Zeca) && is_this_entity_near_Ettore(Elia) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo) && iLlKillThatBitchStorylet && new_this_loop(-> trueLoveStorylet):
        -> trueLoveStorylet
    
    - are_two_entities_together(Matteo, Zeca) && is_this_entity_near_Ettore(Matteo) && not are_two_entities_together(Matteo, Greta) && not are_two_entities_together(Matteo, Paola) && not are_two_entities_together(Matteo, Elia) && matteo_talking_second_tier.allestimento && new_this_loop(-> iTryToBeAGoodFriendStorylet):
        -> iTryToBeAGoodFriendStorylet  
    
    
    - are_three_entities_together(Elia, Ettore, Greta) && not are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo)&& new_this_loop(-> liesAndPromisesStorylet ):
        -> liesAndPromisesStorylet
    

//CONVERSAZIONI IN ALTRE STANZE, CHE NON ORIGLIAMO, E CHE CONTINUANO QUANDO ENTRIAMO


//CONFESSIONI SOLITARIE 
    - are_entities_together_in(Matteo, Ettore, YellowRoom) && not are_two_entities_together(Matteo, Greta) && not are_two_entities_together(Matteo, Paola) && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Matteo, Zeca) && new_this_loop(->notABigSecretPartOneStorylet):
            -> notABigSecretPartOneStorylet

    - are_entities_together_in(Ettore, Elia, YellowRoom) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo) && not are_two_entities_together(Elia, Zeca) && new_this_loop(->notABigSecretPartTwoStorylet):
            -> notABigSecretPartTwoStorylet


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
        Matteo: Tutto il consiglio di amministrazione muto.
        Matteo: E il progetto per la piscina sul tetto del grattacielo è passato.
        Greta: Un giorno annegherete tutti, e sarà festa nazionale.
        Paola: {& Non voglio morire non voglio morire non voglio morire non voglio.|L'aria manca, presto saremo cenere|Lei attende silente nell'ombra.|AAAAAAAAAAAAAAAAAAAA!|   }
        Elia: Quindi è permesso augurare la morte a qualcuno? Perché avrei un po' di nomi, nel caso.
        Zeca: Elia, almeno tu mantieni la tua innocenza o perderei l'unica spinta a sacrificarti.
            + Ettore: Eccomi! In tutto il mio splendore!
            + Ettore: Cosa diavolo è successo?!?
            + Ettore: Non ho alcuna innocenza: chi devo spingere dal grattacielo?
            -
            -> advance_time ->
        Matteo: Amore! Non ti avevo sentito proprio arrivare!
        Matteo: Fratelli, sorella, Greta.
        Greta: Fottiti.
        Matteo: Vi presento l'uomo che amo: Ettore. Ettore, loro sono i miei familiari.
            + Ettore: Finalmente incontro il famoso Elia!
                Elia: Famoso? Sono finito su Tik Tok?
                Greta: No, nel Guinness dei Primati come primo essere umano senza cervello.
            + Ettore: Tu devi essere Paola! Matteo parla un sacco di te!
                Paola: Non voglio morire non voglio morire non voglio morire non voglio.
                Matteo: Non ti parlo così tanto di lei. A parte a pranzo, cena, letto e durante le preghiere.
            + Ettore: Perché state facendo finta di nulla?!?.
                Greta: Bene Matteo, finalmente ci presenti qualcuno di interessante!
                Zeca: E almeno abbiamo qualcosa in comune.
            -
            -> advance_time ->
        Paola: {& Non voglio morire non voglio morire non voglio morire non voglio.|L'aria manca, presto saremo cenere|Lei attende silente nell'ombra.|AAAAAAAAAAAAAAAAAAAA!|   }
        Elia: Sapete che nemmeno oggi ho aperto la porta dal lato giusto?
        Elia: Sono tutto un livido, guardate!
        Greta: Questo è un buon motivo per festeggiare in effetti.
        Matteo: Nessuno ha detto che dobbiamo festeggiare.
        Paola: {& Non voglio morire non voglio morire non voglio morire non voglio.|L'aria manca, presto saremo cenere|Lei attende silente nell'ombra.|AAAAAAAAAAAAAAAAAAAA!|   }
        Matteo: Però brindiamo! Perché siamo qui ad affrontare l'alcolismo di Zeca, e farlo smettere di bere.
            + Ettore: E avete pensato di partire con un brindisi?
                Zeca: Ettore, giusto? Ecco, Ettore: non farti domande su questa famiglia, o c'è da perdere il senno.
            + Ettore: Ehm, e io che c'entro?
                Matteo: Tu sei il testimone speciale, vedrai!
            + Ettore: Forse ho bevuto davvero? E non lo ricordo?
                Paola: Non voglio morire non voglio morire non voglio morire non voglio.
            -
            -> advance_time ->
            
        Paola: {& Non voglio morire non voglio morire non voglio morire non voglio.|L'aria manca, presto saremo cenere|Lei attende silente nell'ombra.|AAAAAAAAAAAAAAAAAAAA!|   }
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
            + Ettore: Boh, a questo punto me ne vado anche io.
            + Ettore: Ma non è che c'è dell'altro vino in giro?
            -
            -> advance_time ->

            ~ move_entity(Elia,WhiteRoom)
        Elia entra, muore.
            ~ move_entity(Zeca,WhiteRoom)
        Zeca entra, muore.
            ~ move_entity(Matteo,WhiteRoom)
        Matteo entra, muore.
            ~ move_entity(Greta,WhiteRoom)        
        Greta entra, muore.
            ~ move_entity(Paola,WhiteRoom)
        Paola:{& Non voglio morire non voglio morire non voglio morire non voglio.|L'aria manca, presto saremo cenere|Lei attende silente nell'ombra.|AAAAAAAAAAAAAAAAAAAA!|   }
        Paola muore.

            -> advance_time ->

            + (tuttiMorti) Ettore: Perché vi comportate così?!?!
            -
        Paola: {& Non voglio morire non voglio morire non voglio.|L'aria manca, presto saremo cenere|Lei attende silente nell'ombra.|AAAAAAAAAAAAAAAAAAAA!|   }
            -> advance_time ->
        Greta: BASTAAAAAAA! Questo script è tremendo!
        Paola: {& Non voglio morire non voglio.|L'aria manca, presto saremo cenere|Lei attende silente nell'ombra.|AAAAAAAAAAAAAAAAAAAA!|   }
        Elia: Basta, basta, basta. Prendiamoci dieci minuti di riposo.
        Paola: Non voglio.
            ~ peopleTalking = true
            -> advance_time ->

    -> intro



//STORYLET "NORMALI"

=== liarCallLiarStorylet
        Zeca: Devi smetterla di fidarti di lei, Elia.
        Zeca: Lo dico per il tuo bene.
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
        Zeca: PERO'. PERO'.
        Zeca: A te non ha detto nulla la tua amica, vero?
        Zeca: E non ha fatto un passo che uno per aiutarti quando Paola ha iniziato a mettere in giro voci per incolparti.
        Elia: Cosa sono i giornali?
        Zeca: Elia: tu hai solo me.
        Zeca: Gli altri se ne approfitteranno sempre della tua innocenza.
        Zeca: Sono l'unica cosa che ti rimane.
            + Ettore: Cringe.
                Zeca: Fottiti. E non osare più parlarmi.
                ~ loopableVariables += pausaRapportoZeca
            + Ettore: Romantico.
                Zeca: Si tratta di lavoro, solo di lavoro.
            -> advance_time ->            
        -> intro


=== iLlKillThatBitchStorylet
        Zeca: DAMMI SUBITO QUELLA FOTO!
            ~ inventoryContents -= Foto
            ~ objectStorageContents += Foto
        Zeca: QUELLA GRANDISSIMA STRONZA!
        Zeca: La uccido, io la uccido!
        Zeca: E lui. Lui. Lui.
        Zeca: Io. Io.
        Zeca: Solo.
        Zeca: Sono solo.
        Zeca: VATTENE TU AMEBA, ORA!
        Zeca: Anzi no, me ne andrò io.
            -> advance_time -> 
            ~ move_this_entity_in_a_different_room(Zeca)
                 
    -> intro  


=== forMeHeIsStupidAFStorylet
    Matteo: Non me lo sarei mai aspettato.
    Ettore: Cosa?
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
            Matteo: {iTryToBeAGoodFriendStorylet: Sì. Ma poi ho tentennato, e mi vergogno.|Interessante. So che lei è forte, ma magari vedo di tirarle su il morale.}
        + Ettore: Voglio rimanere ottimista. L'amore è amore.
            Matteo: E la cicuta è cicuta, e per questo ti uccide.
            Ettore: Non credi nell'amore?
            Matteo: Sì, ma non credo in Elia. Quel ragazzo è così confuso da scambiare il suo naso per una pinna.
            Matteo: E la sua amicizia per amore. Ma magari mi sbaglio.
        -
    Matteo: Se non è un problema, vorrei rimanere un poco da solo, Ettore.
        -> advance_time ->        
    -> intro


//CONVERSAZIONI ORIGLIATE

=== whisperingSecretsStorylet
        Elia: Sono la ciotola, o sono il cane?
        Zeca: Che stai dicendo?
        Elia: Paola, vuoi fare del male a Paola?
        Zeca: Tutti i giorni, Elia.
        Elia: E sono la ciotola o il cane?
        Elia: Mi bevi, o mi petti?
        Elia: Le fai del male per me?
        Zeca: Perché dovrei farle del male per te?
            -> advance_time ->   
        Elia: Dici sempre che fai di tutto per proteggermi.
        Elia: Paola forse mi vuole fare male.
        Elia: E tu che fai?
        Zeca: Sei preoccupato? O speri che ti protegga?
        Elia: Voglio essere il tuo cane.
        Elia: Ma ho paura di essere solo la cotola.
        Elia: Non bermi.
            -> advance_time ->   
    -> intro


=== iTryToBeAGoodFriendStorylet
        Zeca: Te lo ripeto: non voglio parlare con te.
        Matteo: Zeca, Paola vuole mettere zizzania tra noi, e per ques-
        Zeca: Per quello basti tu.
        Matteo: Ma perché non vuoi ascoltarmi?
        Zeca: PERO'. PERO'.
        Zeca: Come se fosse possibile farti stare zitto.
        Matteo: Sto cercando solo di essere un buon amico.
        Matteo: E di evitare che tu stia male.
        Zeca: No, tu sei solo geloso, e per questo vuoi sabotare la mia relazione.
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
    -> intro




=== liesAndPromisesStorylet
    Greta: Dimmelo di nuovo, ti prego.
    Elia: Era una cosa sbagliata?
    Elia: Sbaglio tutto io, scusa.
    Greta: No no no, ridimmela perché è un cosa bella.
    - (promise)Elia: Ti amo, Greta.
    Greta: Ti amo anche io, Elia.
    Elia: Ora mi fai i grattini?
    Greta: Alza quella maglietta e ti faccio tutti i grattini del mondo.
        -> advance_time ->  
    -> intro


=== trueLoveStorylet
        Zeca: No, non ti dico come lo so.
        Zeca: Quindi, ti scopi quella?
        Zeca: La ami?
        Elia: No. Ma sai come faccio.
        Elia: Mi fanno i grattini, vado su di giri e poi accadono cose.
        Zeca: Con me non è mai successo.
        Elia: Perché con te é diverso.
        Elia: Tu sei un mio fratello.
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
        Elia: Me ne fai due qui?
        Elia: Mi dici che sono un bravo ragazzo?
        Elia: E non mi prendi in giro quando ti dico che ti amo?
        Zeca: Elia, perché dovrei prenderti in giro?
        Elia: Perché tutti pensano che sono stupido.
        Elia: E quindi lo sono anche i miei sentimenti.
        Elia: Ma io so cosa provo quando sono con te.
        - (promise) Elia: Abbracciami. Te lo prometto Zeca: basta grattini con Greta o qualsiasi altra persona.
            -> advance_time ->  
    -> intro    




//CONFESSIONI SOLITARIE 
=== notABigSecretPartOneStorylet
        Matteo: Uh, ehi, ciao Ettore.
        Matteo: Mi hai colto di sorpresa.
        Ettore: Tutto ok?
        Matteo: Sì, sì. Stavo solo sistemando due cose.
        Matteo: Rimasugli del buffet di prima.
            -> advance_time -> 
                    ~ updateEntitiesLocations()
            {
                - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Matteo, Ettore, Greta) or are_three_entities_together(Matteo, Ettore, Zeca): -> quickTalk
            }
        - (allestimento) Matteo: Certo: Greta ed Elia potevano recuperare pure del vino decente. E hanno lasciato in tutta la stanza il puzzo delle loro cose da scenografi.
        Matteo: Due cose dovevano fare: riparare le seggiole, allestire il buffet.
        Matteo: E hanno fatto un disastro in tutte e due le occasioni.
                
            -> intro



    = quickTalk
        Matteo: Ma ecco che arriva qualcuno a rompere le scatole, e la nostra conversazione finisce qui.
        -> intro

TODO: fare entrare queste due informazioni in modo casuale, come Matteo che si lamenta di quei due (parte uno) ed Elia che è confuso (parte due). Ma nessuno dei due ci dice che cosa ha fatto lui e il partner.

=== notABigSecretPartTwoStorylet
        Elia: Non le trovo!
        Ettore: Cosa?
        Elia: Eh, se lo trovassi saprei cosa.
        Ettore: Ma stai cercando qualcosa, giusto?
        Elia: Esatto, ma non le trovo.
        Ettore: E cosa vorresti trovare?
        Elia: Se posso scegliere tutto, un pallone.
        Elia: Vorrei fare due tiri.
                    -> advance_time -> 
             ~ updateEntitiesLocations()
                    {
                        - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Elia, Ettore, Greta) or are_three_entities_together(Elia, Ettore, Zeca): -> quickTalk
                    }
        Ettore: Quindi ora non stai trovando un pallone?
        Elia: No, quello l'ho in garage.
        Elia: Sono le barrette che non trovo.
        Elia: Le mie proteine.
        Elia: Senza mi spariscono i muscoli.
        Ettore: Non credo che funzionino così.
        Elia: No no giuro me l'ha detto il tizio del negozio.
        Elia: Se non le mangio ogni tre ore perderò tutti i muscoli.
                    -> advance_time -> 
            ~ updateEntitiesLocations()
                    {
                        - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Elia, Ettore, Greta) or are_three_entities_together(Elia, Ettore, Zeca): -> quickTalk
                    }
        Elia: Maledizione.
        - (allestimento)  Elia: Zeca e Matteo sono andati a prendere il cibo, e non le hanno prese. Sono passati anche in farmacia e dal tabacchi per la sigaretta di Paola, e anche lì ci sono le mie barrette. Ma non le hanno prese!
        Elia: Ora perderò tutti i miei muscoli e sarò una persona normale, come te!
        Elia: Povero me!
        
            -> intro

    = quickTalk
        Elia: Ma non siamo da soli e non posso lamentarmi, no no.
        Elia: Lamentarsi è brutto.
        Elia: Gli uomini non si lamentano.
        Elia: Gli uomini soffrono.
    
            -> intro


//STORYLET A CUI ARRIVIAMO SOLO ATTRAVERSO UNA SCELTA
=== evilJobStorylet
    Matteo: Vuoi davvero ascoltare una storia lunga e noiosa?
        + Ettore: Se è lunga, forse non ho tutto questo tempo, scusa.
            -> intro
        + Ettore: Ho tutto il tempo del mondo.
            -> uno

    = uno
        Matteo: Sono entrato in Londar tre anni fa, e ci sono entrato grazie ad Elia.
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
        Matteo: I miei colleghi si sono mostrati entusiasti. Avevano bisogno di credere in qualcosa di nuovo.
        Matteo: Ne hanno tutt'ora.
            -> advance_time ->
            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }
        Matteo: Alla prima riunione, molti di loro hanno detto che è solo questione di tempo, prima di ritrovarsi dall'altra parte del telefono.
        Matteo: Ora siamo solo all'inizio, abbiamo avuto un contatto da Risorse Umane che è stato totalmente disumano, hanno praticamente cercato di farci il lavaggio del cervello.
        Matteo: E Paola, qui, non ha ancora messo assieme i pezzi, credo.
        Matteo: Ma quando mi affronterà, si troverà davanti un osso duro.
        Matteo: Sono stanco di questo sistema, e farò di tutto perché almeno qualcosa di piccolo possa cambiare.
        Matteo: Pensi sia un illuso?
            + Ettore: No. E ti ammiro tantissimo, Matteo.
                Matteo: Na, niente ammirazione. Ma se servirà, aiutaci.
            + Ettore: Credo non cambierà nulla, ma è bello vederti provare.
                Matteo: Non cambierà nulla se non facciamo nulla, mai. no?
                Matteo: Ma sono sicuro che stavolta sarà diverso.
            -
          -> advance_time ->                  
            -> intro


//SCENA ARRINGA
=== arringa_finale
    ~ move_first_entity_to_second_entity_location(Paola, Ettore)
    ~ move_first_entity_to_second_entity_location(Greta, Ettore)
    ~ move_first_entity_to_second_entity_location(Elia, Ettore)
    ~ move_first_entity_to_second_entity_location(Matteo, Ettore)
    ~ move_first_entity_to_second_entity_location(Zeca, Ettore)
    
Ettore: Vi ho chiamati tutti perché sta per essere commesso un crimine.
Scena alla Nella mia famiglia tutti hanno ucciso qualcuno.
Ettore: Una delle prime cose che mi ha colpito, è che nessuno ammetteva di essere stato nella sala gialla.
Ma sono sicuro che se ne sono occupati
    + Ettore: Greta e Elia!
        + + Perché uno
    + Ettore: Matteo e Zeca!
        + + Perché due
    + Ettore: Non riesco a prendere una decisione.    
Ettore: Poi, c'è la lettera.
Ettore: C'era la generale convinzione che fosse stata scritta da Paola.
Paola: Non l'ho mai vista!
Ettore: Ed è la stessa cosa che ho pensato, perché quando ne abbiamo parlato blah blah blah.
Ettore: Ma qualcuno voleva fare paura a qualcun altro.
Ettore: E la lettera palesemente era per:
    + Ettore: Elia.
        + + Perché e Zeca
        + + Perché
    + Ettore:
        + + Perché e Matteo.
        + + Perché
    + Ettore: Non riesco a prendere una decisione.     
Ettore: Ma non capivo chi potesse averla scritta, e poi mi son detto: l'assassino.
Zeca: Assassino?
Greta: Gasp!
Paola: E vi lamentate delle mie sceneggiature?
Paola: Nessuno è morto.
Ettore: Per ora, perché in realtà a breve qualcuno cerchera di ucciderti.
Ettore: E io devo fermarlo.
Zeca: Farnetichi!
Elia: Questa sceneggiatura mi piace!
Greta: Chi ha portato i funghetti e non li ha condivisi?
Matteo: Ettore, tutto bene?
Paola: LASCIATELO PARLARE!
Paola: Sentiamo che cazzata ha da dire.
Ettore: Grazie per la fiducia, davvero!
Ettore: Comunque: vi chiedo di tenere sott'occhio
    + Ettore: Zeca
    + Ettore: Greta
    + Ettore: Elia
    + (matteo) Ettore: Matteo
    -
Ettore: Tu sei il nostro futuro assassino.
Ettore: E hai usato: 
    + {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Usando il vino.
    + {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Il boccettino dell'asma.
    + {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} La sigaretta elettronica.
    + {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} La torta.
    -
    
E l'unico perché solido è:
    + (perche) xxx
    + yyy
    + zzz
    -

    
Sono sicuro di tutto questo?
    + {matteo && perche} Non importa: Paola è un personaggio terribile e deve morire -> specialEndingStorylet
    + Sì -> finalStorylet
    + No -> loop_reset



//STORYLET DI CHIUSURA
=== finalStorylet


-> END


=== specialEndingStorylet


-> END