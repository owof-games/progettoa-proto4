LIST QuestionAnswer = True, False, DontKnow, Unexplored

VAR choiceMatteoVuoleSposareEttore = Unexplored
VAR choiceMenteZeca = Unexplored
// tutte le altre variabili che indicano quali scelte abbiamo preso...


/*
Trovo informazioni nei dialoghi/luoghi/con interazione oggetti: sblocco fatti e domande nel taccuino (vedi sotto)
Se prendo la scelta "DontKnow", rimangono aperte le domande di indagine
Se faccio le corrette combinazioni True/False, apro il dialogo di risoluzione (e.g.: confronto Matteo sul fatto che è successo qualcosa ieri sera).
*/

/*
Visualizziamo sempre tutte le informazioni che abbiamo, a seconda dei nodi che abbiamo visitato (e che quindi ci hanno dato le relative informazioni)
I knot o stitch che indicano il fatto che abbiamo ottenuto un'informazione hanno sempre prefisso "taccu_"
Mostriamo una scelta solo se abbiamo scoperto la contraddizione
Le scelte salvano delle variabili globali che hanno sempre prefisso "choice_"
*/

=== notebook
+ {activeNotebook} [notebook]
{
- startingDinnerStorylet.paolaMorta: <b>Chi ha ucciso Paola?:</b>
- else: <b>Il taccuino è vuoto</b>
}






{elia_acting.senzatetto: <i>Informazioni sul personaggio Elia</i>}
{elia_acting.senzatetto: Elia: Paola voleva rilevare il pub per trasformarlo in un rifugio per senzatetto. E Greta ha detto cose terribili e ripetuto che avrebbe fatto di tutto per fermarla.}



{elia_acting.sincero: <i>Informazioni sul personaggio Matteo</i>}
{hardTrueFeelingsStorylet.ah or hardTrueFeelingsStorylet.mono: Matteo: Ettore: io amo Greta. Il matrimonio era solo una scusa per farla ingelosire.}
{elia_acting.sincero: Elia: Merda, mi spiace. Per questo volevo fare il matrimonio al pub. Sapevo da tempo che Matteo provava qualcosa per Greta, ma non sapevo come dirtelo!}
{greta_acting.matteoGreta: Greta: "Mi spiace Ettore, ma abbiamo scopato solo una volta, è Matteo che è proprio andato in fissa!"}
{weddingAtThePubStorylet.matteoSiSposa: Matteo: "Elia, non festeggerò mai il mio matrimonio nel tuo bar triste con la tua insopportabile collega!"}
{marryMeStorylet.matteoSiSposa: Matteo: "Ettore, sei il miglior progetto della mia vita, sposami!"}
{zeca_acting.matteoGreta: Zeca: "Sono abbastanza sicuro che Greta stia ricattando Matteo."}
{zeca_acting.matrimonio: Zeca: No. Matteo mi ha detto che ti avrebbe sposato mesi fa, quando ha prenotato il luogo, l'orchestra e mandato gli inviti.}
{zeca_acting.matrimonio: Zeca: Matteo e Paola hanno litigato per il matrimonio, perché Paola pensa che lui ti stia usando solo per candidarsi come sindaco.}
{zeca_acting.matrimonio: Zeca: Zeca: Spero sia cambiato con gli anni, ma il Matteo che conoscevo amava solo una cosa: Matteo.}


{elia_acting.paolaSiSposa:<i>Informazioni sul personaggio Paola</i>}
{elia_acting.paolaSiSposa:Elia: Ha organizzato un matrimonio in fretta e furia, manco sappiamo con chi.}
{matteo_acting.paolaSiSposa && marryMeStorylet: Matteo: Paola ha organizzato il matrimonio appena le ho confidato che avrei voluto sposarti, la stronza.}
{zeca_acting.matrimonio: Zeca: Matteo e Paola hanno litigato per il matrimonio, perché Paola pensa che lui ti stia usando solo per candidarsi come sindaco.}
{matteo_acting.paolaZeca: Matteo: Ma la cosa più ridicola è che abbia chiesto a Zeca di fare da testimone.}
{greta_acting.paolaPerfetta: Greta: "Nessuno avrebbe potuto fare male a Paola, è perfetta!"}


{anEavesdropAboutFriendshipStorylet.gretaTriste or zeca_acting.matteoGreta: <i>Informazioni sul personaggio Greta</i>}
{anEavesdropAboutFriendshipStorylet.gretaTriste: Greta: "Storia dolorosa infanzia"}
{zeca_acting.matteoGreta: Zeca: Sinceramente, non ho mai creduto che a Greta interessi tanto il pub, quanto controllare Elia.}
{zeca_acting.matteoGreta: Zeca: Non mi stupirebbe se Greta stesse ricattando Matteo in qualche modo.}

{matteo_acting.paolaZeca or worstBestManStorylet.paolaZeca: <i>Informazioni su Zeca</i>}
{matteo_acting.paolaZeca: Matteo: Quando sappiamo tutti in famiglia che Zeca odia Paola da sempre!}
{worstBestManStorylet.paolaZeca: Zeca: "Non vedevo Paola da una vita. Era la mia migliore amica, e ora solo una sconosciuta."}



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
{greta_acting.minacce: Greta: "Uh, è la calligrafia di Paola. Strano. Questa rimane a me per un po'".}
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
    
        ++ {contraddizione_matteo} Vuole sposare me {choiceMatteoVuoleSposareEttore == True: (scelta attuale)}
            ~ choiceMatteoVuoleSposareEttore = True
        ++ {contraddizione_matteo} vuole sposare Greta {choiceMatteoVuoleSposareEttore == False: (scelta attuale)}
            ~ choiceMatteoVuoleSposareEttore = False
        ++ {contraddizione_matteo} Continuo a investigare {choiceMatteoVuoleSposareEttore == DontKnow: (scelta attuale)}
            ~ choiceMatteoVuoleSposareEttore = DontKnow
        ++ ->    
        --


{matteo_acting.paolaZeca && worstBestManStorylet.paolaZeca: <b>La relazione tra Paola e Zeca</b>}


    ~ temp contraddizione_zeca = matteo_acting.paolaZeca && worstBestManStorylet.paolaZeca
    
    {
        - contraddizione_zeca:
            Zeca dice di non aver parlato per anni con Paola, ma secondo Matteo lui sarebbe stato il testimone del matrimonio di Paola.
            Chi mente?
            
    }
    
        ++ {contraddizione_zeca} Zeca {choiceMenteZeca == True: (scelta attuale)}
            ~ choiceMatteoVuoleSposareEttore = True
        ++ {contraddizione_zeca} Matteo {choiceMenteZeca == False: (scelta attuale)}
            ~ choiceMatteoVuoleSposareEttore = False
        ++ {contraddizione_zeca} Continuo a investigare {choiceMenteZeca == DontKnow: (scelta attuale)}
            ~ choiceMatteoVuoleSposareEttore = DontKnow
        ++ ->    
        --
-> intro

