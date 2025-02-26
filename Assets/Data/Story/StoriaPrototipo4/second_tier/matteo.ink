=== cb_second_tier_matteo ===
{debug: <i>passo per second_tier_matteo</i>}

+ {are_two_entities_together(Matteo, Ettore) && loopableVariables hasnt PaolaDavveroMorta} [character:Matteo]
    -> matteo_talking_second_tier ->    

+ {are_two_entities_together(Matteo, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Matteo]
    -> paola_is_dead_matteo ->
-    

-

-> intro


/* ---------------------------------
Opzioni di dialogo con la persona Matteo
 ----------------------------------*/

=== matteo_talking_second_tier
~ move_locked_entities(false)
-> second_tier_storylets ->
 {debug: <i>Passo per matteo_talking_second_tier</i>}
    //INFO GENERALI//
{loopableVariables has pausaRapportoMatteo: Matteo: Non ho niente da dirti. -> intro.}

    + (loop) {new_this_loop(->loop)} Ettore: Non stai notando nulla di strano?
                ~ inConversazione += Matteo
            Matteo: Intendi il provare da ore una storia senza senso? Prova ad essere più specifico.
                
                + + (opzioneScarica3) {new_this_loop(->opzioneScarica3)}Ettore: Ho come questo senso di deja-vu...
                        Ettore: Abbiamo già vissuto tutto questo, anche se in modo diverso.
                        Ettore: E tende a finire male. So che tende a finire male.
                        Matteo: Quindi sai dirmi cosa sto per dirti?
                            -> advance_time ->

                            + + + (opzioneScarica) {new_this_loop(->opzioneScarica)} Ettore: Ehm, no.
                                Matteo: Anche a me capita spesso, quando devo ripetere queste dannate scene.
                                Matteo: Una volta non riuscivo più a ricordare se ero Matteo, o il personaggio Matteo, e ci ho provato con Elia.
                                Matteo: Ma se vedi che butta male, chiedi una pausa più lunga a Paola.
                                Matteo: O fai finta di svenire, che forse è efficace.
                                Matteo: O dille che ha i capelli fuori posto, e ci guadagnamo mezz'ora sicura!
                                        -> advance_time ->
                                        ~ pauseStorylet = true
                                    -> matteo_talking_second_tier

                            + + + (loop2){matteo_talking_second_tier.opzioneScarica} Ettore: Sì!
                                Ettore: Che una volta ci hai provato con Elia perché non sapevi più se eri Matteo, o il personaggio.
                                Matteo: Uh, interessante.
                                Matteo: Prova a parlarne con Greta. Lei sa un sacco di cose strane.
                                Matteo: Ma se siamo davvero in un loop, allora <joy>vorrei un tuo bacio prima o poi.</joy>
                                Matteo: Almeno una cosa bella continuerà a ripetersi.
                                    -> advance_time ->
                                    ~ pauseStorylet = true
                                    -> matteo_talking_second_tier

                            + + + (loop3) {matteo_talking_second_tier.loop2} [Baci Matteo]
                                Ettore: Scusa, ma mi hai detto in un altro loop di farlo.
                                Ettore: Hai detto che almeno sarebbe capitato di nuovo qualcosa di bello.
                                Matteo: Ok, questa è una cosa che potrei aver davvero detto. Perché <joy>mi piaci da che ti ho visto.</joy>
                                Matteo: E tu stai cercando di fermare tutto questo?
                                Ettore: Sì, perché qualcuno sta per morire.
                                Matteo: Quando avrai risolto il crimine, allora, <joy>ridammi un altro bacio, e portami via da qui.</joy>
                                    -> advance_time ->
                                    ~ pauseStorylet = true
                                    -> matteo_talking_second_tier

                            - - -    
                + + Ettore: Lascia perdere, è solo un'inutile preoccupazione. -> matteo_talking_second_tier
                - -
                -> advance_time ->

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Teo, tu e Paola che rapporto avete?
                    ~ inConversazione += Matteo
        Matteo: <joy>Che cosa carina che mi chiami Teo.</joy>
        Matteo: <hesitate>La conosco poco nulla.
        Matteo: So che è ricca, so che è stronza, e so che è sorella di Elia.
        Matteo: Che tratta costantemente di merda.
        Matteo: Sono qui sostanzialmente per lui.
        Matteo: E un po' perché da sempre vorrei fare l'attore, ma non è di sicuro questo il posto dove venire scoperto.
            -> advance_time ->
            {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
 
            }
            
            + + (lavoro) {zeca_talking_second_tier.money} Ettore: Zeca dice che tu Paola la conosci.
                {
                -   are_two_entities_together(Zeca, Matteo):
                    Matteo: Se vuoi sentire cosa penso davvero, parlami quando lui non è qui.
                    ~ pauseStorylet = true
                            -> matteo_talking_second_tier
                }
                Ettore: Dice che campi alle spalle sue e di Elia.
                {are_two_entities_together(Elia, Matteo): Elia: Le mie spalle sono così <joy>grandi.</joy>}
                Matteo: Lavoro per la sua azienda, che è diverso. Ma non ci ho mai avuto a che fare direttamente.
                Matteo: Però le insinuazioni di Zeca hanno senso: le mie entrate dipendono dal lavoro per lei, e dalle pulizie a casa di Elia.
                Matteo: Ma mi chiedo: perché tutto questo dovrebbe importarti?

                    + + + (opzioneScarica2) Ettore: Sto cercando di conoscervi meglio.
                            Matteo: Allora la prossima volta chiedimi <joy>dove mi piace cenare.</joy>
                            Matteo: <joy>O il colore del mio intimo.</joy>
                                -> advance_time ->
                                ~ pauseStorylet = true
                            -> matteo_talking_second_tier
                    
                    + + + {cb_second_tier_lettera.primoCheck} Ettore: C'è una lettera, una lettera di minacce.
                            Ettore: Sto cercando di capire chi l'ha scritta, e contro chi.
                            {
                                -   are_two_entities_together(Zeca, Matteo) or are_two_entities_together(Paola, Matteo):
                                    Matteo: E lo saprai se mi parlerai quando non ci saranno qui Zeca o Paola.
                                    ~ pauseStorylet = true
                                    -> matteo_talking_second_tier
                            }
                                - - - -(lettera2) Matteo: Solo due persone in questo posto mossono minacciare qualcuno: Paola e Zeca.
                                    Matteo: Ma sono così inutile qui, che dubito qualcuno voglia minacciarmi per qualcosa.
                                    -> advance_time ->
                                    ~ pauseStorylet = true
                                    -> matteo_talking_second_tier

                    + + + (lettera3) {not new_this_loop(->lettera)} Ettore: Per la lettera che ti ho mostrato prima.
                            Ettore: Quella che mi hai fatto mettere via, impaurito da Paola.
                            {
                                -   are_two_entities_together(Paola, Matteo):
                                    Matteo: Sei bellino Ettore, ma è idiota parlarne ora che lei è qui.
                                    ~ pauseStorylet = true
                                    -> matteo_talking_second_tier
                            }
                            
                            Matteo: Non ero impaurito da Paola, ma impaurito per te.
                            Matteo: Quella è la sua calligrafia.
                                -> advance_time ->
                                            {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet    
                   
                            }
                            Ettore: Vorrei capire a chi è indirizzata.
                            Matteo: E perché? Tu sei uno sconosciuto in questo gruppo tossico.
                            Ettore: Perché credo potrebbe succedere qualcosa di brutto.
                            Matteo: E allora, lascia che accada.
                            Matteo: Ci sono cose tra Elia e Paola, tra Paola e Greta, tra Zeca ed Elia che vanno avanti da anni.
                            Matteo: Non sarai tu a risolverle stasera.
                            Matteo: Beviti un goccio di vino, recita quello che devi recitare, e fuggi da qui.
                                -> advance_time ->
                                ~ pauseStorylet = true
                            -> matteo_talking_second_tier

                    + + + (lavoro2) {phone.sindacato} Ettore: Credo che Paola ti stia minacciando[.], per via del sindacato.
                    
                            {
                                -   are_two_entities_together(Paola, Matteo):
                                        Paola: Sindacato? Ancora con quel cazzo di sindacato?
                                        Paola: Matteo: vieni con me!
                                        ~ pauseStorylet = true
                                        ~ move_this_entity_in_a_different_room(Matteo)
                                        ~ move_this_entity_in_a_different_room(Paola)
                                    -> intro
                            }
                            
                          {new_this_loop(->lettera): Ettore: C'è una lettera minatoria, e credo sia scritta da lei.}
                          {not new_this_loop(->lettera): Matteo: Per quella lettera di prima?}
                          Matteo: Sei preoccupato per me?
                            -> advance_time ->
                
                            + + + + (lavoro3) Ettore: Sì, credo che lei possa farti del male.
                                    Matteo: Questa è una cosa tenera, Ettore.
                                    Matteo: Facciamo così: la prossima volta che c'è una pausa e siamo soli, chiedimi di raccontarti tutto, e lo farò.
                                    Matteo: Ora però lascia che mi rilassi un poco.
                                    ~ pauseStorylet = true
                                        -> matteo_talking_second_tier
                            
                            + + + + Ettore: Sì, credo che tu possa farle del male.
                                    Matteo: Beh, se hai già deciso che sono una cattiva persona, che senso ha parlarmi ancora?
                                        ~ loopableVariables += pausaRapportoMatteo
                                        ~ pauseStorylet = true
                                        -> intro

            + + [Cambi argomento] -> matteo_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Matteo, secondo te chi vorrebbe fare del male a Paola?
                    ~ inConversazione += Matteo
                        {
                            -   are_two_entities_together(Paola, Matteo):
                                Matteo: Non è una buona idea parlarne mentre lei è qui.
                                    ~ pauseStorylet = true
                                    -> matteo_talking_second_tier
                        }                    
            Matteo: Credo un bel po' di gente.
            Matteo: Dal cassiere del supermercato alla autista privata.
            Matteo: Dalla postina al tizio che le cura i cani.
            Matteo: Passando poi per il consiglio di amministrazione.
            Matteo: E le famiglie che distrugge con le sua attività.
            Matteo: E i comuni che hanno debiti con lei.
                -> advance_time ->
                        {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
            Ettore: E tra le persone qui presenti?
            Matteo: Un bel po' di gente.
            ~ pauseStorylet = true
                -> matteo_talking_second_tier

    
    
    // OPZIONE PER IL FINALE
    + {primaContraddizione && secondaContraddizione} [È il momento di fermare l’omicida di Paola!] Ettore: Venite tutti, ho bisogno di parlarvi!
    -> arringa_finale

    //SCELTE CONDIZIONALI//
    + {matteo_talking_second_tier.lavoro2 && not new_this_loop(->lavoro2)} Ettore: Posso chiederti perché hai creato un sindacato alla Londar?
        {
            - are_two_entities_together (Matteo, Paola) or are_two_entities_together (Matteo,Elia) or are_two_entities_together: Matteo: Forse non è il momento adatto ora. Chiedimelo quando siamo soli. -> matteo_talking_second_tier
            - else: -> evilJobStorylet
        }

    + (allestimento) {paola_talking_second_tier.allestimento && new_this_loop(->allestimento)} Ettore: Paola dice che tu e Zeca avete litigato nella stanza gialla prima delle prove.
            {
                -   are_two_entities_together(Paola, Matteo):
                    Matteo: Non ne parlo fintanto che lei è qui.
                        ~ pauseStorylet = true
                        -> matteo_talking_second_tier
            }
        Ettore: E che vuole andare a stuzzicare Zeca per capire il perché.
        Matteo: E chi l'ha vista quella fottuta stanza gialla?!?!
            {
                -   are_two_entities_together(Zeca, Matteo):
                    Matteo: Zeca, vieni, dobbiamo parlare subito!
                        ~ move_this_entity_in_a_different_room(Zeca)
                        ~ move_this_entity_in_a_different_room(Matteo) 
                        ~ pauseStorylet = true
                        -> intro
            }        
        Matteo: Quella strega! Devo subito trovare Zeca, sai dove possa essere?
        
            + + {whiteRoomContents hasnt Ettore} Ettore: Credo sia nella stanza bianca.
                    ~ move_entity(Matteo, WhiteRoom)
            + + {greenRoomContents hasnt Ettore} Ettore: Forse nella stanza verde?
                    ~ move_entity(Matteo, GreenRoom)
            + + {yellowRoomContents hasnt Ettore} Ettore: Dovresti trovarlo nella camera gialla.                
                    ~ move_entity(Matteo, YellowRoom)
            + + {redRoomContents hasnt Ettore} Ettore: Quasi certamente nella stanza rossa.               
                    ~ move_entity(Matteo, RedRoom)
            + + Ettore:"Non ho idea di dove sia, mi spiace.
                Matteo: Provo a cercarlo, grazie Ettore!
                    ~ move_this_entity_in_a_different_room(Matteo)
                -> intro
   
    
    //SCELTE CONDIZIONALI OGGETTI//
    + (lettera) {inventoryContents has Lettera && new_this_loop(->lettera)} Ettore: Hai mai visto questa lettera?
        Matteo: Mettila via, subito! Se Paola la trova ti mangia vivo!
    
    + (torta) {inventoryContents has Torta && new_this_loop(->torta)} Ettore: Questa torta l'avete portata tu e Zeca?
        Matteo: Strano: Zeca e io abbiamo preso la roba al supermercato, ma non ricordo questa torta!
        Matteo: Anche perché tutte queste arachidi ucciderebbero Paola.
    
    + (vino) {inventoryContents has BottigliaDiVino && new_this_loop(->vino)} Ettore: Riconosci questa bottiglia di vino?
        Matteo: Mi spiace Ettore, bevo solo roba sotto i tre euro.
    
    + (asma) {inventoryContents has FlaconcinoAsma && new_this_loop(->asma)} Ettore: Sai di chi sia questo flaconcino per l'asma?
        Matteo: Zero totale.
    
    + (sigaretta) {inventoryContents has SigarettaElettronica && new_this_loop(->sigaretta)} Ettore: Hai idea di chi abbia perso questa sigaretta elettronica?
        Matteo: Di Paola. Con Zeca siamo passati a recuperarle le ricariche.
        Matteo: E le abbiamo preso un sapore schifoso, così, pe il piacere di darle fastidio.
    
     + (fotografia) {inventoryContents has Foto && new_this_loop(->fotografia)} Ettore: Hai già visto questa foto?
        Matteo: No.
        Matteo: Ma ti prego, non farla vedere a Zeca.
        Matteo: <fear>Gli spezzeresti il cuore.</fear>

    + [Chiacchiera con Matteo]
        -> esplora_matteo
    + [Te ne vai]
        -> intro
    -
    
    -> matteo_talking_second_tier

= esplora_matteo
{debug: <i>Passo per esplora_matteo</i>}


{
- MatteoTalking > 1: Matteo: Ho bisogno di un po' di privacy ora, Ettore.
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA MATTEO

= first_qn
    ~ MatteoTalking++
                    ~ inConversazione += Matteo
        Matteo: Vivi solo, Ettore?
            + Ettore: Vivo con la persona che amo.
                Matteo: Immagino sia bello, svegliarsi accanto a chi ami.
            + Ettore: Vivo con la mia famiglia.
                Matteo: Spero andiate d'accordo.
            + Ettore: Vivo solo.
                Matteo: Non so perché ma ti immagino con tre gatti e una postazione per i videogiochi!
            + Ettore: Vivo con una coinquilina.
                Matteo: Allora siamo sulla stessa barca!
            -
        Matteo: Io vivo con Greta, sai?
        Matteo: Sono quattro anni a breve, e la adoro.
        Matteo: Per me, lei è famiglia.
        {are_two_entities_together(Greta, Matteo): Greta: E tu lo sei per me, ama!}
        Matteo: Non sempre ci capiamo, ma ormai sappiamo anche come volerci bene.
        -> advance_time ->
                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Matteo: Ad esempio lei sembra sempre negativa e diretta, ma è perché ha avuto una vita di merda.
        Matteo: Di contro passo per quello paziente dei due, ma in realtà sono un ansioso del cazzo.
        Matteo: E così sono io quello che porta rancore, mentre lei perdona tante cose.
        Matteo: Ora siamo un po' preoccupati: il contratto d'affitto sta scadendo.
        Matteo: Il padrone di casa vuole aumentare l'affitto a sproposito.
        Matteo: E le uniche case che stiamo trovando sono a un'ora di bus dal centro.
        Matteo: E per me vuol dire non aver più del tutto una vita.
            ~ pauseStorylet = true
            -> matteo_talking_second_tier 

= second_qn
 ~ MatteoTalking++
                 ~ inConversazione += Matteo
    Matteo: Che pensi di tutta questa situazione, Ettore?
        + Ettore: La recita è tremenda.
            Matteo: Hai ragione, qualcuno dovrebbe fermare Paola.
        + Ettore: Sono confuso, molto confuso.
            Matteo: Se pensi di essere confuso, ricordati che c'è Elia.
        + Ettore: Non hai voglia di uscire da qui?
            Matteo: Il prima possibile. Ma se lo faccio ora, non mi pagano.
        -
    Matteo: Mi chiedevo: se potessi essere da qualche parte, da qualsiasi parte, dove saresti ora?
        + Ettore: A leggere i miei adorati gialli.
        + Ettore: Probabilmente ad alternare videogiochi e pisolini.
        + Ettore: Tra gatti e libri dell'orrore.
        -
    Matteo: {~ Mi piace il tuo modo di ragionare!|C'è posto anche per me?|Posso portare del vino e aggiungermi?}
    Matteo: Per me questa situazione, ora, è utile solo per godersi il dopo, l'essere altrove.
    Matteo: A volte servono momenti come questo, noiosi e vuoti, per ricordarti che esiste ancora qualcosa da chiamare "vita".           
    -> advance_time ->
                {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
    Matteo: E forse nell'ultimo tempo ho pensato così tanto alle cose da fare, da cambiare, <fear>da dimenticarmi di vivere.</fear>
        ~ pauseStorylet = true
        -> matteo_talking_second_tier    

= third_qn
~ MatteoTalking++
                ~ inConversazione += Matteo
    Matteo: Credo... Posso chiederti un favore?
    Matteo: Resteresti qui con me, in silenzio, per qualche secondo?
    Matteo: <fear>C'è qualcosa che mi spaventa, e non riesco a calmarmi.</fear>
        + Ettore: Ho da fare, scusa.
            Matteo: Non ti preoccupare.
                -> advance_time ->
                -> intro
        + Ettore: Certo. Posso fare altro?
            Matteo: No, resta così, vicino.
    Matteo: ...
    Matteo: ...
    Matteo: ...
        -> advance_time ->
                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
    Matteo: Credo di aver capito cosa mi inquieta.
    Matteo: E credo di aver deciso cosa fare.
    Matteo: <joy>Hai un bel cuore Ettore, un gran bel cuore.</joy>
    Matteo: Spero di incontrarti di nuovo, fuori da qui.
        ~ pauseStorylet = true
        -> matteo_talking_second_tier

/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/

=== paola_is_dead_matteo
    
    Matteo: {~ Ho sperato così tante volte che accadesse, e ora che è morta, mi sento solo vuoto.|Dovremmo per lo meno coprire il corpo, povera.|Dovrei aver paura di venire ammazzato anche io, ma sono così <i>invisibile</i>, che rischi corro?|Forse finalmente i genitori di Greta riposeranno in pace.}

    -> advance_time ->
->->

