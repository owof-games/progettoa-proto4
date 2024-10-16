// Lista con i possibili stati delle variabili legate alle contraddizioni
LIST QuestionAnswer = True, False, DontKnow, Unexplored

// tutte le altre variabili che indicano quali scelte abbiamo preso...
VAR choice_MatteoVuoleSposareEttore = Unexplored
VAR choice_MenteZeca = Unexplored
VAR choice_WhoWasInChargeOfTheBuffet = Unexplored
VAR choice_ForWhomTheLetterWas = Unexplored


/*
Trovo informazioni nei dialoghi/luoghi/con interazione oggetti: sblocco fatti e domande nel taccuino (vedi sotto)
Se prendo la scelta "DontKnow", rimangono aperte le domande di indagine
Se imposto tutte le scelte di quel tier su True o False, apro il dialogo di risoluzione.
*/

/*
Visualizziamo sempre tutte le informazioni che abbiamo, a seconda dei nodi che abbiamo visitato (e che quindi ci hanno dato le relative informazioni)
Mostriamo una scelta solo se abbiamo scoperto la contraddizione
Le scelte salvano delle variabili globali che hanno sempre prefisso "choice_"
*/

/**
    NOTEBOOK PER IL PRIMO TIER
**/


=== notebook
+ {activeNotebook} [notebook]

{
 - tierState == FirstTier: -> tier_one_notebook
 - tierState == SecondTier: -> tier_two_notebook
}


=== tier_one_notebook
{
- startingDinnerStorylet.paolaMorta: <b>Chi ha ucciso Paola?:</b>
- else: <b>Il taccuino è vuoto</b>
}


{elia_acting.senzatetto: <i>Informazioni sul personaggio Elia</i>}
{elia_acting.senzatetto: Elia: Paola voleva rilevare il pub per trasformarlo in un rifugio per senzatetto. E Greta ha detto cose terribili e ripetuto che avrebbe fatto di tutto per fermarla.}



