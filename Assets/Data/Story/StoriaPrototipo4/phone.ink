=== phone
+ {activePhone} [phone]
-> contents

= contents
+ [Chiama qualcuno] -> call
+ [Chiudi il telefono] -> intro
+ ->->


//MESSAGGI
= call
Chi chiami?
        + (padre) Ettore: Ciao papà!
                {    
                - new_this_loop(->papà) && tierState has SecondTier: -> papà
                - else: Papà: Ettore, ti rispondo appena trovo gli occhiali. 
                }
        + (agentino) Ettore: Ehi agente dei miei stivali!
                {
                - new_this_loop(->agentino) && tierState has SecondTier: -> agente
                - else: Agente: Ciccio, ora non posso, a dopo!
                }
        + (amichetta) Ettore: Ehi, stronzetta, hai un minuto?
                {
                - new_this_loop(->amichetta) && tierState has SecondTier: -> amica
                - else: Amica: Asp, finisco Temptation Island e ci sono!
                }
        + (pula) Ettore: Pronto, polizia? -> maiali        
        + [Torna al menù principale] -> contents
-> contents

= papà
        Ettore: Papà, ti ricordi quel tuo telefilm preferito, "Il giorno della smarmotta"?
        Papà: Cioè: non mi scrivi per tre giorni e mi fai questa domanda?
        Ettore: Diciamo che è una situazione complicata.
        Papà: Con te lo è sempre.
        Papà: Passi per lo meno domenica per il polpettone di seitan, vero?
        Ettore: Sì, promesso papà.
        Papà: Vai, dimmi pure.
        -> advance_time ->
                - (question)
                + Ettore: Qual era l'obiettivo del tizio del telefilm?
                        Papà: Sconfiggere le marmotte mutanti.
                        Ettore: Sì, ma come?
                        Papà: Una delle persone chiusa nell'albergo con lui le aveva create.
                        Papà: Tutti sembravano potenziali sospettati.
                        Papà: E alcuni mentivano pure.
                        Papà: Però alla fine ce la faceva e salvava tutti.
                        Ettore: E come riusciva?
                        Papà: Beh, perché lui a differenza tua l'era sveglio!
                                -> advance_time ->
                                -> question
                + Ettore: Come faceva ad avere informazioni?
                        Papà: Mmm, fammi ricordare.
                        Papà: Metteva alcune persone vicino.
                        Papà: O isolava altre.
                        Papà: E a volte dicevano cose diverse.
                        Papà: O mostrando loro oggetti.
                        Papà: A parte la marmotta impagliata: quella li terrorizzava tutti.
                        Papà: E poi si segnava un sacco di cose.
                        Papà: Mica come te, che ti ho mandato a studiare e non sai scrivere!
                                -> advance_time ->
                                -> question
                + Ettore: Cosa succedeva se sbagliava?
                        Papà: La cosa bella dei loop è che se sbagliava doveva solo aspettare mezzanotte, e ricominciare.
                        Papà: Certo, non era bello morire così, esplodendo ogni notte assieme alle marmotte mutanti zombie.
                        Papà: Ma ci sono cose peggiori.
                        Papà: Ah, sì, c'era una cosa peggiore: il trial!
                        Ettore: Il trial?
                        Papà: Quando pensava di avere tutte le informazioni, poteva accusare qualcuno.
                                -> advance_time ->
                        Papà: E quello era colpevole, punto.
                        Ettore: E se prendeva la persona sbagliata?
                        Papà: Non l'avrebbe mai saputo.
                        Papà: Alla fine le marmotte volevano solo un sacrificio, maledette marmotte.
                        Papà: Ma il protagonista se ne rimaneva con il rimorso e il dubbio per sempre.
                        Papà: Deve essere una roba orribile.
                        Papà: Fortuna che è solo un telefilm vero?
                                -> advance_time ->
                                -> question
                + Ettore: A posto così, grazie papà!
                        Papà: E non mi chiedi manco come sto?
                        Ettore: Come stai, papà?
                        Papà: A parte gli acchiachi, bene dai!
                        Papà: E poi si sta soli qui, tanto soli.
                        Papà: Sarebbe bello se il mio unico figlio venisse a trovarmi, ogni tano.
                        Papà: Merda, mi son caduti gli occhiali.
                        Papà: Ti scrivo dopo.
                                -> advance_time ->
                        -> contents
        -> contents



