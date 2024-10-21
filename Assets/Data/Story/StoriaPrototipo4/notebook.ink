// Lista con i possibili stati delle variabili legate alle contraddizioni
LIST QuestionAnswer = True, False, DontKnow, Unexplored

// tutte le altre variabili che indicano quali scelte abbiamo preso...
VAR choice_MatteoVuoleSposareEttore = Unexplored
VAR choice_MenteZeca = Unexplored
VAR choice_WhoWasInChargeOfTheBuffet = Unexplored
VAR choice_ForWhomTheLetterWas = Unexplored

//Contraddizioni per il finale, secondo tier
VAR primaContraddizione = false
VAR secondaContraddizione = false


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
    
    /**
        ++ {contraddizione_matteo} Vuole sposare me {choice_MatteoVuoleSposareEttore == True: (scelta attuale)}
            ~ choice_MatteoVuoleSposareEttore = True
        ++ {contraddizione_matteo} vuole sposare Greta {choice_MatteoVuoleSposareEttore == False: (scelta attuale)}
            ~ choice_MatteoVuoleSposareEttore = False
        ++ {contraddizione_matteo} Continuo a investigare {choice_MatteoVuoleSposareEttore == DontKnow: (scelta attuale)}
            ~ choice_MatteoVuoleSposareEttore = DontKnow
        ++ ->    
        --
        **/

{matteo_acting.paolaZeca && worstBestManStorylet.paolaZeca: <b>La relazione tra Paola e Zeca</b>}


    ~ temp contraddizione_zeca = matteo_acting.paolaZeca && worstBestManStorylet.paolaZeca
    
    {
        - contraddizione_zeca:
            Zeca dice di non aver parlato per anni con Paola, ma secondo Matteo lui sarebbe stato il testimone del matrimonio di Paola.
            Chi mente?
            
    }

    /**
    
        ++ {contraddizione_zeca} Zeca {choice_MenteZeca == True: (scelta attuale)}
            ~ choice_MenteZeca = True
        ++ {contraddizione_zeca} Matteo {choice_MenteZeca == False: (scelta attuale)}
            ~ choice_MenteZeca = False
        ++ {contraddizione_zeca} Continuo a investigare {choice_MenteZeca == DontKnow: (scelta attuale)}
            ~ choice_MenteZeca = DontKnow
        ++ ->    
        --
        **/

-> intro


/**
    NOTEBOOK PER IL SECONDO TIER
**/

=== tier_two_notebook
{
- reStartingDinnerStorylet.tuttiMorti: <b>Chi ha ucciso Paola?:</b>
- else: <b>Il taccuino è vuoto</b>
}


~ temp info_elia = paola_talking_second_tier.money or greta_talking_second_tier.indagini2 or greta_talking_second_tier.indagini3

{info_elia: <i>Informazioni su Elia</i>}
    