{elia_acting.sincero: <i>Informazioni sul personaggio Matteo</i>}
{hardTrueFeelingsStorylet.ah or hardTrueFeelingsStorylet.mono: Matteo: Ettore: io amo Greta. Il matrimonio era solo una scusa per farla ingelosire.}
{elia_acting.sincero: Elia: Merda, mi spiace. Per questo volevo fare il matrimonio al pub. Sapevo da tempo che Matteo provava qualcosa per Greta, ma non sapevo come dirtelo!}
{greta_acting.matteoGreta: Greta: Abbiamo scopato solo una volta, ed ero molto molto molto ubriaca, e Matteo ha perso la testa.}
{weddingAtThePubStorylet.matteoSiSposa or weddingAtThePubStorylet.matteoSiSposa2: Matteo: Elia, non festeggerò mai il mio matrimonio nel tuo bar triste con la tua insopportabile collega!}
{marryMeStorylet.matteoSiSposa or marryMeStorylet.matteoSiSposa2: Matteo: Ettore, sei il miglior pacchetto azionario della mia vita, sposami!}
{zeca_acting.matteoGreta: Zeca: Non mi stupirebbe se Greta stesse ricattando Matteo in qualche modo.}
{zeca_acting.matrimonio: Zeca: No. Matteo mi ha detto che ti avrebbe sposato mesi fa, quando ha prenotato il luogo, l'orchestra e mandato gli inviti.}
{zeca_acting.matrimonio: Zeca: Matteo e Paola hanno litigato per il matrimonio, perché Paola pensa che lui ti stia usando solo per candidarsi come sindaco.}
{zeca_acting.matrimonio: Zeca: Spero sia cambiato con gli anni, ma il Matteo che conoscevo amava solo una cosa: Matteo.}
{itsOverisntItStorylet: Greta: Non mi piace nulla di te, Matteo. A parte i soldi, ma sappiamo benissimo che non sono tuoi.}
{sheIsTheBestStorylet.step_one: Elia: Eppure è stata Paola a convincere i nonni a prestarti tutti quei soldi!}
{sheIsTheBestStorylet.step_three: Elia: Tu pensi ancora di sapere gestire i soldi, e stai rischiando di finire in bancarotta.}


{elia_acting.paolaSiSposa:<i>Informazioni sul personaggio Paola</i>}
{elia_acting.paolaSiSposa:Elia: Ha organizzato un matrimonio in fretta e furia, manco sappiamo con chi.}
{matteo_acting.paolaSiSposa && marryMeStorylet: Matteo: Paola ha organizzato il matrimonio appena le ho confidato che avrei voluto sposarti, la stronza.}
{zeca_acting.matrimonio: Zeca: Matteo e Paola hanno litigato per il matrimonio, perché Paola pensa che lui ti stia usando solo per candidarsi come sindaco.}
{matteo_acting.paolaZeca: Matteo: Ma la cosa più ridicola è che abbia chiesto a Zeca di fare da testimone.}
{greta_acting.paolaPerfetta: Greta: Sinceramente, non ho idea di chi possa aver ucciso Paola, lei era perfetta.}


{anEavesdropAboutFriendshipStorylet.one or zeca_acting.matteoGreta: <i>Informazioni sul personaggio Greta</i>}
{anEavesdropAboutFriendshipStorylet.one: Greta: E così papà ed io abbiamo vissuto per mesi per strada.}
{zeca_acting.matteoGreta: Zeca: Sinceramente, non ho mai creduto che a Greta interessi tanto il pub, quanto controllare Elia.}
{zeca_acting.matteoGreta: Zeca: Non mi stupirebbe se Greta stesse ricattando Matteo in qualche modo.}

{matteo_acting.paolaZeca or worstBestManStorylet.paolaZeca: <i>Informazioni sul personaggio Zeca</i>}
{matteo_acting.paolaZeca: Matteo: Quando sappiamo tutti in famiglia che Zeca odia Paola da sempre!}
{worstBestManStorylet.paolaZeca: Zeca: Non vedevo Paola da una vita. Era la mia migliore amica, e ora solo una sconosciuta.}



{cb_first_tier_spiedino_cocktail.primoCheck:<i>Informazioni sullo spiedino da cocktail</i>}
{cb_first_tier_spiedino_cocktail.primoCheck: Un banale spiedino da cocktail. In controluce si legge la sigla <i>FEG</i>}
{elia_acting.paolaSiSposa:Elia: L'ho portato a Paola per vedere se va bene per il matrimonio.}
{greta_acting.spiedino: Greta: <i>FEG</i>? Questa è la sigla del locale mio e di Elia, ma non ricordo di averne mai visto uno.}


{cb_first_tier_antico_pugnale.primoCheck:<i>Informazioni sull'antico pugnale rituale</i>}
{cb_first_tier_antico_pugnale.primoCheck: Un pugnale dall'aria antica, con simboli che non hai mai visto.}
{elia_acting.pugnaleMatteo:Elia: Matteo era disperato, l'aveva perso da settimane!}
{zeca_acting.pugnaleMatteo: Zeca: Matteo lo usa in modo <b>ossessivo</b> per pulirsi la soletta delle scarpe!}

{cb_first_tier_lettera.primoCheck: <i>Informazioni sulla lettera</i>}
{cb_first_tier_lettera.primoCheck: Con una calligrafia nervosa è stato scritto: <i>So cosa hai fatto e la pagherai!</i>. Non c'è firma.}
{greta_acting.minacce: Greta: Uh, è la calligrafia di Paola. Dove l'hai trovata?}
{elia_acting.minacce:Elia: Sembra una roba da Matteo. Quando è pissato è capace di dire qualunque cosa.}


{cb_first_tier_bottiglia_di_vino.primoCheck: <i>Informazioni sulla bottiglia di vino</i>}
{cb_first_tier_bottiglia_di_vino.primoCheck: Un negroamaro di prestigio. Probabilmente costa più di quanto tu possa guadagnare in metà mese.}


{cb_first_tier_flaconcino_asma.primoCheck: <i>Informazioni sul flaconcino dell'asma</i>}
{cb_first_tier_flaconcino_asma.primoCheck: Un comune flaconcino. O, con un po' di fantasia, il periscopio di un sottomarino.}



{cb_first_tier_limetta_unghie.primoCheck: <i>Informazioni sulla limetta da unghie</i>}
{cb_first_tier_limetta_unghie.primoCheck: Una limetta consumata, con il logo di un noto franchise molto economico.}
{matteo_acting.limetta: Matteo: Pacchiana, economica, e con tracce di schifo? Deve essere di Greta.}



{cb_first_tier_sigaretta_elettronica.primoCheck: <i>Informazioni sulla sigaretta elettronica</i>}
{cb_first_tier_sigaretta_elettronica.primoCheck: Ha l'odore di un deodorante per il bagno, ma per il resto, niente di particolare.}



{cb_first_tier_cibo.primoCheck: <i>Informazioni sulla torta</i>}
{cb_first_tier_cibo.primoCheck: Il paradiso di un dodicenne: cioccolata, crema di arachidi, fragole, biscottini sbriciolati. La adori.}



{marryMeStorylet.matteoSiSposa && hardTrueFeelingsStorylet.matteoGreta: <b>Quali sono le intenzioni di Matteo sul matrimonio?</b>}


    ~ temp contraddizione_matteo = marryMeStorylet.matteoSiSposa && hardTrueFeelingsStorylet.matteoGreta
    
    {
        - contraddizione_matteo:
            Matteo prima mi ha chiesto la mano, poi mi ha detto che ama Greta.
            Cosa sta succedendo?
            
    }
    
        ++ {contraddizione_matteo} Vuole sposare me {choice_MatteoVuoleSposareEttore == True: (scelta attuale)}
            ~ choice_MatteoVuoleSposareEttore = True
        ++ {contraddizione_matteo} vuole sposare Greta {choice_MatteoVuoleSposareEttore == False: (scelta attuale)}
            ~ choice_MatteoVuoleSposareEttore = False
        ++ {contraddizione_matteo} Continuo a investigare {choice_MatteoVuoleSposareEttore == DontKnow: (scelta attuale)}
            ~ choice_MatteoVuoleSposareEttore = DontKnow
        ++ ->    
        --


{matteo_acting.paolaZeca && worstBestManStorylet.paolaZeca: <b>La relazione tra Paola e Zeca</b>}


    ~ temp contraddizione_zeca = matteo_acting.paolaZeca && worstBestManStorylet.paolaZeca
    
    {
        - contraddizione_zeca:
            Zeca dice di non aver parlato per anni con Paola, ma secondo Matteo lui sarebbe stato il testimone del matrimonio di Paola.
            Chi mente?
            
    }
    
        ++ {contraddizione_zeca} Zeca {choice_MenteZeca == True: (scelta attuale)}
            ~ choice_MenteZeca = True
        ++ {contraddizione_zeca} Matteo {choice_MenteZeca == False: (scelta attuale)}
            ~ choice_MenteZeca = False
        ++ {contraddizione_zeca} Continuo a investigare {choice_MenteZeca == DontKnow: (scelta attuale)}
            ~ choice_MenteZeca = DontKnow
        ++ ->    
        --
-> intro


/**
    NOTEBOOK PER IL SECONDO TIER
**/

=== tier_two_notebook
{
- reStartingDinnerStorylet.tuttiMorti: <b>Chi ha ucciso Paola?:</b>
- else: <b>Il taccuino è vuoto</b>
}


{info_elia: <i>Informazioni su Elia</i>}
    
    ~ temp info_elia = paola_talking_second_tier.money or matteo_talking_second_tier.coglione or greta_talking_second_tier.indagini2 or greta_talking_second_tier.indagini3

{paola_talking_second_tier.money: Paola ci dice che per Zeca, Elia è la sua gallina dalle uova d'oro.}
{matteo_talking_second_tier.coglione: Matteo è felice per Zeca, e per Greta, ma crede che Elia sia un coglione.}
{greta_talking_second_tier.indagini2: Greta ci dice che Elia sta usando il discorso sindacato per mostrare al CdA che Paola è troppo debole e inetta.}
{greta_talking_second_tier.allestimento3: Greta: Non ho visto la sala gialla per tutta la mattina. Ero con Elia a sistemare i tavoli delle altre sale.}
{greta_talking_second_tier.indagini3: Se lo diciamo a Greta, lei si sente usata, e giura che smetterà di coprire i furti di denaro di Elia.}
{trueLoveStorylet: Elia promette amore a Zeca XXX}




{info_matteo: <i>Informazioni su Matteo</i>}

    ~ temp info_matteo = paola_talking_second_tier.allestimento or zeca_talking_second_tier.money or notABigSecretPartTwoStorylet.allestimento or phone.sindacato

{zeca_talking_second_tier.money: Se lo diciamo a Zeca, ci dice che Paola piuttosto dovrebbe farsi delle domande su Matteo, che è lui a campare sulle spalle dei due fratelli.}
{paola_talking_second_tier.allestimento: Paola: Ho sentito Zeca e Matteo litigare nella stanza prima del buffet.}
{notABigSecretPartTwoStorylet.allestimento: Elia ci dice che Zeca e Matteo hanno recuperato le cibarie. Sono anche passati in farmacia, e a prendere le ricariche per le sigarette elettroniche di Paola}
{phone.sindacato: E del tentativo di sindacalizzazione da parte di Matteo.}



{info_paola:<i>Informazioni su Paola</i>}

    ~ temp info_paola = zeca_talking_second_tier.allestimento2 or greta_talking_second_tier.indagini or phone.indagini

{zeca_talking_second_tier.allestimento2: Zeca ci dice che qualcuno si è chiuso nella stanza a scopare a una certa, mentre lui e Matteo montavano le luci. Senza convinzione, dice "forse Paola e il suo vibratore. Anche se non ho sentito il solito puzzo da deodorante per il cesso che si porta dietro."}
{greta_talking_second_tier.indagini: Qui Greta ci dice che Paola vuole estromettere Elia dall'azienda.}
{phone.indagini: Scopriamo le indagini sull'azienda di Paola, e che sta scaricando la colpa su Elia}


{info_greta: <i>Informazioni su Greta</i>}

    ~ temp info_greta = elia_talking_second_tier.indagini or liarCallLiarStorylet.indagini or liesAndPromisesStorylet or notABigSecretPartOneStorylet.allestimento or zeca_talking_second_tier.allestimento

{zeca_talking_second_tier.allestimento: Zeca ci dice che lui e Matteo hanno lasciato il cibo sui tavoli e poi chiesto a Greta di occuparsene, che loro dovevano sistemare i costumi.}
{elia_talking_second_tier.allestimento2: Elia: Zeca sente sesso ovunque, giuro! Ma purtroppo ho passato la mattina con Greta a chiamare i fornitori del pub.}
{elia_talking_second_tier.indagini: Elia ci dice che Greta ha dato a Matteo info per "contrattare" meglio con Paola per la sindacalizzazione e questo avrebbe fatto pissare Paola.}
{liarCallLiarStorylet.indagini: Zeca ci dice che la polizia ha avuto anche dati personali di Paola. Dati a cui solo la segretaria personale avrebbe potuto avere accesso.}
{liesAndPromisesStorylet: Elia promette a Greta amore XXX}
{notABigSecretPartOneStorylet.allestimento: Matteo ci dice che Greta ed Elia hanno recuperato il bere. Si sono occupati anche degli elementi della scenografia}



{info_zeca: <i>Informazioni su Zeca</i>}

         ~ temp info_zeca = zeca_talking_second_tier.love or paola_talking_second_tier.money or paola_talking_second_tier.allestimento or elia_talking_second_tier.allestimento or elia_talking_second_tier.minacce


{zeca_talking_second_tier.love: Zeca ci dice che farebbe di tutto per proteggere Elia.}
{paola_talking_second_tier.allestimento: Paola: Ho sentito Zeca e Matteo litigare nella stanza prima del buffet.}
{paola_talking_second_tier.money: Paola ci dice che per Zeca, Elia è la sua gallina dalle uova d'oro. }
{elia_talking_second_tier.allestimento: Elia ci dice che lui e Greta hanno lasciato le bottiglie all'ingresso, avvisando Zeca, perché dovevano risolvere un problema coi tavoli}
{elia_talking_second_tier.minacce: Elia sbotta, dice che non ha senso, che il suo "socio d'affari" che motivo avrebbe di rovinarlo? e si allontana subito, possiamo "pedinarlo"}


//Oggetti

{cb_second_tier_lettera.primoCheck: <i>Informazioni sulla lettera</i>}
{cb_second_tier_lettera.primoCheck: La carta è lercia e la calligrafia minacciosa: <i>So cosa hai fatto e la pagherai!</i>. Ha un odore metallico.}
{greta_acting.minacce: Greta: Uh, è la calligrafia di Paola. Dove l'hai trovata?}
{elia_acting.minacce:Elia: Sembra una roba da Matteo. Quando è pissato è capace di dire qualunque cosa.}
{matteo_talking_second_tier.lettera: Matteo: Mettila via, subito! Se Paola la trova ti mangia vivo!}
{matteo_talking_second_tier.lettera2: Matteo: Solo due persone in questo posto mossono minacciare qualcuno: Paola e Zeca.}




{cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino: <i>Informazioni sulla bottiglia di vino</i>}
{cb_second_tier_bottiglia_di_vino.primoCheck: Il liquido è inquieto e torbido, e si agita nella bottiglia come fosse dotato di vita propria.}
{paola_is_dead.vino: Rimane solo un goccio sul fondo. Le labbra di Paola hanno lo stesso colore.}
{paola_talking_second_tier.vino: Paola: Amo da morire questo vino.}
{zeca_talking_second_tier.allestimento3: Zeca ci dice che l'hanno comprata lui e Matteo.}




{cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma: <i>Informazioni sul flaconcino dell'asma</i>}
{cb_second_tier_flaconcino_asma.primoCheck: Banale pezzo di plastica, leggero e maleabile, a cui è aggrappata l'intera vita di una persona.}
{paola_is_dead.asma: Paola lo stringe ancora forte in pugno, come fosse un'arma. O un'ancora di salvezza.}
{paola_talking_second_tier.asma: Paola: Tra polvere e muffa in questo posto, senza potrei morire.}



{cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta: <i>Informazioni sulla sigaretta elettronica</i>}
{cb_second_tier_sigaretta_elettronica.primoCheck: Morte tascabile.}
{paola_is_dead.sigaretta: Il dispenser del liquido è completamnte svuotato.}
{paola_talking_second_tier.sigaretta: Paola: Io vivo di sigaretta elettronica. Adoro i suoi sapori chimici, la possibilità di fumarla ovunque.}
{greta_talking_second_tier.allestimento2: Se chiediamo a Greta, ipoteticamente, chi potrebbe commettere un crimine, la sua risposta sarà "Beh, chi ha comprato il liquido per le sigarette elettroniche" e poi spiega perché.}
{greta_talking_second_tier.sigaretta: Greta ci dice che chi ha comprato la ricarica palesemente non conosce Paola, perché lei è in fissa solo col rabarbaro da mesi.}



{cb_second_tier_cibo.primoCheck or paola_is_dead.briciole: <i>Informazioni su torta e briciole</i>}
{cb_second_tier_cibo.primoCheck: Friabile come le proprie sicurezze, come un sacco d'ossa che cade dal sesto piano.}
{paola_is_dead.torta: Sono rimasugli all'angolo della bocca. Forse qualcosa di dolce.}
{paola_talking_second_tier.torta: Paola: Ma pensavo tutti sapessero che sono allergica alle arachidi, mortalmente. E questa è piena di crema d'arachidi.}
{matteo_talking_second_tier.torta: Matteo: Strano: Zeca e io abbiamo preso la roba al supermercato, ma non ricordo questa torta!}

{paola_talking_second_tier.foto2: <i>Informazioni sulla foto</i>}
{paola_talking_second_tier.foto2: Due persone. In un locale. Con l'urgenza di divorarsi.}


//Condizioni


{contraddizione_buffet: <b>Chi si è occupato del buffet?</b>}

//choice_WhoWasInChargeOfTheBuffet = True: Greta ed Elia. = False: Zeca e Matteo.

{notABigSecretPartOneStorylet.allestimento: Matteo ci dice che Greta ed Elia hanno recuperato il bere. Si sono occupati anche degli elementi della scenografia}

    ~ temp contraddizione_buffet = (zeca_talking_second_tier.allestimento or notABigSecretPartOneStorylet.allestimento) && (elia_talking_second_tier.allestimento or notABigSecretPartTwoStorylet.allestimento)
    
    {
        - contraddizione_buffet: {notABigSecretPartOneStorylet.allestimento: Matteo ci dice che Greta ed Elia hanno recuperato il bere. Si sono occupati anche degli elementi della scenografia} {zeca_talking_second_tier.allestimento: Zeca ci dice che lui e Matteo hanno lasciato il cibo sui tavoli e poi chiesto a Greta di occuparsene, che loro dovevano sistemare i costumi.} {elia_talking_second_tier.allestimento: Elia ci dice che lui e Greta hanno lasciato le bottiglie all'ingresso, avvisando Zeca, perché dovevano risolvere un problema coi tavoli} {notABigSecretPartTwoStorylet.allestimento: Elia ci dice che Zeca e Matteo hanno recuperato le cibarie. Sono anche passati in farmacia, e a prendere le ricariche per le sigarette elettroniche di Paola}
                Chi ha recuperato le cose del buffet?
            
            
    }
    
        ++ {contraddizione_buffet} Greta ed Elia. {choice_WhoWasInChargeOfTheBuffet == True: (scelta attuale)}
            ~ choice_WhoWasInChargeOfTheBuffet = True
        ++ {contraddizione_buffet} Zeca e Matteo. {choice_WhoWasInChargeOfTheBuffet== False: (scelta attuale)}
            ~ choice_WhoWasInChargeOfTheBuffet = False
        ++ {contraddizione_buffet} Ancora non ho le idee chiare. {choice_WhoWasInChargeOfTheBuffet == DontKnow: (scelta attuale)}
            ~ choice_WhoWasInChargeOfTheBuffet = DontKnow
        ++ ->    
        --


//choice_ForWhomTheLetterWas = True -> Elia; = False -> Greta.

{contraddizione_lettera: <b>A chi è indirizzata la lettera di Paola?</b>}

    ~ temp contraddizione_lettera = elia_talking_second_tier.indagini && greta_talking_second_tier.indagini
    
    {
        - contraddizione_lettera:
            {elia_talking_second_tier.indagini: Elia ci dice che Greta ha dato a Matteo info per "contrattare" meglio con Paola per la sindacalizzazione e questo avrebbe fatto pissare Paola.} {greta_talking_second_tier.indagini: Qui Greta ci dice che Paola vuole estromettere Elia dall'azienda.}
            A chi è destinata la lettera?
            
    }
    
        ++ {contraddizione_lettera} Elia. {choice_ForWhomTheLetterWas == True: (scelta attuale)}
            ~ choice_ForWhomTheLetterWas = True
        ++ {contraddizione_lettera} Greta. {choice_ForWhomTheLetterWas == False: (scelta attuale)}
            ~ choice_ForWhomTheLetterWas = False
        ++ {contraddizione_lettera} Voglio continuare ad investigare. {choice_ForWhomTheLetterWas == DontKnow: (scelta attuale)}
            ~ choice_ForWhomTheLetterWas = DontKnow
        ++ ->    
        --
-> intro