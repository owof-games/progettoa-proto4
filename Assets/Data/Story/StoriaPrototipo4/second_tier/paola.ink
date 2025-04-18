=== cb_second_tier_paola ===
{debug: <i>passo per second_tier_paola</i>}
+ {are_two_entities_together(Paola, Ettore) && loopableVariables hasnt PaolaDavveroMorta} [character:Paola]
    -> paola_talking_second_tier->
    
+ {are_two_entities_together(Paola, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Paola]
    -> paola_is_dead ->
-    



-> intro

/* ---------------------------------

Opzioni di dialogo con la persona Paola

 ----------------------------------*/

=== paola_talking_second_tier
    ~ move_locked_entities(false)
    -> second_tier_storylets ->
    {debug: <i>Passo per paola_talking</i>}
    
    //INFO GENERALI//
    + (loop) {new_this_loop(->loop)} [{loop == 0: Chiedi a Paola se ha notato qualcosa di problematico.|Richiedi a Paola se ha notato qualcosa di problematico.}]
            Ettore: Paola, ehm, hai notato nulla di problematico?
            Paola: Io che cerco una biro dopo che non scrivo dal duemila e quattro?
            Paola: Oggetti personali lasciati in giro come se fossero oggetti di scena?
            Paola: Gente che tira parole a caso perché non ricorda uno script basilare?
            Paola: Il mio reflusso che spacca più del solito e mi sento mancare l'aria?
            Paola: Ah no, queste son cose normali quando lavori con dei deficienti.
            Paola: <rage>Dei mentecatti.</rage>
            Paola: Gente a cui dovrebbero strappare ovaie e testicoli perché non si riproducano.
            Paola: L'unica cosa strana qui è che abbia ancora voglia di vivere.
                -> advance_time ->
                ~ pauseStorylet = true
                    -> paola_talking_second_tier

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} [{rapportoPaola == 0: Chiedi a Paola se prova del dolore.|Richiedi a Paola se prova del dolore.}]
        Ettore: Non, ti, forse. Ok. Ti fa male da qualche parte? In modo quasi mortale?
            Paola: Che carino a preoccuparti per me, Ettore.
            Paola: Nulla di particolare, giusto quel mix di raffreddore soffocante.
            Paola: Asma.
            Paola: Emicrania.
            Paola: Reflusso cronico.
            Paola: Nausea.
            Paola: Voglia di bere il mondo per dimenticarmi che quella specie di australopiteco di Elia è mio fratello.
            {are_two_entities_together(Paola, Elia): Elia: Andiamo in Australia?}
            Paola: E la non insolita speranza che qualcuno mi uccida.
            Paola: Hai visto il mio boccettino per l'asma? L'ho comprato giusto stamani, cazzo.
                -> advance_time ->
                ~ pauseStorylet = true
                -> paola_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} [{omicidio == 0: Chiedi a Paola se qualcuno vorrebbe ucciderla.|Richiedi a Paola se qualcuno vorrebbe ucciderla.}] 
            Ettore: C'è, c'è. C'è qualcuno qui che vorrebbe ucciderti?
            Paola: Dipende.
            Paola: Per il patrimonio, molti.
            Paola: Anche se l'unico che può sperare di accederci è Elia.
            Paola: E solo fino a domattina.
            {are_two_entities_together(Paola, Elia): Elia: Poi smetto di esistere?}
            Paola: Per il resto, sono tutti liberi di andarsene.
            Paola: Prima che li uccida io.
            Paola: Sei qui per entrare nella lista dei morti?
                -> advance_time ->
                ~ pauseStorylet = true
                -> paola_talking_second_tier

    

    // OPZIONE PER IL FINALE
    + {primaContraddizione && secondaContraddizione} [È il momento di fermare l’omicida di Paola!] Ettore: Venite tutti, ho bisogno di parlarvi! -> arringa_finale


    //SCELTE CONDIZIONALI//
    +  {zeca_talking_second_tier.allestimento && elia_talking_second_tier.allestimento && new_this_loop(->buffet)}
        [{buffet== 0: Chiedi a Paola se sa chi ha sistemato il buffet.|Richiedi a Paola se sa chi ha sistemato il buffet.}] 
            Ettore: Può essere una domanda strana, ma sai chi si è occupato di sistemare il buffet?
            ~ inConversazione += Paola
            Ettore: Zeca dice che lui e Matteo hanno smollato tutto a Greta.
            {are_two_entities_together(Ettore, Zeca): Zeca: Non è che Zeca dice, è così.}
            Ettore: E Elia dice che lui e Greta aveva altro da fare.
            {are_two_entities_together(Ettore, Greta): Greta: Molto da fare!}
            Paola: Faceva schifo, vero?
            Paola: Il vino troppo amaro.
            Paola: La torta troppo dolce.
            Paola: E Zeca troppo vivo.
            {are_two_entities_together(Ettore, Zeca): Zeca: Mannaggia al...}
            Paola: Cosa che mi stupisce, sinceramente.
                -> advance_time ->
            Ettore: Come mai?
                {
                    - are_two_entities_together(Ettore, Zeca) or are_two_entities_together(Ettore, Matteo): Paola: Richiedimelo quando saremo da soli.
                        ~ pauseStorylet = true
                        -> paola_talking_second_tier
                }
            Paola: Beh, nella stanza gialla Matteo e Zeca si sono urlati contro come se ne andasse dell'intero universo.
            Paola: O come due gatte in calore.
                - - (allestimento) Paola: E Matteo è uscito piangendo.
                Paola: Sinceramente? <joy>Mi masturberò sull'immagine di quella faccina disperata stasera.</joy>
                Paola: L'unica cosa decente di questa serata.
                Paola: Già che ci sono potrei andare da Zeca e stuzzicarlo un po' per capire perché hanno litigato.
                Paola: Magari piange anche quella fighetta.
                - - (buffet)
                    -> advance_time ->
                    ~ pauseStorylet = true
                    -> paola_talking_second_tier

    

    + {liarCallLiarStorylet.indagini && new_this_loop(-> liar)}
        [{liar == 0: Dì a Paola che qualcuno ha dato i suoi dati alla polizia.|Riparla con Paola dei dati personali dati alla polizia.}]
        Ettore: Quindi: qualcuno ha dato tuoi dati personali alla polizia.
        ~ inConversazione += Paola
            Paola: Ecco, così mi si deve parlare: <joy>fuori dai denti.</joy>
            Paola: Niente cazzate del cazzo.
                + + {liar > 1} [Interrompi la conversazione.]
                    ~ pauseStorylet = true
                    -> intro
                + + {liar > 1} [Continui ad ascoltare.]
                + + ->
                - -
            Paola: Come se potessi fare paura.
            Paola: Come se sapere dove vivi, dove vive tua madre e avere la possilibità di ricattare il tuo agente fino al midollo mi rendesse minacciosa.
            Ettore: Eh eh ehm coff coff esatto.
            {
            - are_two_entities_together(Ettore, Zeca) or are_two_entities_together(Ettore, Elia) or are_two_entities_together(Ettore, Greta) or are_two_entities_together(Ettore, Matteo): Paola: Ragazzino, sono sicura che qualsiasi cosa tu voglia dirmi, vorrai dirmela quando saremo soli.
                    -> advance_time ->
                    ~ pauseStorylet = true
                    -> paola_talking_second_tier
            }
            Ettore: ZECA, non io, Zeca sostiene che Greta fosse l'unica persona a poter dare quei dati alla polizia.
            Paola: Zeca sostiene molte cose, Ettore.
                -> advance_time ->
            Paola: Ma su questo potrebbe aver ragione.
            Paola: E nel caso sarebbe la prima volta in cui proverei davvero stima per quella sottoproletaria mezza lesbica.
            Paola: E non parlo di Greta, ma di Zeca.
            Paola: Anche se credo abbia paura più di tutti di questo casino.
            Paola: Perché se cado io, o se cade Elia, la situazione non cambia.
            Paola: Lui perde la sua gallina dalle uova d'oro.
            Paola: Il coglione palestrato da spremere fino al midollo per un progetto inutile.
            Paola: E a quel punto cosa gli resta se non tornare a farsi pagare per le pompe all'Autogrill?
                -> advance_time ->
                - - (money)  Paola: Elia per Zeca è la gallina delle uova d'oro, ma di galline non se ne trovano due in questa vita.
                Paola: E a me è toccato essere la gallina di me stessa.
                Paola: Certo, la morte dei miei genitori mi ha dato una grossa mano.
                Paola: Ma sapevi che Zeca si è fatto sbiancare il buco del culo?
                Paola: Come se a mio fratello potesse piacere un frocetto.
                Paola: Anche se è così stupido da non capire la differenza tra due tette e due chiappe.
                Paola: Tra me e me: credo che Elia sia ancora vergine.
                Paola: <joy>Piccola puttanella.</joy>
                - - (liar) 
                    -> advance_time ->
                    ~ pauseStorylet = true
                    

    + {zeca_talking_second_tier.allestimento2 && new_this_loop(-> foto3)}
        [{foto3 == 0: Chiedi a Paola se si è masturbata nella stanza gialla.|Richiedi a Paola se si è masturbata nella stanza gialla.}]
                Ettore: <hesitate>Per caso ti sei tipo masturbata nella sala gialla?
                ~ inConversazione += Paola
                Paola: Ettore. Per masturbarmi mi serve una mezz'ora di silenzio.
                Paola: E un po' di popper.
                Paola: E il mio amico vibratore.
                Paola: Ma anche quelle tue belle manone potrebbero essere utili.
                Paola: Ma dato che non sei così coglione, chi ti ha messo in testa questa cazzata?
                Ettore: Non voglio creare pro-
                Paola: <cry>DIMMELO!</cry>
                    -> advance_time ->
                Ettore: Zeca.

                {
                    - picture == false: 
                        -> foto
                    - picture == true:
                        Paola: Bene. Ora levati di culo.
                        -> advance_time ->
                        ~ pauseStorylet = true
                        -> intro
                        
                }
                    - -(foto)
                    Paola: Bravo bimbo.
                    Paola: E i bravi bimbi meritano un premio.
                    Paola: Se allontani Greta da questa stanza o se passi quando non c'è, ti darò il tuo premio.
                    {are_two_entities_together(Paola, Greta): Greta: Cos?!?}
                    Paola: Un premio che farà felice anche quella merdaccina di Zeca.
                    {are_two_entities_together(Paola, Zeca): Zeca: Ehi!}
                    - - (foto3) Paola: Fai il tuo dovere, <joy>mio cagnolino.</joy>
                    -> advance_time ->
                    ~ pauseStorylet = true
  

    * (foto2) {greta_talking_second_tier.foto2 && not are_two_entities_together(Paola, Greta) && new_this_loop(-> foto2)} Ettore: Siamo soli, hai qualcosa per me?
            ~ inConversazione += Paola
            Paola: Bene Ettore, è arrivato Babbo Natale per te.
            Paola: Poi dicono che sono cattiva.
            Paola: Non è bello far del male agli altri.
            Paola: Non davanti a loro, che poi piangono o urlano e che fatica.
            Paola: Eccoti una bella foto di lei ed Elia due secondi prima di scopare nel loro pub.
            Paola: Credo che Zeca apprezzerà molto.
            Paola: E smollerà mio fratello.
            {
            - LIST_COUNT(inventoryContents) > 0:
            ~ throw_exception("Paola: Peccato tu abbia le mani piene. Torna quando non avrai altro, bimbo.")
            - else:
                ~ inventoryContents += Foto
                ~ picture = true
            }
            
            -> advance_time ->
            ~ pauseStorylet = true
                
    
    * {greta_talking_second_tier.foto2 && not are_two_entities_together(Paola, Greta) && not new_this_loop(-> foto2) && inventoryContents==()}
        Ettore: Ora ho spazio per la foto.
        ~ inConversazione += Paola
        {new_this_loop(-> foto2): Paola: Come lo sai? Uh, chi se ne frega.|Paola: Bravo bimbo.}
        Paola: Un bravo bimbo fa mamma Paola felice.
        Paola: Eccoti il tuo premio.
            ~ inventoryContents += Foto
            ~ picture = true
            -> advance_time ->
            ~ pauseStorylet = true
        

                
    //SCELTE CONDIZIONALI OGGETTI//
    + (minacce) {inventoryContents has Lettera && new_this_loop(->minacce)}
    [{minacce == 0: Mostra la lettera a Paola.|Mostra di nuovo la lettera a Paola.}]
            Ettore: Hai mai visto questa lettera?
            Paola: Non c'ho cazzi Ettore, dammi qui e dopo ci butto un occhio.
                ~ inventoryContents -= Lettera
                ~ objectStorageContents += Lettera
    
    + (torta) {inventoryContents has Torta && new_this_loop(->torta)}
    [{torta == 0: Mostra la torta a Paola.|Mostra di nuovo la torta a Paola.}]
            Ettore: Hai idea di chi abbia preso questa torta?
            Paola: Qualcuno che vuole uccidermi?
            Paola: Scherzo.
            Paola: Ma pensavo tutti sapessero che sono allergica alle arachidi, mortalmente. E questa è piena di crema d'arachidi.
            Paola: Fortuna che oramai ne riconosco l'odore.
            Paola: Pensa che da piccola sono andata in coma per tre giorni.
            Paola: Per risvegliarmi e trovarmi davanti Elia che mi chiedeva: Ma ora sei Cristo?
            Paola: Ora sei resuscitata, come Vegeta?
                -> advance_time ->
                ~ pauseStorylet = true
    
    + (vino) {inventoryContents has BottigliaDiVino && new_this_loop(->vino)}
    [{vino == 0: Mostra la bottiglia di vino a Paola.|Mostra di nuovo la bottiglia di vino a Paola.}]
            Ettore: Che, uhm, che sai di questa bottiglia?
            Paola: <joy>Amo da morire questo vino.</joy>
            Paola: E che per questo spero ce ne siano almeno altre tre bottiglie da qualche parte.
        
    + (asma) {inventoryContents has FlaconcinoAsma && new_this_loop(->asma)}
    [{asma == 0: Mostra il boccettino dell'asma a Paola.|Mostra di nuovo il boccettino dell'asma a Paola.}]
            Ettore: Ho trovato questo.
            Paola: <joy>Oh, grazie al cielo!</joy>
            Paola: Non sapevo più dove diavolo fosse finito.
            Paola: Tra polvere e muffa in questo posto, senza potrei morire.
                ~ inventoryContents -= FlaconcinoAsma
                ~ objectStorageContents += FlaconcinoAsma
            Paola: Ma è vuoto! Come cazzo è possibile che sia vuoto, che era nuovo?
    
    + (sigaretta) {inventoryContents has SigarettaElettronica && new_this_loop(->sigaretta)}
    [{sigaretta == 0: Mostra la sigaretta elettronica a Paola.|Mostra di nuovo la sigaretta elettronica a Paola.}]    
            Ettore: Sai chi fuma qui tra noi?
            Paola: Erba? Zeca.
            {are_two_entities_together(Paola, Zeca): Zeca: Solo per dormire!}
            Paola: Oppio? Matteo.
            {are_two_entities_together(Paola, Matteo): Matteo: E chi se lo può permettere?}
            Paola: Tabacco? Greta.
            Paola: Vorrei capire di cosa è fatto Elia per essere così cretino, invece.
            Paola: Io vivo di sigaretta elettronica. Adoro i suoi sapori chimici, la possibilità di fumarla ovunque.
            Paola: Ed è esattamente quella che hai in mano.
                ~ inventoryContents -= SigarettaElettronica
                ~ objectStorageContents += SigarettaElettronica
            Ettore: Ma non si può fumare ov...
            Paola: Ah, finalmente! Quanto mi sei mancata!
                -> advance_time ->
                ~ pauseStorylet = true
      
    
    + (fotografia) {inventoryContents has Foto && new_this_loop(->fotografia)}
    [{fotografia == 0: Mostra la fotografia a Paola.|Mostra di nuovo la fotografia a Paola.}]      
        {inventoryContents has Foto && new_this_loop(->fotografia)} Ettore: Guarda questa foto.
            Paola: Ettore, ho di meglio da fare, sloggia.
                ~ pauseStorylet = true

    + [Conosci meglio Paola.]
        -> esplora_paola
    + [Lascia la conversazione.]
        -> intro
    -
    
    -> paola_talking_second_tier