{paola_talking_second_tier.money: Elia per Zeca è la gallina delle uova d'oro, ma di galline non se ne trovano due in questa vita.}
{greta_talking_second_tier.indagini2: Greta: Elia sta usando l'amicizia con Matteo per usare il sindacato contro Paola.}
{greta_talking_second_tier.allestimento3: Greta: Ero in giro con Elia a sistemare i tavoli della altre sale.}
{greta_talking_second_tier.indagini3: Greta: E io che, stupida, coprivo i furti di denaro di Elia in azienda.}
{trueLoveStorylet.promise: Elia: Abbracciami. Te lo prometto Zeca: basta grattini con Greta o qualsiasi altra persona.}



~ temp info_matteo = paola_talking_second_tier.allestimento or zeca_talking_second_tier.money or notABigSecretPartTwoStorylet.allestimento or phone.sindacato

{info_matteo: <i>Informazioni su Matteo</i>}



{zeca_talking_second_tier.money: Zeca: No: Matteo è l'unico qui dentro che campa sulle spalle dei due fratelli.}
{paola_talking_second_tier.allestimento: Paola: Beh, nella stanza gialla Matteo e Zeca si sono urlati contro come se ne andasse dell'intero universo. E Matteo è uscito piangendo.}
{notABigSecretPartTwoStorylet.allestimento: Elia: Zeca e Matteo sono andati a prendere il cibo, e non le hanno prese. Sono passati anche in farmacia e dal tabacchi per la sigaretta di Paola, e anche lì ci sono le mie barrette. Ma non le hanno prese!}
{phone.sindacato: Amica: E fresca fresca di oggi, il migliore amico di Elia che sta tirando su un sindacato contro la sorella. Michele, Mirco, Marco.}



~ temp info_paola = zeca_talking_second_tier.allestimento2 or greta_talking_second_tier.indagini or phone.indagini

{info_paola:<i>Informazioni su Paola</i>}



{zeca_talking_second_tier.allestimento2: Zeca: Forse era Paola col suo vibratore a saltellare sul tavolo del buffet. Una elder millenial sicuro che ne ha sempre uno con sé.}
{greta_talking_second_tier.indagini: Greta: Beh: Paola sta cercando far estromettere Elia dalla Londar.}
{phone.indagini: E insomma, sembra che lei stia scaricando la colpa sul fratello.Agente: L'azienda di Paola è sotto indagine, sono arrivati documenti compromettenti.}



~ temp info_greta = elia_talking_second_tier.indagini or liarCallLiarStorylet.indagini or liesAndPromisesStorylet or notABigSecretPartOneStorylet.allestimento or zeca_talking_second_tier.allestimento

{info_greta: <i>Informazioni su Greta</i>}


{zeca_talking_second_tier.allestimento: Zeca: Comunque sì, Matteo ed io ci siamo occupati di tabacco e cibo, ma non abbiamo preparato noi il buffet. Abbiamo lasciato le cose fuori dalla porta e chiesto a Greta di occuparsene, perché c'erano dei problemi coi costumi.}
{elia_talking_second_tier.indagini: Elia: Ma la cosa sicura è che abbiamo lasciato le bottiglie all'ingresso e non siamo entrati nella sala gialla delle pappe. Greta e io dovevamo chiamare i fornitori.}
{liarCallLiarStorylet.indagini: Zeca: La polizia ha avuto accesso a dati personali di Paola. Dati che solo la sua segretaria potrebbe avere.}
{liesAndPromisesStorylet.promise: Elia: Ti amo, Greta.}
{notABigSecretPartOneStorylet.allestimento: Matteo: Certo: Greta ed Elia potevano recuperare pure del vino decente. E hanno lasciato in tutta la stanza il puzzo delle loro cose da scenografi. Due cose dovevano fare: riparare le seggiole, allestire il buffet. E hanno fatto un disastro in tutte e due le occasioni.}



~ temp info_zeca = zeca_talking_second_tier.omicidio2 or paola_talking_second_tier.money or paola_talking_second_tier.allestimento or elia_talking_second_tier.allestimento or elia_talking_second_tier.minacce

{info_zeca: <i>Informazioni su Zeca</i>}



{zeca_talking_second_tier.omicidio2: Zeca: Per il resto: farei qualsiasi cosa per proteggere Elia.}
{paola_talking_second_tier.allestimento: Paola: Ho sentito Zeca e Matteo litigare nella stanza prima del buffet.}
{paola_talking_second_tier.money: Paola: Beh, nella stanza gialla Matteo e Zeca si sono urlati contro come se ne andasse dell'intero universo. E Matteo è uscito piangendo.}
{elia_talking_second_tier.indagini: Elia: Ma la cosa sicura è che abbiamo lasciato le bottiglie all'ingresso e non siamo entrati nella sala gialla delle pappe. Greta e io dovevamo chiamare i fornitori.}
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
{zeca_talking_second_tier.allestimento3: Zeca: Sì, la boccia l'abbiamo presa Matteo ed io.}




{cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma: <i>Informazioni sul flaconcino dell'asma</i>}
{cb_second_tier_flaconcino_asma.primoCheck: Banale pezzo di plastica, leggero e maleabile, a cui è aggrappata l'intera vita di una persona.}
{paola_is_dead.asma: Paola lo stringe ancora forte in pugno, come fosse un'arma. O un'ancora di salvezza.}
{paola_talking_second_tier.asma: Paola: Tra polvere e muffa in questo posto, senza potrei morire.}



{cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta: <i>Informazioni sulla sigaretta elettronica</i>}
{cb_second_tier_sigaretta_elettronica.primoCheck: Morte tascabile.}
{paola_is_dead.sigaretta: Il dispenser del liquido è completamnte svuotato.}
{paola_talking_second_tier.sigaretta: Paola: Io vivo di sigaretta elettronica. Adoro i suoi sapori chimici, la possibilità di fumarla ovunque.}
{greta_talking_second_tier.allestimento2: Greta: Ed ecco la cosa divertente: che grazie alle sigarette elettroniche ora basta versare il veleno sulla pelle e bang, è fatta! Puoi uccidere qualcuno.}



{cb_second_tier_cibo.primoCheck or paola_is_dead.briciole: <i>Informazioni su torta e briciole</i>}
{cb_second_tier_cibo.primoCheck: Friabile come le proprie sicurezze, come un sacco d'ossa che cade dal sesto piano.}
{paola_is_dead.briciole: Sono rimasugli all'angolo della bocca. Forse qualcosa di dolce.}
{paola_talking_second_tier.torta: Paola: Ma pensavo tutti sapessero che sono allergica alle arachidi, mortalmente. E questa è piena di crema d'arachidi.}
{matteo_talking_second_tier.torta: Matteo: Strano: Zeca e io abbiamo preso la roba al supermercato, ma non ricordo questa torta!}

{paola_talking_second_tier.foto2: <i>Informazioni sulla foto</i>}
{paola_talking_second_tier.foto2: Due persone. In un locale. Con l'urgenza di divorarsi.}


//Condizioni
~ temp contraddizione_buffet = (zeca_talking_second_tier.allestimento or notABigSecretPartOneStorylet.allestimento) && (elia_talking_second_tier.allestimento or notABigSecretPartTwoStorylet.allestimento)
    
    {
        - contraddizione_buffet:
            ~ primaContraddizione = true
    }
    
{contraddizione_buffet: <b>Chi si è occupato del buffet?</b>}

//choice_WhoWasInChargeOfTheBuffet = True: Greta ed Elia. = False: Zeca e Matteo.


    
    {
        - contraddizione_buffet: {notABigSecretPartOneStorylet.allestimento: Matteo: Certo: Greta ed Elia potevano recuperare pure del vino decente. E hanno lasciato in tutta la stanza il puzzo delle loro cose da scenografi. Due cose dovevano fare: riparare le seggiole, allestire il buffet. E hanno fatto un disastro in tutte e due le occasioni.} {zeca_talking_second_tier.allestimento:  Zeca: Comunque sì, Matteo ed io ci siamo occupati di tabacco e cibo, ma non abbiamo preparato noi il buffet. Abbiamo lasciato le cose fuori dalla porta e chiesto a Greta di occuparsene, perché c'erano dei problemi coi costumi.} {elia_talking_second_tier.allestimento: Elia: Esatto. Greta e io abbiamo comprato il vino.} {notABigSecretPartTwoStorylet.allestimento: Elia: Zeca e Matteo sono andati a prendere il cibo, e non le hanno prese. Sono passati anche in farmacia e dal tabacchi per la sigaretta di Paola, e anche lì ci sono le mie barrette. Ma non le hanno prese!}
                Chi ha recuperato le cose del buffet?
            
            
    }
    
    /**    ++ {contraddizione_buffet} Greta ed Elia. {choice_WhoWasInChargeOfTheBuffet == True: (scelta attuale)}
            ~ choice_WhoWasInChargeOfTheBuffet = True
        ++ {contraddizione_buffet} Zeca e Matteo. {choice_WhoWasInChargeOfTheBuffet== False: (scelta attuale)}
            ~ choice_WhoWasInChargeOfTheBuffet = False
        ++ {contraddizione_buffet} Ancora non ho le idee chiare. {choice_WhoWasInChargeOfTheBuffet == DontKnow: (scelta attuale)}
            ~ choice_WhoWasInChargeOfTheBuffet = DontKnow
        ++ ->    
        --
    **/

//choice_ForWhomTheLetterWas = True -> Elia; = False -> Greta.

~ temp contraddizione_lettera = elia_talking_second_tier.indagini && greta_talking_second_tier.indagini
    
    {
        - contraddizione_lettera:
            ~ secondaContraddizione = true
    }

{contraddizione_lettera: <b>A chi è indirizzata la lettera di Paola?</b>}


    {
        - contraddizione_lettera:
            {elia_talking_second_tier.indagini: Elia: Allora ti dico un segreto: Greta ha dato a Matteo molte informazioni sui conti dell'azienda. Vuole aiutarlo con questa cosa del sindicato, così che Matteo possa sindicare meglio sindicando Paola e venendo sindicato dai colleghi del sindicato.} {greta_talking_second_tier.indagini: Greta: Beh: Paola sta cercando far estromettere Elia dalla Londar.}
            A chi è destinata la lettera?
            
    }
    
    /**
        ++ {contraddizione_lettera} Elia. {choice_ForWhomTheLetterWas == True: (scelta attuale)}
            ~ choice_ForWhomTheLetterWas = True
        ++ {contraddizione_lettera} Greta. {choice_ForWhomTheLetterWas == False: (scelta attuale)}
            ~ choice_ForWhomTheLetterWas = False
        ++ {contraddizione_lettera} Voglio continuare ad investigare. {choice_ForWhomTheLetterWas == DontKnow: (scelta attuale)}
            ~ choice_ForWhomTheLetterWas = DontKnow
        ++ ->    
        --

    **/    
-> intro