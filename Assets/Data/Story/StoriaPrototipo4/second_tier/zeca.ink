=== cb_second_tier_zeca ===
{debug: <i>passo per second_tier_zeca</i>}

+ {are_two_entities_together(Zeca, Ettore)} [character:Zeca]
    -> zeca_talking_second_tier ->    

+ {are_two_entities_together(Zeca, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Zeca]
    -> paola_is_dead_zeca ->
-    


-> intro




/* ---------------------------------
Opzioni di dialogo con la persona Zeca
 ----------------------------------*/

=== zeca_talking_second_tier
 {debug: <i>Passo per zeca_talking_second_tier</i>}
    //INFO GENERALI//
    + (loop) {new_this_loop(->loop)} Ettore: Zeca, non hai notato cose strane negli ultimi minuti?
        Zeca: Tipo?
        Ettore: Che sembra che state dimenticando le cose, e fate cose strane.
        Zeca: Tipo?
        Ettore: Tipo: durante la recita prima Paola è morta, morta davvero, e ora fate finta di niente.
        Zeca: Tipo?
        Ettore: Tipo ora tu, che mi chiedi "Tipo?" invece di essere preoccupato.
        Ettore: Ecco: come prima, quando abbiamo ripetuto la scena della cena.
        Ettore: E Paola gridava cose strane e voi ridevate.
        Zeca: Embè?
        Zeca: Scusa ciccio, ma non c'ho testa ora.
            -> advance_time ->
                 -> zeca_talking_second_tier

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Tu e Paola andate d'accordo?
        Zeca: Non mi dispiace, ma non ci pigliamo.
        Zeca: Lei è un po' troppo bossy, non so se ci capiamo.
        Zeca: Cosa che adoro in una donna, ma fa troppo elder millenial.
        Zeca: La nostra generazione preferisce qualcosa di più diretto e meno sofisticato.
        Zeca: Demure.
        Zeca: Tipo Jennifer Coolidge.
        Ettore: Quindi, hai stima di Paola?
            -> advance_time ->
        Zeca: Mmm. No. Ora che ci penso, no.
        Zeca: PERO'. PERO'.
        Zeca: Ci uscirei a fare serata e sparlare di Elia, quello sì.
            + + [Cambi argomento] -> zeca_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Secondo te qualcuno potrebbe volere del male a Paola?
        Zeca: Tesoro.
        Zeca: CHI non vorrebbe farle del male?
        Zeca: O almeno dirle due paroline a modo.
        Ettore: E tu, le vuoi male?
        Zeca: Naa, ci saremo parlate tre volte in due anni.
        Zeca: PERO'. PERO'.
        Zeca: Se continua a trattare così di merda Elia, potrei farci un pensierino.
        Zeca: Solo io posso insultarlo.
        Zeca: Per il resto: farei di tutto per proteggerlo.
        -> advance_time ->
            -> zeca_talking_second_tier

    + Fai domande sulla persona Zeca -> esplora_zeca

    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Zeca: so che vuoi uccidere Paola! -> arringa_finale_Zeca

    TODO: Molto velocemente tutti dicono di non essere mai stati nella stanza gialla prima delle riprese

    //SCELTE CONDIZIONALI//
    + (allestimento) {notABigSecretPartTwoStorylet.allestimento && new_this_loop(->allestimento)} Ettore: Zeca, ho una domanda sul buffet e su chi se ne è occupato.
        Zeca: Ecco che torna a fare domande.
        Ettore: Ok, niente domande allora.
        Ettore: Elia prima mi ha detto che tu e Matteo vi siete occupati del cibo e delle sigarette di Paola.
        Zeca: Sai che anche se non ci metti un punto interrogativo, questa è una domanda?
        Zeca: PERO'. PERO'.
        Zeca: Continuo a non capire questa fissa per il buffet.
        Ettore: Mi annoio, può andare?
        Zeca: Povera stellina, povera.
            -> advance_time ->
        Zeca: Comunque sì, ci siamo occupati di quella roba, ma non abbiamo preparato noi il buffet.
        Zeca: Né io né Matteo abbiamo messo piede nella stanza gialla prima delle prove.
        Zeca: Abbiamo invece lasciato le cose fuori dalla porta e chiesto a Greta di occuparsene, perché c'erano dei problemi coi costumi.
        Zeca: O per dirla diversamente: Greta si deve essere scofanata un cavallo dalle ultime prove, perché ora non ci entra più in quel vestito.
        Zeca: Hai altre domande, Sherlock?
                + (allestimento2) {elia_talking_second_tier.allestimento}Ettore: Sì; mi sembra buffo quel che dici, perché Elia giura di averti lasciato il vino, perché lui e Greta avevano un problema coi tavoli.
                    Zeca: <i>Buffo>/i> che tu non sappia farti un giro di cazzi tuoi, Ettore.
                    Zeca: Vero, Elia mi ha chiesto di farlo, ma io non gli ho mai detto di sì.
                        -> advance_time ->
                    Zeca: Ma visto che sono una signora ci ho pure provato qualche minuto dopo a portare un paio di bottiglie.
                    Zeca: E magari ad aprirmene una.
                    Zeca: PERO'. PERO'.
                    Zeca: La sala gialla, dove dovevamo fare il buffet, era serrata.
                    Zeca: E qualcuno dentro ansimava come se avesse fatto le scale di corsa, molto di corsa.
                    Zeca: E per scale, intendo tutta una squadra di calcio.
                    Zeca: Forse era Paola col suo vibratore. Una elder millenial sicuro che ne ha sempre uno con sé.
                    Zeca: Anche se non ho sentito il solito puzzo di cesso delle sue sigarette elettroniche.
                     -> advance_time ->
                        -> zeca_talking_second_tier
                
                + {paola_talking_second_tier.allestimento} Ettore: Paola dice di aver sentito litigare te e Matteo nella stanza gialla.
                    Ettore: Ma prima hai detto di non essere mai entrato nella stanza gialla prima delle prove.
                    Zeca: Oh va bene, mi hai colto in flagrante.
                    Zeca: Tira fuori le manette e sculacciami perché sono un bimbo cattivo.
                    Zeca: Ho mentito.
                    Zeca: PERO'. PERO'.
                    Zeca: Non ti sei chiesto il perché, Sherlock?
                    Zeca: È perché non sono cazzi tuoi.
                        -> advance_time ->
                    Zeca: Gli amici litigano.
                    Zeca: Gli amici fanno la pace.
                    Zeca: Gli sconosciuti litigano.
                    Zeca: Gli sconosciuti NON fanno la pace.
                    Zeca: Non so se ci siamo capiti.
                       + + {matteo_talking_second_tier.allestimento} Ettore: Quando ho detto la stessa cosa a Matteo, è corso a cercarti.
                            Zeca: E ci siamo trovati, e ora va tutto bene.
                       + + Ettore: Forte e chiaro.
                       - -
                    Zeca: Bene. Ora lasciami nel mio silenzio a odiare te e il resto del mondo, grazie.
                        -> advance_time ->       
                            -> zeca_talking_second_tier
                + Ettore: Ehm, no, niente di utile, no.
                    Zeca: Come sempre, insomma.
                    -> advance_time ->
                        -> zeca_talking_second_tier
    

    + (love){zeca_talking_second_tier.omicidio && new_this_loop(->love)} Ettore: Zeca, prima hai detto che faresti di tutto per Elia.
        
        + + (love2){paola_talking_second_tier.money && new_this_loop(->love2)} Ettore: Secondo Paola, è perché i tuoi soldi provengono da Elia.
            Zeca: Al massimo è il contrario.
            Zeca: Prima della nostra collab Elia proponeva foto a sciampiste su Grindr.
            Zeca: Ora c'ha questo ammasso di fustacchiotti fissati con la barra e le proteine, che vanno in burnout se in vacanza non hanno la palestra vicino.
            Zeca: Le fotine giuste, e loro si sentiranno sempre brutti e verranno alla mia palestra, e continueranno a farsi fare foto da Elia.
            Ettore: Non è poco etico?
            Zeca: E cosa c'è di etico ormai a questo mondo?
                -> advance_time ->
            Zeca: Sei qui pagato da soldi che Paola guadagna sfrattando poveracci e chiudendo piccoli negozi a gestione familiare.
            Zeca: Il cibo del buffet viene dalla grande distribuzione, ovvero: ti sei mangiato un po' di sfruttamento.
            Zeca: E la storia scritta da Paola è un crimine contro la decenza.
            Zeca: Io alla fine spingo gente senza vita e senza obiettivi ad averne uno.
            Zeca: Dovrebbero farmi santa.
            Zeca: E piuttosto: invece di rompere le balle a me, c'è qualcun altro a cui Paola dovrebbe fare le pulci.
            Zeca: Matteo è l'unico qui dentro che campa sulle spalle dei due fratelli.
                -> advance_time ->    
                    -> zeca_talking_second_tier
        + + (love3){trueLoveStorylet && new_this_loop(->love3)} Ettore: Come ti senti, ora che Elia ti ha dichiarato il suo amore?
            Zeca: E come lo sai?
            Zeca: Merda, quanto siete pettegole!
            Zeca: Ci scometto che è stato Matteo, quello sa ingoiare solo a letto, il maledetto.
            Zeca: PERO'. PERO'.
            Zeca: Sto bene.
            Zeca: Spaventato, ma bene.
            Ettore: Spaventato?
                -> advance_time ->
            Zeca: Beh: a tutti fa piacere l'idea di avere un bellissimo labrador in casa.
            Zeca: Ma sei dello stesso avviso quando ti ha rotto il vaso di zia?
            Zeca: Quando ti ha cagato sulle coperte appena lavate?
            Zeca: Quando ha ringhiato contro il tuo date e ti tocca una notte senza cazzo?
            Zeca: Non ho mai avuto manco un criceto, e ho il timore di annoiarmi entro un paio di settimane.
            Zeca: Nel caso lo passo a quella disperata di Greta.
                -> advance_time ->
                    -> zeca_talking_second_tier


    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has Lettera} Guarda questa lettera!
        + + {matteo_talking_second_tier.lettera2} Ettore: Matteo crede l'abbia scritta tu.
        + + ->
        - -
    + {inventoryContents has Torta} Guarda questo cibo!
    + (allestimento3) {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
    -> intro
    -
    
    -> zeca_talking_second_tier
    

= esplora_zeca
{debug: <i>Passo per esplora_zeca</i>}


{
- ZecaTalking > 1: Zeca: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA ZECA

= first_qn
~ ZecaTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> zeca_talking_second_tier 

= second_qn
 ~ ZecaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> zeca_talking_second_tier    

= third_qn
~ ZecaTalking++
    Zeca dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> zeca_talking_second_tier



/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/
 
=== paola_is_dead_zeca
    
    Zeca: {~ Devo tirare su di morale Elia.|Non il momento migliore. Non. Il. Momento. Migliore.|Sinceramente: mi ha stupito ci sia voluto così tanto tempo perché qualcuno la uccidesse.|Era così odiosa che pensavo fosse immortale, come un'erbaccia o un demone.}

-> advance_time ->
->->


/* ---------------------------------

   Arringa finale. 

 ----------------------------------*/
=== arringa_finale_Zeca
Con cosa
    + {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Usando il vino.
    + {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Il boccettino dell'asma.
    + {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} La sigaretta elettronica.
    + {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} La torta.
    -
    
Con l'aiuto di chi
    + Elia
    + Greta
    + Matteo
    + Paola
    + Hai fatto da solo
    -
    
Perché
    + xxx
    -
Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset