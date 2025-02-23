=== cb_second_tier_elia ===
{debug: <i>passo per cb_second_tier_elia</i>}
+ {are_two_entities_together(Elia, Ettore) && loopableVariables hasnt PaolaDavveroMorta} [character:Elia]
    -> elia_talking_second_tier -> 


+ {are_two_entities_together(Elia, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Elia]
    -> paola_is_dead_elia ->

-

-> intro


/* ---------------------------------
Opzioni di dialogo con la persona Elia
 ----------------------------------*/

=== elia_talking_second_tier
{debug: <i>Passo per elia_talking_second_tier</i>}
~ move_locked_entities(false)
-> second_tier_storylets ->
{loopableVariables has pausaRapportoElia: Elia: Sei cattivo, vai via! -> intro.}
    //INFO GENERALI//

    + (loop) {new_this_loop(->loop)} Ettore: Elia, non stai notando nulla di strano?
        Elia: In effetti, sì.
        Ettore: <fear>Oh, allora non sto perdendo la testa!</fear>
        Elia: No no, lo sto notando anche io.
        Elia: Fino a stamani, sollevavo tranquillo quel tavolo.
        Elia: Ora ci metto circa due secondi in più.
        Elia: Possibile che stia perdendo la mia forza?
        Elia: O è colpa dei colori? Queste stanze, è colpa di queste stanze!
                -> advance_time ->
                ~ pauseStorylet = true
            -> elia_talking_second_tier


    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Che rapporto hai con Paola?
            -> rapporto_Elia_Paola


    + (omicidio) {new_this_loop(->omicidio)} Ettore: Conosci qualcuno che vorrebbe far male a Paola?
        ~ inConversazione += Elia
        Elia: <fear>Uh, spero non i tizi delle piramidi, vero?</fear>
        Elia: O le lontre giganti.
        Elia: <joy>Naa, loro sono molto tenere.</joy>
        Elia: Paola vorrebbe fare del male a me, ogni tanto.
        Elia: Ma quello succede spesso.
        Elia: Tu però sei gentile con me.
        Elia: <joy>Mi fai due grattini?</joy>
            -> advance_time ->
                        {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
           
            + + (minacce) {zeca_talking_second_tier.love && phone.indagini && elia_talking_second_tier.indagini2} Ettore: E Zeca, potrebbe voler far del male a Paola?
                Ettore: Sapeva delle indagini, e ha detto che farebbe di tutto per proteggerti.
                Elia: No.
                Ettore: Tiene molto a te, no?
                Elia: No. No. No.
                Elia: Lui è il mio socio d'affari, e gli affari si puliscono sempre in famiglia assieme all'acqua del bambino e la ciotola del cane.
                Elia: Lo dice sempre Paola.
                Elia: Oh. <hesitate>Ma forse sono io il cane?
                Elia: O la ciotola?
                Elia: Devo trovare Zeca!
                Elia: <cry>E tu stammi lontano!</cry>
                ~ move_first_entity_to_second_entity_location(Elia,Zeca)
                ~ loopableVariables += EliaSpaventatoPerZeca
                ~ loopableVariables += pausaRapportoElia
                -> advance_time ->
                ~ pauseStorylet = true
            -> elia_talking_second_tier
            + + -> elia_talking_second_tier

    

    // OPZIONE PER IL FINALE
    + {primaContraddizione && secondaContraddizione} [È il momento di fermare l’omicida di Paola!] Ettore: Venite tutti, ho bisogno di parlarvi! -> arringa_finale

    //SCELTE CONDIZIONALI//
    + (indagini2) {greta_talking_second_tier.indagini && not are_two_entities_together(Elia, Zeca)} Ettore: Elia, sapevi che Paola vuole estrometterti dalla Londar?
            ~ inConversazione += Elia
        Elia: <hesitate>Estroflettermi?
        Ettore: Cacciarti.
        Ettore: Rimanere l'unica responsabile.
        Elia: Non ti credo.
        Elia: E quindi ascolterò musica a manetta.
            -> advance_time ->
                        {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
           
            + + {zeca_talking_second_tier.love4} Ettore: ZECAAAAAAA!
                ~ move_first_entity_to_second_entity_location(Elia,Zeca)
                Zeca: <cry>Elia, abbassa la musica, va tutto bene.</cry>
                // ~ start_distracting_music("gigi_dag", Elia)
                Elia: Paola, Paola mi vuole cacciare dall'azienda.
                Elia: Come se fossi un cerbiatto.
                Elia: Come se fossi Bambi.
                Ettore: A dire il vero è la mamm...
                Zeca: Ora ci penso io a te. Vieni, andiamo a fare un paio di flessioni.
                Elia: Ma quelle boom clap, va bene?
                - - -(indagini3) Zeca: Va bene bimbo. Ora andiamo.
                    -> advance_time ->
                   ~ move_this_entity_in_a_different_room(Zeca)
                   ~ move_this_entity_in_a_different_room(Elia)
                    -> intro
        
            + + -> 
            - -
            Elia: E NON MI PARLARE!
            ~ loopableVariables += pausaRapportoElia
            ~ pauseStorylet = true
            -> zeca_talking_second_tier
            
            

    + (allestimento) {notABigSecretPartOneStorylet.allestimento} Ettore: Elia, è vero che tu e Greta avete comprato il vino?
            ~ inConversazione += Elia
        Elia: Esatto. Greta e io abbiamo comprato il vino.
        Ettore: Questa è stata facile!
        Elia: Però.
        Ettore: No! Lascia che questa conversazione sia facile!
        Elia: Sì, però non le abbiamo consegnate.
        Ettore: In che senso?
        Elia: Nel senso di Greta, non nel mio perché non aveva senso nel mio.
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
        Elia: Shot story long...
        Ettore: Long story short?
        Elia: No no. Shot perché Greta voleva sparare una supercazzola a Zeca.
        Elia: Long perché ci sono volute due ore a spiegarmi il perché.
        Elia: E l'ho dimenticato.
        Elia: Ma la cosa sicura è che abbiamo lasciato le bottiglie all'ingresso e non siamo entrati nella sala gialla delle pappe.
        Elia: Greta e io dovevamo chiamare i fornitori.
        Ettore: I fornitori?
            -> advance_time -> 
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Elia: Quelli del pub, del <b>Funny Elia & Greta</b>
        Ettore: Ma non esiste solo nella recita?
        Elia: Sì.
        Ettore: E avete chiamato i fornitori?
        Elia: Sì, sennò poi i comici cosa bevono?
        Elia: Ora che ci penso: non abbiamo chiamato nessun comico.
        Elia: Devo subito comunicarlo a Greta prima che mi mangi vivo!
            -> advance_time -> 
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
            + + {zeca_talking_second_tier.allestimento2} Ettore: Zeca però ha sentito qualcuno nella stanza gialla.
                Ettore: E a suo dire stava scopando.
                - - - (allestimento2) Elia: Naa, Zeca sente sesso ovunque.
                Elia: Pensa che dorme sentendo le balene scopare.
                Elia: E io non ho fatto sesso, no.
                Elia: Mai fatto sesso.
                Ettore: Mai.
                Elia: Mai ora.
                Elia: <hesitate>Mai adesso.
                Elia: Ero a chiamare con Greta.
                    -> advance_time ->
                    ~ pauseStorylet = true
                        -> elia_talking_second_tier
            + + -> elia_talking_second_tier
            - -

    + {iTryToBeAGoodFriendStorylet} Ettore: Prima ho ascoltato una conversazione tra Zeca e Matteo...
            ~ inConversazione += Elia
        Ettore: Ed ero convinto che Matteo fosse tuo amico.
        Elia: Non al passato. Non fosse, ma è.
        Elia: Zeca invece è un collega, abbiamo la BRO assieme.
        Elia: Parlavano di quanto è figa la BRO, vero?!?
        Ettore: No, ehm.
        Ettore: Matteo ha detto a Zeca che deve lasciarti perdere.
        Elia: Quindi è vero che mi fa vincere a carta sasso forbice!
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
            }
        Ettore: Credo più, di lasciarti perdere come persona.
        Elia: Essere una persona è un gioco?
        Elia: Vuol dire che potrei essere un'altra persona?
        Ettore: Beh, credo tu sia ricco abbastanza per farlo ma...
        Elia: Voglio essere Jhonny Deep.
        Elia: Anzi: Cristiano Ronaldo.
        Elia: <cry>Anzi: BoJack!</cry>
        Elia: <joy>Così posso fare il cavallo con Zeca!</joy>
             -> advance_time ->
                                     {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
    
            }
        Ettore: Non è quello che intendevano, Elia!
        Ettore: Matteo ha detto a Zeca di non parlarti più, di lasciare il progetto.
        Ettore: Dice che farai solo stare male Zeca.
        Elia: <hesitate> Ah. Uh. Ih.
        Elia: Ah.
        Elia: Sto facendo del male a Zeca secondo te?
            + + Ettore: Forse lui spera che tu possa amarlo?
                Elia: Ma io lo amo.
                Ettore: Forse non come vuole lui.
            + + Ettore: Al massimo può intontirlo.
                Elia: Quello lo dice anche lui.
                Elia: Poi mi gratta la testa sorridendo e mi dice che sono un bravo ragazzo.
            - -
            -> advance_time ->     
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Elia: Questa cosa da Matteo non me la credevo comunque.
        Elia: <rage>Io<waitrage> sono<waitrage> stato<waitrage> un<waitrage> sacco<waitrage> zitto<waitrage> per<waitrage> Matteo.</rage>
        Elia: Non con Matteo, perché parlo molto, ma per Matteo, sì.
        Elia: Allora ti dico un segreto: Greta ha dato a Matteo molte informazioni sui conti dell'azienda.
        - - (indagini) Elia: Vuole aiutarlo con questa cosa del sindicato, così che Matteo possa sindicare meglio sindicando Paola e venendo sindicato dai colleghi del sindicato.
        Elia: E io l'ho detto a Greta che fa bene, perché nessuno deve indicare i miei amici.
        Elia: Ma possono sindicarli, perché non è scritto diversamente da nessuna parte, no?
            -> advance_time ->
            ~ pauseStorylet = true
                -> elia_talking_second_tier
 
   

    
    //SCELTE CONDIZIONALI OGGETTI//
    + (lettera) {inventoryContents has Lettera && new_this_loop(->lettera)} Ettore: Hai mai visto questa lettera?
            Elia: Ce ne sono tante qui, di lettere.
            Elia: Quale in particolare?
            Ettore: Lo prendo come un "no".
    
    + (torta) {inventoryContents has Torta && new_this_loop(->torta)}Ettore: Sai per chi è questa torta?
            Elia: Per il festeggiato?
            Ettore: Qualcuno è festeggiato?
            Elia: Tu! Sei tu che hai portato la torta!
            Elia: E solo il festeggiato porta la torta.
            Elia: E la mamma del festeggiato.
            Elia: Sei la mamma del festeggiato?
            Elia: Perché avrei bisogno di una mano coi compiti di matematica.
                -> advance_time -> 
    
    + (vino) {inventoryContents has BottigliaDiVino && new_this_loop(->vino)} Ettore: Questo è il vino che avete comprato?
            ~ inConversazione += Elia
            Elia: Gli somiglia molto, ma non ne sono sicuro.
            Elia: Questa cosa che tutte le bottiglie sono uguali mi confonde.
            Elia: E accade con tutti i prodotti.
            Elia: Se vado al supermercato e prendo dello yogurt proteico ad esempio.
            Elia: E poi devo pagare il mio.
            Elia: Come faccio a sapere se sto pagando il mio se al banco frigo sono tutti uguali?
            Elia: Ho lo stesso problema con gli armadietti in palestra.
                -> advance_time -> 
                                        {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
        
            - else: ->->
            }
            Elia: E le ombre.
            Elia: E i riflessi.
            Elia: E i giorni della settimana.
            Elia: E le unghie sul pavimento.
            Elia: E l'idea di concetto.
            Elia: E di concerto.
            Elia: E..
            Ettore: <cry>Vado, vado, vado!</cry>
            ~ pauseStorylet = true
                -> advance_time -> 
    
    + (asma) {inventoryContents has FlaconcinoAsma && new_this_loop(->asma)} Ettore: Sai di chi sia questo flaconcino?
            Elia: Mia sorella!
            Elia: Nel senso che è di mia sorella, non che è mia sorella.
    
    + (sigaretta) {inventoryContents has SigarettaElettronica && new_this_loop(->sigaretta)} Ettore: Sai qualcosa su questa sigaretta elettronica?
            Elia: Che puzza.
            Elia: Che fa male ai testimoli.
            Elia: Che non fa crescere i bambini.
            Elia: Che se Paola me la tira sul naso mi diventa tutto rosso.
            Elia: Una volta l'ha fatto tutto un pomeriggio.
            Elia: Faceva male, <joy>ma rideva e non volevo andare via e renderla triste.</joy>
            ~ pauseStorylet = true
                -> advance_time -> 
    
     + (fotografia) {inventoryContents has Foto && new_this_loop(->fotografia)} Ettore: Guarda questa foto.
            Elia: Mmm.
            Elia: Sembro grasso.
            Ettore: Cosa dici?!?
            Elia: Qui, vedi? Dove la camicia tira.
            Elia: Dovrebbe esserci un deltoide molto carico.
            Elia: Ma invece sembro morbido.
            Elia: Devo assolutamente allenarmi, ora!
            ~ pauseStorylet = true
                -> advance_time -> 
    
    + [Conosci meglio Elia]-> esplora_elia
    + [Ti allontani]-> intro
    -
    
    -> elia_talking_second_tier

= esplora_elia
{debug: <i>Passo per esplora_elia</i>}


{
- EliaTalking > 1: Elia: Scusa ma ho finito le parole della settimana.
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
        ~ inConversazione += Elia
    Elia: Sai che ho una cosa che mi lega a ogni persona qui dentro?
    Elia: Paola è mia sorella, e questa è facile.
    Elia: Ma Paola anche se è alta meno di me, dentro di lei c'è un pallone che si gonfia.
    Elia: Me l'ha detto Greta.
    Elia: E io una volta ho ingoiato un intero pallone e poi l'ho gonfiato.
    Elia: Ricordo poco perché poi sono andato all'ospedale e mi hanno sediato.
    Elia: Non ricordo neanche la sedia.
    Elia: Peccato.
        -> advance_time ->
                                {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
    Elia: E poi sono legato a Zeca, un po' per BRO, perché quel notaio ci ha annotati assieme.
    Elia: E un po' perché per tutti e due la cosa preferita è passare le sere assieme.
    Elia: Io gioco a Mario Kart mentre lui <joy>mi massaggia.</joy>
    Elia: E me piacciono i massaggi, per cui siamo legatissimi così.
    Elia: E Matteo è legato a me perché mi fa le pulizie a casa.
    Elia: E quindi vede un sacco di cose che gli altri non vedono.
    Elia: Come la mia collezione di barrette energetiche e i campioncini di funghi della palestra.
    Elia: <hesitate>Però non so molto di Matteo a dire il vero.
        -> advance_time ->
                                {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
    Elia: Ma quella di cui so meno è Greta.
    Elia: Però siamo legati da una cosa grossa grossa.
    Elia: Siamo tutti e due organi.
    Elia: Io ho perso i miei genitori al supermercato, <fear>e non li ho più trovati.</fear>
    Elia: Lei invece in un incidente: sono caduti da un balcone, legati.
    Elia: <cry>E pensa che è accaduto nella Londar!</cry> Quindi siamo ancora più legati.
    Elia: Ma non capisco come possano averli persi dopo essere caduti e legati da così in alto.
    Elia: E sono sicuro che entro fine serata saremo anche noi legati!!!
        -> advance_time ->
            ~ pauseStorylet = true
        -> elia_talking_second_tier 

= second_qn
 ~ EliaTalking++
         ~ inConversazione += Elia
    Elia: Me triste.
    Elia: Questa serata non sta andando come volevo, sai?
    Ettore: Cosa speravi accadesse?
    Elia: Volevo fare sorridere Paola.
    Elia: Lavora così tanto, tanto.
    Elia: Vorrei solo farla sorridere, ma lei è sempre arrabbiata.
    Elia: Pensi sia arrabbiata con me?
    Elia: Sono un cattivo fratello?
        -> advance_time ->
        ~ pauseStorylet = true
        -> elia_talking_second_tier    

= third_qn
~ EliaTalking++
    Elia: <cry>Centoooooo!</cry>
    Elia: Ormai è un record personale!
    Ettore: Di cosa?
    Elia: Di fiato trattenuto.
    Elia: Zeca mi dice che devo parlare prima di pensare.
    Elia: E che per sicurezza devo contare fino a cento.
    Elia: Ed è difficile parlare senza respirare per contare fino a cento.
    Elia: Però mi aiuta a non pensare, aveva ragione!
    Elia: Lui è sempre molto intelligente!
    -> advance_time ->
    ~ pauseStorylet = true
    -> elia_talking_second_tier



=== rapporto_Elia_Paola
    { shuffle:
    -   -> first_paola
    -   -> second_paola
    -   -> third_paola
    
    }

= first_paola
        ~ inConversazione += Elia
 Elia: Eravamo fratello e sorella.
        Ettore: Questo lo so, ma ci andavi d'accordo? Passavi del tempo con lei?
        Elia: Solo quando eravamo assieme.
        Ettore: Solo quando eri con lei ci andavi d'accordo?
        Elia: No, passo del tempo con lei solo quando sono con lei.
        Elia: Non posso passarlo con lei se non sono con lei, no?
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
 
            }
            + + Ettore: E ti manca?
                Elia: Il tempo?
                Ettore: No, Paola.
                Elia: No, lei è qui con noi.
                Ettore: Non sapevo fossi religioso.
                Elia: Religioso?
                Elia: No no, il collarino è alla coreana, non è da prete.
                Elia: Però una volta ho preso un prete in testa con un pallone.
                Elia: E ora credo morirò all'inferno.
                Elia: Ed è un bene perché sono freddoloso.
                    -> advance_time ->
                    ~ pauseStorylet = true
                     -> elia_talking_second_tier
            
            + + [Cambi argomento] -> elia_talking_second_tier

= second_paola
        ~ inConversazione += Elia
    Elia: Eravamo fratello e sorella.
        Ettore: Questo lo so, ma ci andavi d'accordo? Passavi del tempo con lei?
        Elia: Spesso.
        Ettore: <i>Spesso</i> d'accordo o <i>spesso</i> assieme?
        Elia: Non bastavano i centimetri?
        Ettore: Per cosa?
        Elia: Per lo spessore.
        Elia: Ma sono un tipo musicale, per cui direi "spesso d'accordo".
        Elia: Tengo "spesso assieme" per Zeca.
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Elia: Quante fette di bresaola ci tiro fuori con un chilo di spesso assieme?
            
            + + Ettore: Ti manca Paola?
                Elia: No, non so quanto mi manca di bresaola.
                Elia: Perché se le fette <i>spesso assieme</i>sono più sottili di quelle <i>spesso d'accordo</i> allora mi hai fregato, perché sono due chili che pesano diversamente.
                Elia: Mi fa vedere il pacchetto?
                Ettore: Di bresaola?
                Elia: No ho cambiato idea, mi faccia due etti di festa di tacchino, è più leggera.
                Elia: Ma ha visto Paola?
                Elia: Che vorrei farle una festa ma non col tacchino, con la bresaola.
                Elia: Lei preferisce i sapori forti.
                Elia: Ma devo capire ancora cosa ne pensa il tacchino, della bresaola.
                Elia: Ma mi aveva chiesto qualcosa, vero? A volte mi perdo.
                    -> advance_time ->
                    ~ pauseStorylet = true
                     -> elia_talking_second_tier
            
            + + [Cambi argomento] -> elia_talking_second_tier


    = third_paola
            ~ inConversazione += Elia
        Elia: Un po' complicato, per colpa delle piramidi.
        Ettore: Aiuto.
        Elia: Eh sì, mi serve aiuto.
        Elia: Praticamente sono entrato in questa piramide di fotografi.
        Elia: E la cosa è che dovevo comprare delle macchine fotografiche.
        Elia: E poi rivenderle a altre piramidi per fare una piramide più grande.
        Elia: E a quel punto avrei guadagnato un sacco.
        Elia: <joy>Un sacco di soldi</joy>, non di piramidi.
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    
    
            }
        Elia: Ma devo aver fatto confusione perché ho iniziato a comprare macchine, autonomobili.
        Elia: E a venderle alle fotografie.
        Elia: <hesitate>Che però hanno le idee poco chiare su cosa siano i soldi.
        Elia: E quindi mi sentivo in colpa a insistere e gliele ho regalate, le macchine.
        Elia: E per recuperare un po' di dignità ho iniziato a fare una piramide di fotografie.
        Elia: Ma quelli dell'altra piramide erano <fear>arrabbiati.</fear>
        Elia: E poi è arrivata la polizia a dirmi che ho fatto reato di occupazione di suolo pubblico.
        Elia: Ma io ho occupato una statua, per cui non tocca il suolo.
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Elia: Ma mentre che discutevamo di questa cosa è arrivato un gruppo di lontre giganti.
        Elia: Ero un po' perplesso ma sono state <joy>molto carine.</joy>
        Elia: E hanno iniziato a montare luci, telecamere, e a fare cose.
        Elia: Non ho ben capito, ma si stavano divertendo e gli ho lasciati lontrellare.
        Elia: E altre persone hanno iniziato a portare altre foto, foto con un sacco di animali giganti.
        Elia: E allora ho chiamato i tipi delle piramidi per dire che stavo facendo finalmente bene il mio lavoro.
        Elia: Ma loro ripetevano che mancava uno schema, uno schema e che non mi avrebbero mai pagato.
        Elia: E poi mi son ricordato che Paola è brava coi cruciverba a schema libero.
            -> advance_time ->
                                    {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

            }
        Elia: E ho dato ai tizi delle piramidi il suo numero, ma lei non era contenta.
        Elia: E ora quelli delle piramidi mi dicono che mi lasceranno in mutande.
        Elia: <fear>Paola mi dice che mi lascerà in mutande.</fear>
        Elia: <joy>Le lontre giganti mi dicono che mi lasceranno in mutande.</joy>
        Elia: <hesitate>Tranne quella con la frusta. Quella dice che me le toglierà.
        Elia: E io non so cosa fare.
        Elia: Zeca dice che può mettermi in contatto con la mafia gay.
        Elia: Forse sanno dove parcheggiare le sei Maserati che ho preso per le fotografie.
        Elia: Sono molto confuso, Ettore, molto confuso.
            -> advance_time ->
            ~ pauseStorylet = true
                -> elia_talking_second_tier

/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/

=== paola_is_dead_elia
    
    Elia: {~ Secondo te è già in Paradiso? O con tutti questi morti in guerra sta trovando traffico?|Non credo molto nella morte, sai? Deve esserci la possibilità di fare restart, per forza.|Spero che Zeca non si stia preoccupando troppo per me.|Ricordo che Paola pianse un sacco alla morte di Fufi. Ora starà piangendo per la sua, di morte?}

-> advance_time ->
->->

