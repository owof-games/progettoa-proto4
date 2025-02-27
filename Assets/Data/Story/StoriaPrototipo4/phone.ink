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
        + (padre){new_this_loop(->padre) && reStartingDinnerStorylet} [Chiama tuo padre.]
            Ettore: Ciao papà!
            -> papa
        + {not new_this_loop(->padre) && reStartingDinnerStorylet} [Chiama tuo padre.]
            Ettore: Ciao papà!
            Papà: Ettore, ti rispondo appena trovo gli occhiali.
                -> contents
        +{not reStartingDinnerStorylet} [Chiama tuo padre.]
            Ettore: Ciao papà!
            Papà: Non ora figliolo, non ora.
            -> contents

        + (agentino) {new_this_loop(->agentino) && reStartingDinnerStorylet} [Chiama il tuo agente.]
            Ettore: Ehi agente dei miei stivali!
            -> agente
        + {not new_this_loop(->agentino) && tierState has SecondTier} [Chiama il tuo agente.]
            Ettore: Ehi agente dei miei stivali!
            Agente: Non ora, lavora e non rompermi!
                -> contents
        +{not reStartingDinnerStorylet} [Chiama il tuo agente.]
            Ettore: Ehi agente dei miei stivali.
            Agente: <i>In questo momento sono a dormire. O al concerto di Taylor. Chiamate più tardi</i>.
            -> contents    

        + (amichetta) {new_this_loop(->amichetta) && reStartingDinnerStorylet} [Chiama la tua migliore amica.]
            Ettore: Ehi, stronzetta, hai un minuto?
            -> amica
        + {not new_this_loop(->amichetta) && tierState has SecondTier} [Chiama la tua migliore amica.]
            Ettore: Ehi, stronzetta, hai un minuto?
            Amica: Asp, finisco Temptation Island e ci sono!
                -> contents
        +{not reStartingDinnerStorylet} [Chiama la tua migliore amica.]
            Ettore: Ehi, stronzetta, hai un minuto?
            Amica: No ama, c'è Temptation Island! A dopo!!!
            -> contents    
    
        + (pula) [Chiama la polizia.]
            Ettore: Pronto, polizia?
            -> maiali        

-> contents

= papa
        Ettore: Papà, ti ricordi quel tuo telefilm preferito, quello sulle marmotte?
        Papà: <hesitate>Cioè: non mi scrivi per tre giorni e mi fai questa domanda?
        Ettore: Diciamo che è una situazione complicata.
        Papà: Con te lo è sempre.
        Papà: Passi per lo meno domenica per il <joy>polpettone di seitan</joy>, vero?
        Ettore: Sì, promesso papà.
        Papà: Vai, dimmi pure.
        -> advance_time ->
                - (question)
                + (obiettivo) {new_this_loop(->obiettivo)} Ettore: Qual era l'obiettivo del tizio del telefilm?
                        Papà: Sconfiggere le <fear>marmotte mutanti</fear>.
                        Ettore: Sì, ma come?
                        Papà: Una delle persone chiusa nell'albergo con lui le aveva create.
                        Papà: Tutti sembravano potenziali sospettati.
                        Papà: E alcuni mentivano pure.
                        Papà: Però alla fine ce la faceva e salvava tutti.
                        Ettore: E come riusciva?
                        Papà: Prestando attenzione ai dettagli, ovviamente!
                                -> advance_time ->
                                -> question
                + (info) {new_this_loop(->info)} Ettore: Come faceva ad avere informazioni?
                        Papà: Mmm, fammi ricordare.
                        Papà: Mostrava oggetti alle persone.
                        Papà: Metteva alcune persone vicino.
                        Papà: O isolava altre.
                        Papà: Così a volte si contraddicevano.
                        Papà: E poi si segnava un sacco di cose.
                        Papà: Mica come te, che ti ho mandato a studiare e non sai scrivere!
                                -> advance_time ->
                                -> question
                + (sbaglio) {new_this_loop(->sbaglio)} Ettore: Cosa succedeva se sbagliava?
                        Papà: La cosa bella dei loop è che se sbagliava doveva solo aspettare mezzanotte, e ricominciare.
                        Papà: Certo, non era bello morire così, esplodendo ogni notte assieme alle marmotte mutanti zombie.
                        Papà: Ma ci sono cose peggiori.
                        Papà: Ah, sì, c'era una cosa peggiore: il trial!
                        Ettore: Il trial?
                        Papà: Quando pensava di avere tutte le informazioni, poteva accusare qualcuno.
                                -> advance_time ->
                        Papà: E quello era colpevole, punto.
                        Ettore: E se prendeva la persona sbagliata?
                        Papà: Non l'avrebbe <fear>mai</fear> saputo.
                        Papà: Alla fine le marmotte volevano solo un sacrificio, maledette marmotte.
                        Papà: Ma il protagonista se ne rimaneva con il rimorso e il dubbio per sempre.
                        Papà: Deve essere una roba orribile.
                        Papà: <joy>Fortuna che è solo un telefilm vero?</joy>
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
        + Ettore: [Dove cazzo mi hai mandato?]<cry>Dove cazzo mi hai mandato?</cry>
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
        Ettore: Ma?
                -> advance_time ->
        Agente: L'azienda di Paola è sotto indagine, sono arrivati documenti compromettenti.
        - (indagini) Agente: E insomma, sembra che lei stia scaricando la colpa sul fratello.
        Agente: Un idiota totale.
        Agente: <cry>MA COMUNQUE</cry>: fammi fare bella figura.
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
                Amica: Conti truccati, mazzette, <joy>gente morta.</joy>
                        -> advance_time ->
                Amica: E fresca fresca di oggi, il migliore amico di Elia che sta tirando su un sindacato contro la sorella.
                Ettore: Intendi Zeca.
                Amica: See, quello non è il migliore amico! Quello è.
                Amica: Merda, sta per ripartire Temptation Island.
                Amica: No, quell'altro, non ricordo come si chiama.
                - - (sindacato) Amica: Michele, Mirco, Marco.
                Amica: Il casino sembra sia partito proprio per le resistenze di Mistress Londar.
                Amica: A quel punto quel tipo con la M ha dato il tutto per tutto, secondo me.
                Amica: Ma sono solo speculazioni. Ora scappo, ma tienimi aggiornata!
                        -> advance_time ->
                 -> contents 
        + Ettore: Credo di essere bloccato in un deja-vu.
                Amica: <joy>Come quella volta coi funghetti?</joy>
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
                Amica: <joy>Naaa.</joy>
                Amica: Se è un loop e non sei morto, non morirai mai.
                Amica: Ma forse è anche perché c'è Alfredo <joy>nudo</joy> davanti alla fidanzata.
                Amica: Scusa, scappo, fammi sapere se sopravvivi!
                        -> advance_time ->
                        -> contents

= maiali
        Polizia: Qui è il 112, buonasera.
        Ettore: Qualcuno è morto, è stato ucciso.
        Polizia: Dove? Chi? Lei è al sicuro?
        Ettore: Non mi ero posto questa domanda.
        Ettore: Hanno ucciso Paola Londar.
        Ettore: Siamo in un, non ho idea di cosa sia.
        Ettore: Al civico 13 di via Quattordici Marzo.
        Polizia: Arriviamo subito!
                -> advance_time ->        
-> contents