= esplora_paola
{debug: <i>Passo per esplora_paola</i>}


    {
    - PaolaTalking > 1: Paola: Bimbo, sloggia ora, grazie.
        -> advance_time ->
        -> intro
    - else:
        { shuffle:
        -   -> first_qn
        -   -> second_qn
        -   -> third_qn
        
        }
    }

//DOMANDE SUllA PERSONA PAOLA

= first_qn
~ PaolaTalking++
        ~ inConversazione += Paola
    
    Paola: So che la gente mi odia.
    Paola: Ma è il peso di essere una donna arrivata.
    Paola: Devi fare l'uomo, più dell'uomo.
    Paola: Se sei gentile penseranno che sei debole, e se passi per debole ti piegano in due e ti gettano nell'umido.
    Paola: Un lusso che non posso permettermi, Ettore.
    Paola: E quindi l'unica cosa che mi rimane e prendere tutti a calci.
    Paola: E sai qual è la cosa dolorosa?
    Paola: <joy>Che mi piace.</joy>
        -> advance_time ->
    Paola: <joy>Mi piace umiliarvi.</joy>
    Paola: Mi piace vedervi diventare piccoli davanti al mio odio.
    Paola: <joy>Licenziarvi solo perché posso.</joy>
    Paola: Sapere che perderete casa solo perché esisto.
    Paola: Ed è una cosa terribile perché non posso manco passare per quella che è stronza perché lo chiede la società.
    Paola: Ne ho incontrate molte, Ettore. Pecore nel corpo di manager pseudodominanti.
    Paola: Ma io non sono come loro.
    Paola: <joy>Io vivo del vostro sangue.</joy>
            -> advance_time ->
            ~ pauseStorylet = true
        -> paola_talking_second_tier

