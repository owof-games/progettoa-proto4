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
VAR notebookPage = 1
=== notebook
+ {activeNotebook} [notebook]

{
 - tierState == FirstTier: -> tier_one_notebook
 - tierState == SecondTier: -> tier_two_notebook
}


=== tier_one_notebook
    ~ notebookPage = 1
//ogni pagina è due facciate
{
- startingDinnerStorylet.paolaMorta: <b>Chi ha ucciso Paola?:</b> #slot-1
- else: <b>Il taccuino è vuoto</b> #slot-1
}


{elia_acting.senzatetto2: <i>Informazioni sul personaggio Elia</i> #slot-2}
{elia_acting.senzatetto2: Elia: Paola voleva rilevare il pub per trasformarlo in un rifugio per senzatetto. E Greta ha detto cose terribili e ripetuto che avrebbe fatto di tutto per fermarla. #slot-3}

    ~ notebookPage = 2
~ temp info_matteo = elia_acting.sincero or marryMeStorylet or hardTrueFeelingsStorylet or greta_acting.matteoGreta or weddingAtThePubStorylet or zeca_acting.matteoGreta or zeca_acting.matrimonio or itsOverisntItStorylet or sheIsTheBestStorylet
    
{info_matteo: <i>Informazioni sul personaggio Matteo</i> #slot-1}
{elia_acting.sincero: Elia: Merda, mi spiace. Per questo volevo fare il matrimonio al pub. Sapevo da tempo che Matteo provava qualcosa per Greta, ma non sapevo come dirtelo! #slot-2}
{hardTrueFeelingsStorylet: Matteo: Ettore, non voglio sposarti.#slot-3}
{hardTrueFeelingsStorylet.ah or hardTrueFeelingsStorylet.mono: Matteo: Amo Greta. Il matrimonio era solo una scusa per farla ingelosire. #slot-4}
{greta_acting.matteoGreta: Greta: Abbiamo scopato solo una volta, ed ero molto molto molto ubriaca, e Matteo ha perso la testa. #slot-5}
{weddingAtThePubStorylet.matteoSiSposa or weddingAtThePubStorylet.matteoSiSposa2: Matteo: Elia, non festeggerò mai il mio matrimonio nel tuo bar triste con la tua insopportabile collega! #slot-6}
{marryMeStorylet.matteoSiSposa or marryMeStorylet.matteoSiSposa2: Matteo: Ettore, sei il miglior pacchetto azionario della mia vita, sposami! #slot-7}
{zeca_acting.matteoGreta: Zeca: Non mi stupirebbe se Greta stesse ricattando Matteo in qualche modo. #slot-8}
{zeca_acting.matrimonio: Zeca: No. Matteo mi ha detto che ti avrebbe sposato mesi fa, quando ha prenotato il luogo, l'orchestra e mandato gli inviti. #slot-9}
{zeca_acting.matrimonio: Zeca: Matteo e Paola hanno litigato per il matrimonio, perché Paola pensa che lui ti stia usando solo per candidarsi come sindaco. #slot-10}
{itsOverisntItStorylet: Greta: Non mi piace nulla di te, Matteo. A parte i soldi, ma sappiamo benissimo che non sono tuoi. #slot-11}
{sheIsTheBestStorylet: Elia: Eppure è stata Paola a convincere i nonni a prestarti tutti quei soldi! #slot-12}

    ~ notebookPage = 3
    ~ temp info_elia = elia_acting.paolaSiSposa or zeca_acting.matrimonio or matteo_acting.paolaZeca or greta_acting.paolaPerfetta
    
    
{info_elia:<i>Informazioni sul personaggio Paola</i> #slot-1}
{elia_acting.paolaSiSposa:Elia: Ha organizzato un matrimonio in fretta e furia, manco sappiamo con chi. #slot-2}
{matteo_acting.paolaSiSposa && marryMeStorylet: Matteo: Paola ha organizzato il matrimonio appena le ho confidato che avrei voluto sposarti, la stronza. #slot-3}
{zeca_acting.matrimonio: Zeca: Matteo e Paola hanno litigato per il matrimonio, perché Paola pensa che lui ti stia usando solo per candidarsi come sindaco. #slot-4}
{matteo_acting.paolaZeca: Matteo: Ma la cosa più ridicola è che abbia chiesto a Zeca di fare da testimone. #slot-5}
{greta_acting.paolaPerfetta: Greta: Sinceramente, non ho idea di chi possa aver ucciso Paola, lei era perfetta. #slot-6}

    ~ notebookPage = 4
    ~ temp info_greta = anEavesdropAboutFriendshipStorylet.one or zeca_acting.matteoGreta
    
{info_greta: <i>Informazioni sul personaggio Greta</i> #slot-1}
{anEavesdropAboutFriendshipStorylet.one: Greta: E così papà ed io abbiamo vissuto per mesi per strada. #slot-2}
{zeca_acting.matteoGreta: Zeca: Sinceramente, non ho mai creduto che a Greta interessi tanto il pub, quanto controllare Elia. #slot-3}
{zeca_acting.matteoGreta: Zeca: Non mi stupirebbe se Greta stesse ricattando Matteo in qualche modo. #slot-4}

    ~ notebookPage = 5
    ~ temp info_zeca = matteo_acting.paolaZeca or worstBestManStorylet.paolaZeca
    
{info_zeca: <i>Informazioni sul personaggio Zeca</i> #slot-1}
{matteo_acting.paolaZeca: Matteo: Quando sappiamo tutti in famiglia che Zeca odia Paola da sempre! #slot-2}
{worstBestManStorylet.paolaZeca: Zeca: Non vedevo Paola da una vita. Era la mia migliore amica, e ora solo una sconosciuta. #slot-3}


    ~ notebookPage = 6
    
{cb_first_tier_spiedino_cocktail.primoCheck:<i>Informazioni sullo spiedino da cocktail</i> #slot-1}
{cb_first_tier_spiedino_cocktail.primoCheck: Un banale spiedino da cocktail. In controluce si legge la sigla <i>FEG</i> #slot-2}
{elia_acting.paolaSiSposa:Elia: L'ho portato a Paola per vedere se va bene per il matrimonio. #slot-3}
{greta_acting.spiedino: Greta: <i>FEG</i>? Questa è la sigla del locale mio e di Elia, ma non ricordo di averne mai visto uno. #slot-4}


{cb_first_tier_antico_pugnale.primoCheck:<i>Informazioni sull'antico pugnale rituale</i> #slot-5}
{cb_first_tier_antico_pugnale.primoCheck: Un pugnale dall'aria antica, con simboli che non hai mai visto. #slot-6}
{elia_acting.pugnale:Elia: Matteo era disperato, l'aveva perso da settimane! #slot-7}
{zeca_acting.pugnale: Zeca: Matteo lo usa in modo <b>ossessivo</b> per pulirsi la soletta delle scarpe! #slot-8}

    ~ notebookPage = 7
{cb_first_tier_lettera.primoCheck: <i>Informazioni sulla lettera</i> #slot-1}
{cb_first_tier_lettera.primoCheck: Con una calligrafia nervosa è stato scritto: <i>So cosa hai fatto e la pagherai!</i>. Non c'è firma. #slot-2}
{greta_acting.minacce: Greta: Uh, è la calligrafia di Paola. Dove l'hai trovata? #slot-3}
{elia_acting.minacce:Elia: Sembra una roba da Matteo. Quando è pissato è capace di dire qualunque cosa. #slot-4}


{cb_first_tier_bottiglia_di_vino.primoCheck: <i>Informazioni sulla bottiglia di vino</i> #slot-5}
{cb_first_tier_bottiglia_di_vino.primoCheck: Un negroamaro di prestigio. Probabilmente costa più di quanto tu possa guadagnare in metà mese. #slot-6}


{cb_first_tier_flaconcino_asma.primoCheck: <i>Informazioni sul flaconcino dell'asma</i> #slot-7}
{cb_first_tier_flaconcino_asma.primoCheck: Un comune flaconcino. O, con un po' di fantasia, il periscopio di un sottomarino. #slot-8}


    ~ notebookPage = 8
{cb_first_tier_limetta_unghie.primoCheck: <i>Informazioni sulla limetta da unghie</i> #slot-1}
{cb_first_tier_limetta_unghie.primoCheck: Una limetta consumata, con il logo di un noto franchise molto economico. #slot-2}
{matteo_acting.limetta: Matteo: Pacchiana, economica, e con tracce di schifo? Deve essere di Greta. #slot-3}



{cb_first_tier_sigaretta_elettronica.primoCheck: <i>Informazioni sulla sigaretta elettronica</i> #slot-4}
{cb_first_tier_sigaretta_elettronica.primoCheck: Ha l'odore di un deodorante per il bagno, ma per il resto, niente di particolare. #slot-5}



{cb_first_tier_cibo.primoCheck: <i>Informazioni sulla torta</i> #slot-6}
{cb_first_tier_cibo.primoCheck: Il paradiso di un dodicenne: cioccolata, crema di arachidi, fragole, biscottini sbriciolati. La adori. #slot-7}

    ~ notebookPage = 9
{marryMeStorylet.matteoSiSposa && hardTrueFeelingsStorylet.matteoGreta: <b>Quali sono le intenzioni di Matteo sul matrimonio?</b> #slot-1}


    ~ temp contraddizione_matteo = marryMeStorylet.matteoSiSposa && hardTrueFeelingsStorylet.matteoGreta
    
    {
        - contraddizione_matteo:
            Matteo prima mi ha chiesto la mano, poi mi ha detto che ama Greta.
            Cosa sta succedendo? #slot-2
            
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

{matteo_acting.paolaZeca && worstBestManStorylet.paolaZeca: <b>La relazione tra Paola e Zeca</b> #slot-3}


    ~ temp contraddizione_zeca = matteo_acting.paolaZeca && worstBestManStorylet.paolaZeca
    
    {
        - contraddizione_zeca:
            Zeca dice di non aver parlato per anni con Paola, ma secondo Matteo lui sarebbe stato il testimone del matrimonio di Paola.
            Chi mente? #slot-4
            
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

@waitForNotebookClosed

-> intro


/**
    NOTEBOOK PER IL SECONDO TIER
**/

=== tier_two_notebook
    ~ notebookPage = 1
{
- reStartingDinnerStorylet.tuttiMorti: <b>Chi ha ucciso Paola?:</b> #slot-1
- else: <b>Il taccuino è vuoto</b> #slot-1
}


~ temp info_elia = paola_talking_second_tier.money or greta_talking_second_tier.indagini2 or greta_talking_second_tier.indagini3


{info_elia: <i>Informazioni su Elia</i>}  #slot-2
    


{paola_talking_second_tier.money: Elia per Zeca è la gallina delle uova d'oro, ma di galline non se ne trovano due in questa vita.}  #slot-3
{greta_talking_second_tier.indagini2: Greta: Elia sta usando l'amicizia con Matteo per usare il sindacato contro Paola.}  #slot-4
{greta_talking_second_tier.allestimento3: Greta: Ero in giro con Elia a sistemare i tavoli della altre sale.}  #slot-5
{greta_talking_second_tier.indagini3: Greta: E io che, stupida, coprivo i furti di denaro di Elia in azienda.}  #slot-6
{trueLoveStorylet.promise: Elia: Abbracciami. Te lo prometto Zeca: basta grattini con Greta o qualsiasi altra persona.}  #slot-7


    ~ notebookPage = 2
~ temp info_matteo = paola_talking_second_tier.allestimento or zeca_talking_second_tier.money or notABigSecretPartTwoStorylet.allestimento or phone.sindacato

{info_matteo: <i>Informazioni su Matteo</i>}  #slot-1



{zeca_talking_second_tier.money: Zeca: No: Matteo è l'unico qui dentro che campa sulle spalle dei due fratelli.}  #slot-2
{paola_talking_second_tier.allestimento: Paola: Beh, nella stanza gialla Matteo e Zeca si sono urlati contro come se ne andasse dell'intero universo. E Matteo è uscito piangendo.}  #slot-3
{notABigSecretPartTwoStorylet.allestimento: Elia: Zeca e Matteo sono andati a prendere il cibo, e non le hanno prese. Sono passati anche in farmacia e dal tabacchi per la sigaretta di Paola, e anche lì ci sono le mie barrette. Ma non le hanno prese!}  #slot-4
{phone.sindacato: Amica: E fresca fresca di oggi, il migliore amico di Elia che sta tirando su un sindacato contro la sorella. Michele, Mirco, Marco.}  #slot-5


    ~ notebookPage = 3
~ temp info_paola = zeca_talking_second_tier.allestimento2 or greta_talking_second_tier.indagini or phone.indagini

{info_paola:<i>Informazioni su Paola</i>}  #slot-1



{zeca_talking_second_tier.allestimento2: Zeca: Forse era Paola col suo vibratore a saltellare sul tavolo del buffet. Una elder millenial sicuro che ne ha sempre uno con sé.}  #slot-2
{greta_talking_second_tier.indagini: Greta: Beh: Paola sta cercando far estromettere Elia dalla Londar.}  #slot-3
{phone.indagini: E insomma, sembra che lei stia scaricando la colpa sul fratello.Agente: L'azienda di Paola è sotto indagine, sono arrivati documenti compromettenti.}  #slot-4


    ~ notebookPage = 4
~ temp info_greta = elia_talking_second_tier.indagini or liarCallLiarStorylet.indagini or liesAndPromisesStorylet or notABigSecretPartOneStorylet.allestimento or zeca_talking_second_tier.allestimento

{info_greta: <i>Informazioni su Greta</i>}  #slot-1


{zeca_talking_second_tier.allestimento: Zeca: Comunque sì, Matteo ed io ci siamo occupati di tabacco e cibo, ma non abbiamo preparato noi il buffet. Abbiamo lasciato le cose fuori dalla porta e chiesto a Greta di occuparsene, perché c'erano dei problemi coi costumi.}  #slot-2
{elia_talking_second_tier.indagini: Elia: Ma la cosa sicura è che abbiamo lasciato le bottiglie all'ingresso e non siamo entrati nella sala gialla delle pappe. Greta e io dovevamo chiamare i fornitori.}  #slot-3
{liarCallLiarStorylet.indagini: Zeca: La polizia ha avuto accesso a dati personali di Paola. Dati che solo la sua segretaria potrebbe avere.}
{liesAndPromisesStorylet.promise: Elia: Ti amo, Greta.}  #slot-4
{notABigSecretPartOneStorylet.allestimento: Matteo: Certo: Greta ed Elia potevano recuperare pure del vino decente. E hanno lasciato in tutta la stanza il puzzo delle loro cose da scenografi. Due cose dovevano fare: riparare le seggiole, allestire il buffet. E hanno fatto un disastro in tutte e due le occasioni.}  #slot-5


    ~ notebookPage = 5
~ temp info_zeca = zeca_talking_second_tier.omicidio2 or paola_talking_second_tier.money or paola_talking_second_tier.allestimento or elia_talking_second_tier.allestimento or elia_talking_second_tier.minacce

{info_zeca: <i>Informazioni su Zeca</i>}  #slot-1



{zeca_talking_second_tier.omicidio2: Zeca: Per il resto: farei qualsiasi cosa per proteggere Elia.}  #slot-2
{paola_talking_second_tier.allestimento: Paola: Ho sentito Zeca e Matteo litigare nella stanza prima del buffet.}  #slot-3
{paola_talking_second_tier.money: Paola: Beh, nella stanza gialla Matteo e Zeca si sono urlati contro come se ne andasse dell'intero universo. E Matteo è uscito piangendo.}  #slot-4
{elia_talking_second_tier.indagini: Elia: Ma la cosa sicura è che abbiamo lasciato le bottiglie all'ingresso e non siamo entrati nella sala gialla delle pappe. Greta e io dovevamo chiamare i fornitori.}  #slot-5



//Oggetti
    ~ notebookPage = 6
{cb_second_tier_lettera.primoCheck: <i>Informazioni sulla lettera</i>}  #slot-1
{cb_second_tier_lettera.primoCheck: La carta è lercia e la calligrafia  minacciosa: <i>So cosa hai fatto e la pagherai!</i>. Ha un odore metallico.}  #slot-2
{greta_acting.minacce: Greta: Uh, è la calligrafia di Paola. Dove l'hai trovata?}  #slot-3
{elia_acting.minacce:Elia: Sembra una roba da Matteo. Quando è pissato è capace di dire qualunque cosa.}  #slot-4
{matteo_talking_second_tier.lettera: Matteo: Mettila via, subito! Se Paola la trova ti mangia vivo!}  #slot-5
{matteo_talking_second_tier.lettera2: Matteo: Solo due persone in questo posto mossono minacciare qualcuno: Paola e Zeca.}  #slot-6




{cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino: <i>Informazioni sulla bottiglia di vino</i>}  #slot-7
{cb_second_tier_bottiglia_di_vino.primoCheck: Il liquido è inquieto e torbido, e si agita nella bottiglia come fosse dotato di vita propria.}  #slot-8
{paola_is_dead.vino: Rimane solo un goccio sul fondo. Le labbra di Paola hanno lo stesso colore.}  #slot-9
{paola_talking_second_tier.vino: Paola: Amo da morire questo vino.}  #slot-10
{zeca_talking_second_tier.allestimento3: Zeca: Sì, la boccia l'abbiamo presa Matteo ed io.}  #slot-11

    ~ notebookPage = 7


{cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma: <i>Informazioni sul flaconcino dell'asma</i>}  #slot-1
{cb_second_tier_flaconcino_asma.primoCheck: Banale pezzo di plastica, leggero e maleabile, a cui è aggrappata l'intera vita di una persona.}  #slot-2
{paola_is_dead.asma: Paola lo stringe ancora forte in pugno, come fosse un'arma. O un'ancora di salvezza.}  #slot-3
{paola_talking_second_tier.asma: Paola: Tra polvere e muffa in questo posto, senza potrei morire. #slot-4}



{cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta: <i>Informazioni sulla sigaretta elettronica</i> #slot-5}
{cb_second_tier_sigaretta_elettronica.primoCheck: Morte tascabile. #slot-6}
{paola_is_dead.sigaretta: Il dispenser del liquido è completamnte svuotato. #slot-7}
{paola_talking_second_tier.sigaretta: Paola: Io vivo di sigaretta elettronica. Adoro i suoi sapori chimici, la possibilità di fumarla ovunque. #slot-8}
{greta_talking_second_tier.allestimento2: Greta: Ed ecco la cosa divertente: che grazie alle sigarette elettroniche ora basta versare il veleno sulla pelle e bang, è fatta! Puoi uccidere qualcuno. #slot-9}


    ~ notebookPage = 8
{cb_second_tier_cibo.primoCheck or paola_is_dead.briciole: <i>Informazioni su torta e briciole</i> #slot-1}
{cb_second_tier_cibo.primoCheck: Friabile come le proprie sicurezze, come un sacco d'ossa che cade dal sesto piano. #slot-2}
{paola_is_dead.briciole: Sono rimasugli all'angolo della bocca. Forse qualcosa di dolce. #slot-3}
{paola_talking_second_tier.torta: Paola: Ma pensavo tutti sapessero che sono allergica alle arachidi, mortalmente. E questa è piena di crema d'arachidi. #slot-4}
{matteo_talking_second_tier.torta: Matteo: Strano: Zeca e io abbiamo preso la roba al supermercato, ma non ricordo questa torta! #slot-5}

{paola_talking_second_tier.foto2: <i>Informazioni sulla foto</i> #slot-6}
{paola_talking_second_tier.foto2: Due persone. In un locale. Con l'urgenza di divorarsi. #slot-7}

    ~ notebookPage = 9
//Condizioni
~ temp contraddizione_buffet = (zeca_talking_second_tier.allestimento or notABigSecretPartOneStorylet.allestimento) && (elia_talking_second_tier.allestimento or notABigSecretPartTwoStorylet.allestimento)
    
    {
        - contraddizione_buffet:
            ~ primaContraddizione = true
    }
    
{contraddizione_buffet: <b>Chi si è occupato del buffet?</b> #slot-1}

//choice_WhoWasInChargeOfTheBuffet = True: Greta ed Elia. = False: Zeca e Matteo.


    
    {
        - contraddizione_buffet: 
        {notABigSecretPartOneStorylet.allestimento: Matteo: Certo: Greta ed Elia potevano recuperare pure del vino decente. E hanno lasciato in tutta la stanza il puzzo delle loro cose da scenografi. Due cose dovevano fare: riparare le seggiole, allestire il buffet. E hanno fatto un disastro in tutte e due le occasioni. #slot-2}
        {zeca_talking_second_tier.allestimento:  Zeca: Comunque sì, Matteo ed io ci siamo occupati di tabacco e cibo, ma non abbiamo preparato noi il buffet. Abbiamo lasciato le cose fuori dalla porta e chiesto a Greta di occuparsene, perché c'erano dei problemi coi costumi. #slot-3}
        {elia_talking_second_tier.allestimento: Elia: Esatto. Greta e io abbiamo comprato il vino. #slot-4}
        {notABigSecretPartTwoStorylet.allestimento: Elia: Zeca e Matteo sono andati a prendere il cibo, e non le hanno prese. Sono passati anche in farmacia e dal tabacchi per la sigaretta di Paola, e anche lì ci sono le mie barrette. Ma non le hanno prese! #slot-5}
                Chi ha recuperato le cose del buffet? #slot-6
            
            
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

{contraddizione_lettera: <b>A chi è indirizzata la lettera di Paola?</b> #slot-7}


    {
        - contraddizione_lettera:
            {elia_talking_second_tier.indagini: Elia: Allora ti dico un segreto: Greta ha dato a Matteo molte informazioni sui conti dell'azienda. Vuole aiutarlo con questa cosa del sindicato, così che Matteo possa sindicare meglio sindicando Paola e venendo sindicato dai colleghi del sindicato. #slot-8}
            {greta_talking_second_tier.indagini: Greta: Beh: Paola sta cercando far estromettere Elia dalla Londar. #slot-9}
            A chi è destinata la lettera? #slot-10
            
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

@waitForNotebookClosed
-> intro