= agente
        + Ettore: Dove cazzo mi hai mandato?
                Agente: Ehi, datti una calmata, biondino!
        + Ettore: Cosa ti ha fatto pensare che questa fosse una bazza?
                Agente: I soldi che ci hanno dato.
        + Ettore: Potrei essere nei guai.
                Agente: Se non hai ucciso nessuno, potrei risolvere tutto.
        -
        Ettore: Che cosa sai di questa Paola?
        Agente: Solo che ho un debito con lei.
        Agente: Anche se forse ora le cose stanno peggiorando.
        Ettore: In che senso?
        Agente: Ascolta, io non ti ho detto nulla, ma...
                + (indagini) Ettore: Ma?
                -
                -> advance_time ->
        Agente: L'azienda di Paola è sotto indagine, sono arrivati documenti compromettenti.
        Agente: E insomma, sembra che lei stia scaricando la colpa sul fratello.
        Agente: Un idiota totale.
        Agente: MA COMUNQUE: fammi fare bella figura.
        Agente: Questa è gente ricca, cade sempre in piedi.
        Agente: E una bella prova non sai mai dove possa portarti.
        Agente: Stammi bene!
                -> advance_time ->
        -> contents


= amica
        Amica: Trenta secondi, che c'è la pubblicità.
        Amica: Sei in qualche casino?
        + {phone.indagini} Ettore: Ecco, mi servirebbe il tuo potere di gossippara.
                Amica: Spara.
                Ettore: Sai qualcosa sulle indagini sulla Londar?
                Amica: Intendi su Paola Londar e fratello?!?
                Amica: Zero.
                Amica: No, scherzo, potrei parlartene per ore.
                Ettore: Un riassunto veloce?
                Amica: Conti truccati, mazzette, gente morta.
                        -> advance_time ->
                Amica: E fresca fresca di oggi, il migliore amico di Elia che sta tirando su un sindacato contro la sorella.
                 + (sindacato) Ettore: Intendi Zeca?
                 -
                Amica: See, quello non è il migliore amico! Quello è.
                Amica: Merda, sta per ripartire Temptation Island.
                Amica: No, quell'altro, non ricordo come si chiama.
                Amica: Michele, Mirco, Marco.
                Amica: Il casino sembra sia partito proprio per le resistenze di Mistress Londar.
                Amica: A quel punto quel tipo con la M ha dato il tutto per tutto, secondo me.
                Amica: Ma sono solo speculazioni. Ora scappo, ma tienimi aggiornata!
                        -> advance_time ->
                 -> contents 
        + Ettore: Credo di essere bloccato in un deja-vu.
                Amica: Come quella volta coi funghetti?
                Ettore: No no, questa volta per davvero.
                Ettore: E non ho idea di come uscirne.
                Amica: Ti ricordi quello che diceva sempre tuo padre quando eri piccolo?
                Ettore: Di mettere le protezioni per le ginocchia?
                Amica: No! Che tu sei sempre stato bravo a scoprire la verità.
                Amica: E ogni cosa ha un pattern, e ogni cosa è un puzzle per te.
                        -> advance_time ->
                Amica: Quindi, datti da fare, esci dal tunnel o loop o quel che è.
                Amica: Che poi mi devi raccontare di questa assurda esperienza.
                Ettore: E non sei preoccupata per me?
                Amica: Naaa.
                Amica: Se è un loop e non sei morto, non morirai mai.
                Amica: Ma forse è anche perché c'è Alfredo Torrelli nudo davanti alla fidanzata.
                Amica: Scusa, scappo, fammi sapere se sopravvivi!
                        -> advance_time ->
                        -> contents

= maiali
        Polizia: Dica.
        Ettore: Qualcuno è morto, ucciso.
        Polizia: Era immigrato?
        Ettore: No, non è immigrato.
        Polizia: Frocio?
        Ettore: Non che io sappia, è una donna.
        Polizia: Quindi lesbica?
        Ettore: No, ma che c'entra?
                -> advance_time ->
        Polizia: Qui le domande le faccio io, scusi.
        Polizia: Aveva striscioni contro Israele?
        Polizia: Lattine di tempera lavabile?
        Polizia: Protestava perché licenziato ingiustamente?
        Polizia: Ha occupato una strada in modo pacifico?
        Ettore: No mi scus.
        Polizia: Ha nominato il nome di Giorgia invano?
                -> advance_time ->
        Ettore: No guardi eravamo qui a recitare e.
        Polizia: Ok, quindi c'è il frocio.
        Polizia: No Maresciallo, no, niente roba del decreto sicurezza, mi spiace.
        Polizia: Su, non pianga, ne hanno altri di...
        Ettore: No aspetti, è un omicidio.
        Polizia: Sì sì ma son sempre delitti di passione quelli, sa com'è.
        Ettore: No! Qualcosa nel collo, le hanno messo qualc.
        Polizia: Questi dettagli immorali li tenga per sé.
        Polizia: Non voglio sapere chi ha messo cosa dove quando non mi importa.
                -> advance_time ->
        Polizia: E ora se mi scusa, ho altro da fa.
        Ettore: Paola! Paola Londar!
        Ettore: La vittima è Paola Londard.
        Polizia: Ah.
        Polizia: Ma perché non mi ha detto subito che era ricca?!?
        Polizia: Mo mi fanno il culo, mi fanno!
        Polizia: Venti minuti e arriviamo.
        Polizia: E la arresto per intralcio a qualcosa, qualcosa lo trovo.
        Polizia: Non si muova di lì!
                -> advance_time ->        
-> contents