= second_qn
 ~ PaolaTalking++
         ~ inConversazione += Paola
        
        Paola: I poveri hanno perso la lotta di classe, l'hanno persa quando li abbiamo convinti che fosse roba del passato.
        Paola: Risolta con la fast fashion e la celebrità social.
        Paola: Ma il tuo piccolo cervellino proletario non può capire quello che sto dicendo vero <cry>EttorAAAAAAA!</cry>
            + {second_qn > 1} [Interrompi la conversazione.]
                ~ pauseStorylet = true
                -> intro
            + {second_qn > 1} [Continui ad ascoltare.]
            + ->
            - 
        Paola: <cry>Non voglio morire non voglio morire non voglio morire non voglio.</cry>
        Ettore: Come, scusa?!?
        Paola: <cry>L'aria manca, presto saremo cenere.</cry>
        Paola: <cry>Lei attende silente nell'ombra.</cry>
        Paola: <cry>AAAAAAAAAAAAAAAAAAAA!</cry>
                -> advance_time ->
        Paola: <fear>Mi urla nelle orecchie.</fear>
        Paola: <fear>Mi dice che merito di soffrire in eterno.</fear>
        Paola: <fear>Per le armi che ho finanziato.</fear>
        Paola: <fear>Per il corpo di suo figlio carbonizzato sulla spiaggia.</fear>
        Paola: <fear>Per il mare tormentato dal suo eterno dolore.</fear>
        Paola: <fear>"Terrore sei e terrore tornerai".</fear>
        Paola: Toglimela dalla testa Ettore.
        Paola: <rage>TI<waitrage> HO<waitrage> DETTO<waitrage> DI</rage> 
            -> advance_time ->
        Paola: <rage>TOGLIMELA</rage> 
        Paola: <rage>DALLA</rage> 
        Paola: <rage>TESTA!!!</rage> 
        Paola: <cry>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARGH!</cry>
        Ettore: Paola?
        Paola: ...
        Paola: Già. Vai a condividere il tuo giornalino comunista su Instagram, vai bimbo.
                -> advance_time ->
                ~ pauseStorylet = true
        -> paola_talking_second_tier    

