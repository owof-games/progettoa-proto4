//INDEX
=== first_tier_storylets
{debug: <i>Passo per first_tier_storylets</i>}
{
- are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not startingDinnerStorylet && new_this_loop(->startingDinnerStorylet):
    -> startingDinnerStorylet


- are_three_entities_together(Elia, Matteo, Ettore) && not are_two_entitites_together(Elia, Zeca) && not are_two_entitites_together(Elia, Paola) && not are_two_entitites_together(Elia, Greta) && marryMeStorylet && new_this_loop(->weddingAtThePubStorylet):
    -> weddingAtThePubStorylet

- are_three_entities_together(Elia, Greta, Ettore) && not are_two_entitites_together(Elia, Matteo) && not are_two_entitites_together(Elia, Paola) && not are_two_entitites_together(Elia, Zeca) && new_this_loop(->anEavesdropAboutFriendshipStorylet):
    -> anEavesdropAboutFriendshipStorylet

 - are_three_entities_together(Elia, Greta, Paola) && (choiceMatteoVuoleSposareEttore == True or choiceMatteoVuoleSposareEttore == False) && (choiceMenteZeca == True or choiceMenteZeca == False): -> paolaIsDeadStorylet



//Confessioni solitarie    
- are_two_entitites_together(Matteo, Ettore) && not are_two_entitites_together(Elia, Ettore) && not are_two_entitites_together(Ettore, Paola) && not are_two_entitites_together(Ettore, Zeca) && not are_two_entitites_together(Ettore, Greta) && new_this_loop(->marryMeStorylet):
    -> marryMeStorylet
    
- are_two_entitites_together(Zeca, Ettore) && not are_two_entitites_together(Elia, Ettore) && not are_two_entitites_together(Ettore, Paola) && not are_two_entitites_together(Ettore, Matteo) && not are_two_entitites_together(Ettore, Greta) && new_this_loop(->worstBestManStorylet):
    -> worstBestManStorylet    

}
->->

//STORYLET CONDIZIONALI
=== startingDinnerStorylet
{debug: <i>Passo per startingDinnerStorylet</i>}
Inizio: cena, battute veloci, salta la luce, torna: Paola è morta. Da lì, indagine
Matteo: c'è Paola!
    Paola: c'è Matteo!
    -> advance_time ->
        + Ci sono anche io!
        + E ci sono dei gatti!
        -
    Greta: Ma soprattutto c'è un coniglio
        + (PaolaMorta) E qui Paola muore.
    -> advance_time ->

->->




=== weddingAtThePubStorylet
{debug: <i>Passo per weddingAtThePubStorylet</i>}
Discussione Matteo ed Elia su matrimonio al bar. Elia vuole farlo al pub, Matteo non ne vuole sapere.
    -> advance_time ->
    + (MatteoSiSposa) [Avanzo]
    -

->->



=== anEavesdropAboutFriendshipStorylet
{debug: <i>Passo per anEavesdropAboutFriendshipStorylet</i>}
Conversazione origliata: capiamo che Greta non ce l'ha con Paola, ma cagate tipo "prima che papà mi adottasse ho vissuto in strada, non possono rivivere quel trauma".
    -> advance_time ->
    + (GretaTriste) [Avanzo]
    -
->->

=== marryMeStorylet
{debug: <i>Passo per marryMe</i>}
Finalmente siamo soli, proposta di matrimonio.

    -> advance_time ->
    + (MatteoSiSposa) [Avanzo]
    -
->->

=== worstBestManStorylet
{debug: <i>Passo per worstBestMate</i>}
Zeca ci dice che non vede e sente Paola da una vita, che prima erano molto legati ma poi cose.
    -> advance_time ->
    + (PaolaZeca) [Avanzo]
    -
->->


=== paolaIsDeadStorylet
{debug: <i>paolaIsDeadStorylet</i>}
Scatta la scena in cui Paola è morta
Greta chiede a Paola che senso abbia tutta quella cosa, Paola, non risponde.
Greta la tocca, urla, e ci dice che è morta.
Tutti arrivano in quella stanza.
{
- not are_two_entitites_together(Elia, Ettore):
    ~ move_first_entity_to_second_entity_location(Elia,Ettore)
    Elia: "Che succede?!"
}
{
- not are_two_entitites_together(Zeca, Ettore):
    ~ move_first_entity_to_second_entity_location(Zeca,Ettore)
    Zeca: "Qualcuno si è fatto male?!!"
}
{
- not are_two_entitites_together(Matteo, Ettore):
    ~ move_first_entity_to_second_entity_location(Matteo,Ettore)
    Matteo: "Hanno schiacciato la coda a un gatto?"
}    

->->

//STORYLET DA SCELTE
=== hardTrueFeelingsStorylet
{debug: <i>Passo per hardTrueFeelingsStorylet</i>}
Matteo ci dice che ama Greta

    -> advance_time ->
    + (MatteoGreta)[Avanzo]
    -
->->
