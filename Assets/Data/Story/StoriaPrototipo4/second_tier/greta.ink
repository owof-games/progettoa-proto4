=== cb_second_tier_greta ===
{debug: <i>passo per first_tier_greta</i>}
+ {are_two_entities_together(Greta, Ettore)} [character:Greta] 
    -> greta_talking_second_tier->    

+ {are_two_entities_together(Greta, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Greta]
    -> paola_is_dead_greta ->
-    

-

-> intro

/* ---------------------------------

Opzioni di dialogo con la persona Greta

 ----------------------------------*/

=== greta_talking_second_tier
 {debug: <i>Passo per greta_talking_second_tier</i>}
 {loopableVariables has pausaRapportoGreta: Greta: ...}
    
    //INFO GENERALI//
    
    + (loop) {new_this_loop(->loop)} Ettore: Greta, secondo te qui è tutto normale?
            Greta: Sinceramente, ho la sensazione che stia per accadere qualcosa di terribile.
            Ettore: Anche io. Come se l'avessi già vissuta, questa cosa.
            Greta: Non so se ti è mai capitata una cosa tipo: sei nel letto e ti svegli la notte, e sai che qualcuno ti sta osservando.
            Ettore: A volte, quando ero più piccolo.
            Greta: E l'armadio è aperto e sei sicura di averlo chiuso prima di andare a dormire perché ne hai ancora paura anche se hai trentasei anni.
            Greta: E poi una gruccia casca a terra.
            Greta: E il letto trema.
                -> advance_time ->
            
            + + (dejavu) {matteo_talking_second_tier.loop2} Ettore: In realtà pensavo più a dei loop, e Matteo crede tu sia la persona giusta con cui parlarne.
                    Greta: So tutto sui loop!
                    Greta: La mia teoria preferita è che siano seconde possibilità.
                    Greta: Occasioni di non ripetere errori che hai commesso in altri tempi, altre vite.
                    Ettore: E se non ho commesso nulla di male?
                    Greta: Tutti commettono qualcosa di terribile almeno una volta nella vita.
                    Greta: Ma potrebbe anche darsi che tu sia bloccato nel loop di qualcun altro.
                    Greta: Qualcuno con un senso di colpa o un dolore così grande da bloccare spazio e tempo.
                        -> advance_time ->
                        {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet
                        }

                    Ettore: E c'è un modo per romperlo?
                    Greta: Credo sia un po' come coi fantasmi.
                    Greta: Permetti alla persona di espiare le sue colpe.
                    Greta: O impediscile di fare l'errore che la tormenta.
                    Ettore: E se non ci dovessi riuscire?
                    Greta: Beh: hai l'occasione di fare quello che vuoi senza pagarne le conseguenze, perché tanto tutto si resetta.
                    Greta: Goditela!
                    Greta: E se siamo in loop, uccidimi: quante occasioni ci sono di morire due volte?
                        -> advance_time ->
                            -> greta_talking_second_tier
            
            + + Ettore: Perché temo che finirà molto male?
                    Greta: E compare una luce dalla cucina, flebile e lontana.
                    Greta: E allora ricordi.
                    Greta: Ricordi che sei anni prima avevi offerto la tua anima in cambio di un contratto a tempo indeterminato.
                    Greta: E Satana ti ha detto che di questi tempi il massimo che ti poteva promettere è una partita Iva.
                    Greta: E hai accettato. E lui ti ha detto che te la saresti goduta per sei anni.
                    Greta: E ora è tempo di riscuotere.
                    Greta: E allora gli proponi uno scambio, un'altra anima. E lui accetta.
                        -> advance_time ->
                        {
                            - currentTime >= 600:
                            -> paolaIsDeadStorylet    
                        }

                    Greta: Ma scusa, mi sono persa un attimo.
                    Greta: Bella maglietta, comunque.
                        -> greta_talking_second_tier
            
            + + Ettore: Mi spiace ma non sono pronto per questa conversazione. -> greta_talking_second_tier

    
    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Quindi tu lavori per Paola?
            Greta: Per ora, sembrerebbe di sì.
            Greta: Ma con Paola ogni giorno è l'antiNatale: ti svegli e avrai qualcosa di meno a sorpresa.
            Greta: Prima o poi mi venderà qualche organo senza che me ne renda conto.
            -> advance_time ->
            
        + + {phone.indagini} Ettore: Non ti preoccupano le indagini?
            Greta: Le indagini sulla Londar?
            Greta: Non particolarmente.
            Greta: Paola è una che cade in piedi sempre.
            Greta: E la caduta è attutita da qualche decina di cadaveri.
            Greta: E a questo giro, il corpo sarà quello di Elia.
            Ettore: In che senso?
            - -(indagini) Greta: Beh: Paola sta cercando far estromettere Elia dalla Londar.
                -> advance_time ->
                {
                    - currentTime >= 600:
                    -> paolaIsDeadStorylet
                }
            Greta: Sostiene di avere delle prove che la condotta illegale sia sua responsabilità.
            Greta: Domattina ci sarà un incontro straordinario con il consiglio di amministrazione.
            Greta: E se i conti sono stati fatti per bene, Elia ricerverà la convocazione domani, via lettera, esattamente con venti minuti di ritardo.
            Greta: Non che cambi molto: l'ultima volta che si è visto in azienda è perché aveva un appuntamento con una stagista.
            Greta: Paola l'ha licenziata il giorno dopo.
                -> advance_time ->
                 -> greta_talking_second_tier
    
        + + {elia_talking_second_tier.indagini} Ettore: E che ne pensa Paola delle informazioni che hai passato a Matteo?
            Greta: Quali informazioni?
            Ettore: Piccoli segreti utili a rafforzare il suo lavoro di contrattazione col sindacato.
            Greta: Dimmi: è stato lui a dirtelo?
            Ettore: No, Elia.
            Greta: Ahah piccolo infame. Piccolo schifoso infame.
            Greta: Secondo te chi si rafforza se Paola si mostra fallibile?
                + + + Ettore: Gli azionisti?
                + + + Ettore: Il consiglio di amministrazione?
                + + + Ettore: Il resto dell'umanità?
                - - -
                -> advance_time ->
                {
                    - currentTime >= 600:
                    -> paolaIsDeadStorylet    
                }

            Greta: Elia.
            Greta: Almeno fino a domattina, Elia è ancora a metà proprietario dell'azienda.
            Greta: E se Paola capitola, lui finisce diritto in consiglio di amministrazione.
            Ettore: Quindi cosa mi stai dicendo?
            - -(indagini2) Greta: Elia sta usando l'amicizia con Matteo per usare il sindacato contro Paola.
                
                + + + Ettore: Perdonami, ma Elia non mi sembra così macchiavellico.
                        Greta: Vedo che sei sveglio, Ettore.
                        Greta: Ma la maestra è stanca e ti lascia un compito per casa: chi ha così influenza su Elia da trattarlo come una marionetta?
                        Greta: E per quale vantaggio?
                    -> advance_time ->
                        -> greta_talking_second_tier
                        
                + + + Ettore: Questo però non risponde alla mia domanda: hai passato le informazioni a Matteo?
                        Greta: Mmm, mi stavi quasi simpatico, Ettore, quasi.
                        Greta: Ma non mi piace chi mi accusa di cose a caso.
                        Greta: Vattene e non parlarmi più!
                        ~ loopableVariables += pausaRapportoGreta
                    -> advance_time ->
                        -> intro
                - - - 
    
        + + {liarCallLiarStorylet.indagini} Ettore: Per questo avrebbe senso tradirla il prima possibile?
                Greta: Cosa vorresti dire?
                Ettore: Zeca sostiene che la polizia abbia avuto dati molto molto personali su Paola.
                Ettore: Cose che solo la sua segretaria potrebbe sapere.
                Greta: E se anche fosse?
                Greta: Qualcuno ha tutto, tu non hai niente, e ti si apre lo spiraglio per un cambiamento, per un vantaggio.
                Greta: Al posto mio cosa avresti fatto?
                    -> advance_time ->
                    {
                        - currentTime >= 600:
                        -> paolaIsDeadStorylet    
                    }
                    + + + Ettore: La fiducia non si tradisce, mai.
                        Greta: Deve essere bello vivere nella tua torre del privilegio.
                        Greta: Ma il mondo reale non funziona così.
                        Greta: Soprattutto non con i ricchi del cazzo.
                        Greta: Hanno così poca considerazione di noi da non ritenerci manco umani a volte.
                        Greta: Per loro tutto è un gioco, perché tanto non possono mai davvero perdere.
                        Greta: Io ho già perso mille volte, e sinceramente son stanca.
                        Greta: E stanca di te.
                        Greta: Non mi parlare più, fighetto del cazzo.
                            ~ loopableVariables += pausaRapportoGreta
                            -> advance_time ->
                                -> intro
                    
                    + + + Ettore: Avrei cercato di ottenere ogni minimo vantaggio.
                        Greta: Esatto.
                        Greta: Immagino anche tu venga dal nulla, e per questo puoi capirmi.
                        Greta: Non so cosa potrà esserci dopo Paola, ma peggio non potrà essere.
                        Greta: E per Matteo è lo stesso.
                        Greta: Viviamo assieme da anni, sai? Ed è l'unica persona in tutta la mia vita che mi abbia mai davvero capito.
                        Greta: Ha un enorme senso della giustizia.
                        Greta: E sa anche che viviamo in un mondo profondamente ingiusto.
                            -> advance_time ->
                            {
                                - currentTime >= 600:
                                -> paolaIsDeadStorylet    
                            }

                        Greta: E che per questo a volte vanno fatte cose, anche crudeli, per un bene più grande.
                        Greta: Paola ha già avuto tutto dalla vita.
                        Greta: A parte un cuore.
                        Greta: Se anche ora perdesse la sua fottuta azienda, ha abbastanza soldi per comprarsi il Molise e farci una gigantesca casa vacanze.
                        Greta: Ti sembra giusto?
                        Greta: Ci sono famiglie che muoiono di fame per colpa sua.
                        Greta: A questo mondo non c'è giustizia.
                        Greta: E quando non c'è giustizia, l'unica cosa che rimane per sopravvivere è la violenza.
                            -> advance_time ->
                                -> greta_talking_second_tier
                        
        + + Ettore: Ripensandoci, non ho altro da chiederti. -> greta_talking_second_tier

    
    + (omicidio) {new_this_loop(->omicidio)} Ettore: Secondo te qualcuno potrebbe volere del male a Paola?
            Greta: Passa cinque minuti con lei e avrai la tua risposta.
            Ettore: Potrei odiarla così tanto da volerla uccidere?
            Greta: No dai, per quello bastano cinque minuti.
            + + Ettore: E qui con cosa la si potrebbe uccidere?
                Greta: Girl, stai chiedendo ad una appassionata di true crime come commettere un omicidio, in questo posto?
                Greta: Mmm, fammi pensare.
                Greta: Morte violenta o qualcosa di più subdolo?
                    -> advance_time ->
                    {
                        - currentTime >= 600:
                        -> paolaIsDeadStorylet    

                    }

                    + + +  Ettore: Violenza, dolore, terrore.
                                Greta: Beh, allora hai il mondo qui dentro.
                                Greta: Vetri, come quelli della finestra, o la bottiglia del vino.
                                Greta: Botte in testa con le gambe traballanti del tavolo, con le seggiole.
                                Greta: O schiacchiandole la testa nella porta ripetutamente.
                                Greta: O un classico strangolamento.
                                Greta: Oppure affondandole nel collo limette da unghie, pugnali, spiedini.
                                    -> advance_time ->
                                    {
                                        - currentTime >= 600:
                                        -> paolaIsDeadStorylet    
                                    }

                                Greta: A proposito: nella recita il colpevole dovrebbe essere Zeca, geloso perché la ama e lei si sposa, e l'ha uccisa con il pugnale di Matteo per incolparlo.
                                Greta: Un po' di sano e tradizionale incesto tra ricchi.
                                Greta: Che mi dovrebbe far fare delle domande sul rapporto tra Paola ed Elia.
                                Greta: Ma comunque non ha senso per nulla.
                                Greta: Quando chiudiamo la recita mostrati sorpreso e dì a Paola che è un genio.
                                Greta: Così ti sgancia un bonus sulla paga, sicuro.
                                Greta: Poi ci sarà tempo per riscrivere quel disastro.
                                    -> advance_time ->
                                        -> greta_talking_second_tier
                                    
                    + + + Ettore: Suuuubdolo!
                            Greta: Adoro!
                            Greta: Allora, fammi pensare.
                            Greta: Abbiamo dovuto mettere in giro del veleno per topi perché beh, ci sono i topi.
                            Greta: In realtà è più difficile da farlo ingerire di quanto non ti facciano credere al cinema.
                            Greta: Ma con un vino così pesante come quello che c'era stasera, forse forse ce la potresti fare.
                            Greta: Oppure c'è qualcosa di ancora più interessante.
                            Greta: Sapevi che la nicotina è un veleno terribile?
                                -> advance_time ->
                                {
                                    - currentTime >= 600:
                                    -> paolaIsDeadStorylet    

                                }

                            Greta: E grazie alle sigarette elettroniche ora è accessibile a tutti a poco?
                            Greta: Di media bastano 60 mg di nicotina per uccidere una persona.
                            Greta: Le ricariche della pod mod di Paola arriva a 18 mg.
                            Greta: Bastano tre ricariche per ucciderla.
                            Greta: E tu dirai: "Ma chi fuma così tanto?"
                            - -(allestimento2) Greta: Ed ecco la cosa divertente: che grazie alle sigarette elettroniche ora basta versare il veleno sulla pelle e bang, è fatta! Puoi uccidere qualcuno.
                            Greta: Grazie, evoluzione tecnologica!
                            Greta: Ma poi per me c'è il colpo di genio vero e proprio.
                                -> advance_time ->
                                {
                                    - currentTime >= 600:
                                    -> paolaIsDeadStorylet    

                                }

                            Greta: Un omicidio su misura.
                            Greta: Paola è allergica all'acido acetilsalicilico.
                            Greta: Le dà delle botte d'asma micidiali.
                            Greta: Che già insomma, ne soffre di suo.
                            Greta: E allora metti che le fai prendere una bella aspirinetta o qualcosa del genere.
                            Greta: E le tieni lontano il suo flaconcino dell'asma.
                            Greta: E lei manco riesce a urlare perché non respira.
                            Greta: E adios!
                                -> advance_time ->
                                {
                                    - currentTime >= 600:
                                    -> paolaIsDeadStorylet    

                                }

                            Greta: Che ne pensi?
                                + + + + Ettore: Che non devo farti arrabbiare, mai.
                                    Greta: Bravo ragazzo!
                                         -> greta_talking_second_tier
                                + + + + Ettore: Stai pianificando di ucciderla?
                                    Greta: Mmm, no, sono solo fantasie da tempo libero.
                                         -> greta_talking_second_tier
                    
            + + Ettore: Mmm, vedremo.
                -> greta_talking_second_tier

    + [Conosci meglio Greta]-> esplora_greta
    
    + [Lascia la conversazione]-> intro
    

    // OPZIONE PER IL FINALE
    + {primaContraddizione && secondaContraddizione} [È il momento di fermare l’omicida di Paola!] Ettore: Venite tutti, ho bisogno di parlarvi! -> arringa_finale


    //SCELTE CONDIZIONALI//

    + (love) {trueLoveStorylet && new_this_loop(->love)} Ettore: Sapevi della relazione tra Elia e Zeca?
            Greta: Quell'obbrobrio che chiamano "Bro"?
             + + Ettore: Ah ah sì, esatto, proprio quello.
                    Greta: Non fosse per i soldi che arrivano dalla Londar, sarebbero tutti e due falliti da mesi.
                    Greta: Dio, Elia è un tale cucciolo, ma è incapace di vivere.
                    -> greta_talking_second_tier
             
             + + Ettore: No, che stanno assieme. Romanticamente.
                    Greta: Ah.
                    Greta: Ah.
                    Greta: Questa cosa mi è nuova.
                    Greta: Ne sei certo?
                    Ettore: Sì, ho sentito Elia dire a Zeca che lo ama.
                    Greta: LOL.
                    Greta: Me sfigata che credo ancora agli uomini.
                    Greta: Sarà pure un bambinone, ma anche Elia alla fine fa parte di quella maledetta specie.
                        -> advance_time ->
                        {
                                - currentTime >= 600:
                                -> paolaIsDeadStorylet    

                            }

                        + + + Ettore: E come ti senti ora?
                                Greta: Tradita.
                                Greta: Usata.
                                Greta: Mi ha promesso amore.
                                Greta: Mi ha regalato le piattole.
                                - -(indagini3) Greta: E io che, stupida, coprivo i furti di denaro di Elia in azienda.
                                Greta: Convinta che ci avremmo costruito una casa assieme, con quei soldi.
                                 Greta: Ho bisogno di un poco di privacy Ettore, scusami.
                                ~ loopableVariables += pausaRapportoGreta
                                    -> advance_time ->
                                -> intro
                        
                        + + + Ettore: Quindi, lui ti piace davvero?
                                Greta: Non mi giudicare.
                                Greta: Sono consapevole che sia un idiota.
                                Greta: Ma in un mondo che fa sempre più schifo, la sua leggerezza mi faceva bene al cuore.
                                Greta: Ma ora è tutto finito.
                                Greta: L'unica traccia di luce nella mia vita, svanita.
                                Greta: Lasciami un poco da sola, per favore.
                                ~ loopableVariables += pausaRapportoGreta
                                    -> advance_time ->
                                -> intro
                        
    

    + {zeca_talking_second_tier.allestimento2 && new_this_loop(->allestimento3)} Ettore: Mi aiuti a capire una cosa?
            Ettore: Sembra che nessuno si sia occupato del buffet prima delle prove.
            Ettore: Da quel che ho capito, tu ed Elia vi dovevate occupare del vino, Matteo e Zeca dei dolci.
            Ettore: Ma poi tutti stavate facendo altro: chi diavolo l'ha allestita quella sala?
            Greta: Perché, ti faceva schifo la roba che abbiamo comprato?
            Ettore: Forse.
            Greta: Cavoli tuoi.
            Greta: Comunque io non ho mai visto la sala gialla e il cavolo di buffet prima delle prove.
                    -> advance_time ->
                    {
                        - currentTime >= 600:
                        -> paolaIsDeadStorylet    

                    }

            - -(allestimento3) Greta: Ero in giro con Elia a sistemare i tavoli della altre sale.
            Greta: Gambe traballanti e quelle cose lì.
            Greta: Roba da maschi, che le altre due signorine non sanno come affrontare.
            Greta: Mio dio, Elia ci ha quasi lasciato un dito.
            Greta: Che vita difficile che ho!
                    -> advance_time ->
                -> greta_talking_second_tier


    + (foto) {paola_talking_second_tier.foto} Ettore: Greta, prima ti stavano cercando.
        {new_this_loop(->foto): Greta: Chi? -> secondo|Greta: Non ci ricasco Ettore!}
        - (secondo)
            + + Ettore: Zeca, dice che ha la tua scheda per la palestra.
                Greta: Madonna che palle quell'uomo!
                Greta: Lascia che sia lui a trovarmi.
                -> greta_talking_second_tier
            + + Ettore: Matteo, dice che ci sono problemi con la casa, non ho capito.
                Greta: Quella casa è sempre un macello, non sarà nulla di più terribile dell'ultimo casino.
                Greta: Cristo, chi lo sapeva quanto velocemente le farfalline della farina potessero infestare una casa?!?
                -> greta_talking_second_tier
            + + (foto2) Ettore: Elia, si è incastrato da qualche parte.
                Greta: Madonna quel ragazzo, madonna!
                Greta: Andiamo a salvarlo prima che ci rimetta le penne.
                Greta: Grazie, Ettore!
                   ~ move_this_entity_in_a_different_room(Greta)
                   -> intro 


    //SCELTE CONDIZIONALI OGGETTI//
    + (minacce) {inventoryContents has Lettera && new_this_loop(->minacce)} Ettore: Hai visto questa lettera?
        {greta_acting.minacce: Greta: La stessa che ti ho levato prima?|Greta: Ho altro per la testa.}
        {greta_acting.minacce: Greta: Vabbè, scegli pure la tua morte.|Greta: Tipo come non far pissare Paola con una lettera.}
                -> greta_talking_second_tier
        
    + (torta) {inventoryContents has Torta && new_this_loop(->torta)} Ettore: Hai mai assaggiato questa Torta?
        Greta: Cos'è? Uno di quei kink dove si riempie qualcuno di cibo?
        Greta: Perché non sono in queste cose.
        Greta: L'unica cosa che mi interessa è il sesso alieno.
        Greta: Ho un costumino che ti potrebbe pure stare.
        Greta: E qualche dildo da condividere.
        Ettore: TROPPE INFORMAZIONI!!!
        Greta: Allora sta attento a quel che chiedi, idiota.
                -> advance_time ->
            -> greta_talking_second_tier
    
    + (vino) {inventoryContents has BottigliaDiVino && new_this_loop(->vino)} Ettore: Hai mai visto questa bottiglia di vino?
        Greta: Sì, è tra quelle che abbiamo comprato al supermercato.
        Greta: Ma non dirlo a Paola: abbiamo preso la roba che costava meno e con l'etichetta più spocchiosa.
        Greta: E da come ha sorriso, credo abbia funzionato!
            -> greta_talking_second_tier
            
    + (asma) {inventoryContents has FlaconcinoAsma && new_this_loop(->asma)} Ettore: Sai di chi sia questo flaconcino per l'asma?
        Greta: Paola, punto.
            -> greta_talking_second_tier
            
    + (sigaretta) {inventoryContents has SigarettaElettronica && new_this_loop(->sigaretta)} Ettore: Ho trovato questa sigaretta elettronica!
            Greta: Ah sì.
            Greta: Sant'iddio, tra l'altro ho chiesto Zeca di comprarle la ricarica.
            Greta: E invece di prendere il solito aroma al rabarbaro, mica le prende della roba mentolata?
            Greta: Che pensa, che Paola abbia novant'anni?!?
            Greta: Ora quella è pissata con me, maledizione.
            Greta: Mai far fare le cose agli altri, mai.
                    -> advance_time ->
            -> greta_talking_second_tier
            
    + (fotografia) {inventoryContents has Foto && new_this_loop(->fotografia)} Ettore: Guarda questa foto.
            Greta: Chi te l'ha data?
            Greta: Anzi, sai che c'è? Non mi importa.
            Greta: Qui nessuno si fa i cazzi propri ormai, è una causa persa.
            Greta: Fotocopiala.
            Greta: Appendila nei cessi pubblici.
            Greta: Usala per una maledizione.
            Greta: Ma non osare più parlarmi.
                ~ loopableVariables += pausaRapportoGreta
                -> advance_time ->
            -> greta_talking_second_tier

= esplora_greta
{debug: <i>Passo per esplora_greta</i>}


{
- GretaTalking > 1: Greta: Ettore, ma non hai un po' di cazzi tuoi da farti?
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA GRETA

= first_qn
~ GretaTalking++
    Greta: Quindi, qual è la tua conoscenza delle arti oscure?
        + Ettore: Sia protetto il nome di Crowley!
            Greta: BAAASIC!
        + Ettore: Peter Carroll mio padre.
            Greta: I feel you!
        + Ettore: Ehm, zero?
            Greta: E che dovevo aspettarmi?
        -
    Greta: Sapevi che questo posto è stato costruito su un cimitero?
    Greta: No, scherzo: questa città tutta.
    Greta: Non esisterebbe senza il sacrificio costante di un sacco di persone marginalizzate.
    Greta: E stavo pensando che la Londar, il comune, la politica, i ricchi di questa città stanno facendo forse il più grande sacrificio umano della storia.
        -> advance_time ->
        {
                - currentTime >= 600:
                -> paolaIsDeadStorylet    

            }

    Greta: Mietono cadaveri su cadaveri, vittime su vittime per assicurarsi benessere e potere.
    Greta: Sono dei tritacarne esoterici privi di scrupoli.
    Greta: E io sto lì nella mia cameretta a provare a sconfiggerli.
    Greta: Povera illusa.
    Greta: Hanno piegato la realtà a loro immagine e somiglianza.
    Greta: La cosa che mi consola è che divoreranno anche loro stessi.
    Greta: E quando ci sarà silenzio, finalmente ci sarà spazio per ricominciare tutto da capo.
    Greta: Spero non con gli stessi errori.
        -> advance_time ->
            -> greta_talking_second_tier 

= second_qn
 ~ GretaTalking++
    Greta: Non ci credo!
    Ettore: Tutto bene?
    Greta: No.
    Greta: Hanno cancellato "Il giorno della smarmotta"!
    Greta: La mia vita è ROVINATA!
    Ettore: Mio padre lo adora.
    Greta: Tuo padre ha buon gusto.
    Greta: Era l'unica cosa che dava senso alla mia vita!
        -> advance_time ->
                    {
                    - currentTime >= 600:
                    -> paolaIsDeadStorylet    
    
                }
    Greta: Tornare a casa e vedermi e rivedermi quelle scene violente.
    Greta: E i crimini senza senso.
    Greta: E le marmottine cute e assassine.
    Greta: E ora cosa mi rimane, cosa?
    Greta: Poi mi chiedono perché c'ho l'ansia.
    Greta: E perché mi piango addosso tutto il giorno.
    Greta: Per queste crudeltà.
    Greta: CRU-DEL-TAAAAAAA'!
        -> advance_time ->
        -> greta_talking_second_tier 

= third_qn
~ GretaTalking++
    Greta: Lo senti?
    Ettore: Cosa?
    Greta: Il silenzio.
    Greta: Qualcosa di raro, qualcosa di magico.
    Greta: Fino a quando non ti fermi e ti rendi conto che è spaventoso.
    Greta: E di solito lo è perché hai troppi pensieri in testa.
    Greta: Perché la tua vita non ha senso, e fermarti significa realizzarlo.
    Greta: E realizzarlo significa rischiare di impazzire.
        -> advance_time ->
        
        {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

        }

    Greta: Ma stasera il problema è un altro.
    Greta: Ettore, non si sente un rumore a parte il nostro parlare.
    Greta: Ma è un venerdì sera.
    Greta: Ed è estate.
    Greta: E siamo in pieno centro.
    Greta: Dovrebbero passare macchine.
    Greta: Dovrebbero passare persone ubriache.
    Greta: Dovrebbero passare signore al telefono mentre portano fuori il cane.
            -> advance_time ->
        {
            - currentTime >= 600:
            -> paolaIsDeadStorylet    

        }

    Greta: E invece.
    Greta: IL NULLA.
    Greta: Solo noi sei.
    Greta: L'eco dei nostri drammi.
    Greta: E la fine del mondo.
    Greta: E sono minuti che vorrei aprire la porta e uscire.
    Greta: Ma ho paura di scoprire cosa ci sia fuori.
    Greta: E allora resto qui a tremare.    
        -> advance_time ->  
    -> greta_talking_second_tier



/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/
 
=== paola_is_dead_greta
    
    Greta: {~ Merda, merda, merda!|Quindi dovrò trovarmi un nuovo lavoro?|E se fosse solo uno scherzo?|Certo, ha una faccia da stronza pure da morta.}

-> advance_time ->
->->

