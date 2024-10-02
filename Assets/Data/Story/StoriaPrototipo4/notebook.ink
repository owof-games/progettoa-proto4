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
+ [notebook]
{
- startingDinnerStorylet.PaolaMorta: <b>Chi ha ucciso Paola?:</b>
- else: <b>Il taccuino è vuoto</b>
}





{elia_acting.senzatetto: <i>Informazioni su Elia</i>}
{elia_acting.senzatetto: Elia: "Paola voleva trasformare il nostro locale in un rifugio per senzatetto, e Greta per questo ha giurato più volte che piuttosto l'avrebbe uccisa!"}
{elia_acting.sincero: Elia: "Ettore, mi spiace tantissimo. Sapevo da tempo che Matteo provava qualcosa per Greta, ma non sapevo come dirtelo!"}


{elia_acting.sincero: <i>Informazioni su Matteo</i>}
{hardTrueFeelingsStorylet.MatteoGreta: Matteo: "Mi spiace, ma amo Greta, non te. Il matrimonio era solo una scusa per farla ingelosire."}
{elia_acting.sincero: Elia: "Ettore, mi spiace tantissimo. Sapevo da tempo che Matteo provava qualcosa per Greta, ma non sapevo come dirtelo!"}
{greta_acting.MatteoGreta: Greta: "Mi spiace Ettore, ma abbiamo scopato solo una volta, è Matteo che è proprio andato in fissa!"}
{weddingAtThePubStorylet.MatteoSiSposa: Matteo: "Elia, non festeggerò mai il mio matrimonio nel tuo bar triste con la tua insopportabile collega!"}
{marryMeStorylet.MatteoSiSposa: Matteo: "Ettore, sei il miglior progetto della mia vita, sposami!"}
{zeca_acting.MatteoGreta: Zeca: "Sono abbastanza sicuro che Greta stia ricattando Matteo."}



{elia_acting.paolaSiSposa:<i>Informazioni su Paola</i>}
{elia_acting.paolaSiSposa:Elia: "Ha organizzato un matrimonio in fretta e furia, manco sappiamo con chi."}
{matteo_acting.paolaSiSposa && marryMeStorylet: Matteo: "Paola ha organizzato il matrimonio appena le ho confidato che avrei voluto sposarti."}
{matteo_acting.ZecaTestimone: Matteo:"La cosa che mi ha stupito è che abbia chiesto a Zeca di farle da testimone!"}
{greta_acting.PaolaPerfetta: Greta: "Nessuno avrebbe potuto fare male a Paola, è perfetta!"}


{anEavesdropAboutFriendshipStorylet.GretaTriste: <i>Informazioni su Greta</i>}
{anEavesdropAboutFriendshipStorylet.GretaTriste: Greta: "Storia dolorosa infanzia"}


{matteo_acting.ZecaTestimone or worstBestManStorylet.PaolaZeca: <i>Informazioni su Zeca</i>}
{matteo_acting.ZecaTestimone: Matteo:"Sappiamo tutti che Zeca odia la povera Paola da sempre!"}
{worstBestManStorylet.PaolaZeca: Zeca: "Non vedevo Paola da una vita. Era la mia migliore amica, e ora solo una sconosciuta."}

{elia_acting.paolaSiSposa:<i>Informazioni sullo spiedino da cocktail</i>}
{elia_acting.paolaSiSposa:Elia: "L'ho portato per mostrarlo a Paola, per il matrimonio."}


{elia_acting.pugnaleMatteo:<i>Informazioni sull'antico pugnale rituale</i>}
{elia_acting.pugnaleMatteo:Elia: "Matteo era disperato, l'aveva perso da settimane!"}
{zeca_acting.pugnaleMatteo:Elia: "Matteo lo usa per pulirsi la suola delle scarpe, che schifo."}

{greta_acting.GretaHaLettera: <i>Informazioni sulla lettera</i>}
{greta_acting.GretaHaLettera: Greta: "Uh, è la calligrafia di Paola. Strano. Questa rimane a me per un po'".}



{marryMeStorylet.MatteoSiSposa && hardTrueFeelingsStorylet.MatteoGreta: <b>Quali sono le intenzioni di Matteo sul matrimonio?</b>}


    ~ temp contraddizione_matteo = marryMeStorylet.MatteoSiSposa && hardTrueFeelingsStorylet.MatteoGreta
    
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


{matteo_acting.ZecaTestimone && worstBestManStorylet.PaolaZeca: <b>La relazione tra Paola e Zeca</b>}


    ~ temp contraddizione_zeca = matteo_acting.ZecaTestimone && worstBestManStorylet.PaolaZeca
    
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


//INVENTARIO//
+ {inventoryContents has Lettera} [Lascia la lettera]
        ~ remove_entity(Lettera)
+ {inventoryContents has SpiedinoCocktail} [Lascia lo spiedino]
        ~ remove_entity(SpiedinoCocktail)
+ {inventoryContents has AnticoPugnale} [Lascia il pugnale]
        ~ remove_entity(AnticoPugnale)
+ {inventoryContents has LimettaUnghie} [Lascia limetta unghie]
        ~ remove_entity(LimettaUnghie)
-       
-> intro

