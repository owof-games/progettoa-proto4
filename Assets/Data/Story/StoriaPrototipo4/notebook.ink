LIST QuestionAnswer = True, False, DontKnow, Unexplored

VAR choice_Zeca_is_right_about_elia = Unexplored
VAR choice_Ibrahim_Innocence = Unexplored
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
+ [Aggiorna taccuino]
{
- relationshipDiscovered: <b>Chi ha ucciso Paola?:</b>
- else: <b>Il taccuino è vuoto</b>
}





{cb_first_tier_elia.elia_acting.senzatetto: <i>Informazioni di Elia</i>}
{cb_first_tier_elia.elia_acting.senzatetto: "Paola voleva trasformare il nostro locale in un rifugio per senzatetto, e Greta per questo ha giurato più volte che piuttosto l'avrebbe uccisa!"}

/*
{cb_drug_bottle.matteo_room.taccu_drogaCameraMatteo or cb_paola.paola_room.taccu_Spacciatore or cb_Greta.paola_room.taccu_GretaNoDrogaMatteo or cb_paola.paola_room.taccu_IG or cb_vestiti_strappati.matteo_room.taccu_vestitiStrappati: <b>Perché Matteo è preso male?</b>}

{
- cb_drug_bottle.matteo_room.taccu_drogaCameraMatteo or cb_paola.paola_room.taccu_Spacciatore or cb_Greta.paola_room.taccu_GretaNoDrogaMatteo or cb_paola.paola_room.taccu_IG or cb_vestiti_strappati.matteo_room.taccu_vestitiStrappati: <i>Le info sul tuo taccuino sono:</i>
- else: <i>Il taccuino è vuoto</i>
}
  

    ~ temp contraddizione_Zeca_elia = cb_Zeca.kitchen.taccu_EliaAssente and cb_elia.eliaAndZeca_room.taccu_eliaDatoDroga
    
    {
        - cb_Zeca.kitchen.taccu_EliaAssente and not cb_elia.eliaAndZeca_room.taccu_eliaDatoDroga:
            Secondo Zeca, Elia ieri sera non era a casa
        - not cb_Zeca.kitchen.taccu_EliaAssente and cb_elia.eliaAndZeca_room.taccu_eliaDatoDroga:
            Elia ci ha detto che ieri sera ha dato le droghe a Matteo.
        - contraddizione_Zeca_elia:
            Zeca sostiene che Elia ieri sera non fosse in casa, ma Elia ha detto di aver dato ieri sera delle droghe a Matteo. Chi mente: Zeca o Elia?
            
    }
    
        ++ {contraddizione_Zeca_elia} Elia {choice_Zeca_is_right_about_elia == True: (scelta attuale)}
            ~ choice_Zeca_is_right_about_elia = True
        ++ {contraddizione_Zeca_elia} Zeca {choice_Zeca_is_right_about_elia == False: (scelta attuale)}
            ~ choice_Zeca_is_right_about_elia = False
        ++ {contraddizione_Zeca_elia} Continua a investigare {choice_Zeca_is_right_about_elia == DontKnow: (scelta attuale)}
            ~ choice_Zeca_is_right_about_elia = DontKnow
        ++ ->    
        --


*/
//INVENTARIO//
+ {inventory_contents has Lettera} [Lascia la lettera]
        ~ removeEntity(Lettera)
+ {inventory_contents has SpiedinoCocktail} [Lascia lo spiedino]
        ~ removeEntity(SpiedinoCocktail)
+ {inventory_contents has AnticoPugnale} [Lascia il pugnale]
        ~ removeEntity(AnticoPugnale)
+ {inventory_contents has LimettaUnghie} [Lascia limetta unghie]
        ~ removeEntity(LimettaUnghie)
-       
TODO: trovare una soluzione che non duplichi codice
{
- TierState == first_tier: -> cb_first_tier
- TierState == second_tier: -> cb_second_tier
}