= third_qn
~ PaolaTalking++
        ~ inConversazione += Paola
    
    Paola: Sai chi è il mio mito?
    Paola: Ayn Rand.
    Paola: Ma sai la cosa più bella?
    Paola: Che trascenderò la sua politica.
    Paola: Farò opere teatrali più brutte di <i>The Lady</i>.
    Paola: Così che mi citino e memino ridendo di me.
    Paola: E intanto le mie idee invaderanno il mondo un pezzo alla volta.
    Paola: Ingenui e innocenti pezzi di meme e reel e stories che ti ricorderanno che sei fai schifo è perché te lo meriti.
        -> advance_time ->
    Paola: Basta col buonismo.
    Paola: Ma sai perché amo Rand?
    Paola: Perché dai suoi errori ho imparato come vincervi tutti.
    Paola: Gli eroi dei suoi libri sono privi di difetti e molto molto ricchi.
    Paola: Per questo non piacciono, nessuno ci si ritrova.
    Paola: Non assomigliano a nessuna persona reale, perché le persone reali sono schifose e ridicole.
    Paola: Con questa recita del cazzo risulterò ridicola, schifosa. E allora avrò vinto, Ettore.
    Paola: E a quel punto potrete temermi.
            -> advance_time ->
            ~ pauseStorylet = true
        -> paola_talking_second_tier



/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/

=== paola_is_dead
     Ettore: {~ Non c'è dubbio, è morta|Il corpo è ancora caldo|Cosa è giusto fare, adesso?}
        + (briciole) [Ci sono tracce di briciole]
            Ettore: Sono rimasugli all'angolo della bocca. Forse qualcosa di dolce.
            -> loop_reset
        + (sigaretta) [Controlli la sigaretta elettronica]
            Ettore: Il dispenser del liquido è completamente svuotato.
            -> loop_reset
        + (asma) [Ispezioni il boccettino dell'asma]
            Ettore: Paola lo stringe ancora forte in pugno, come fosse un'arma. O un'ancora di salvezza.
            -> loop_reset
        + (vino) [Esamini la boccia di vino]
            Ettore: Rimane solo un goccio sul fondo. Le labbra di Paola hanno lo stesso colore.
            -> loop_reset
        + Lascio perdere
            -> intro
        -

-> paola_is_dead

