//INDEX
=== second_tier_storylets

{

    - are_entities_together_in(Matteo, Ettore, YellowRoom) && not are_four_entities_together(Zeca, Greta, Paola, Elia) && new_this_loop(->notABigSecretPartOneStorylet): -> notABigSecretPartOneStorylet

    - are_entities_together_in(Ettore, Elia, YellowRoom) && not are_four_entities_together(Zeca, Greta, Paola, Matteo) && new_this_loop(->notABigSecretPartTwoStorylet): -> notABigSecretPartTwoStorylet

    - are_three_entities_together(Elia, Ettore, Zeca) && not are_four_entities_together(Zeca, Greta, Paola, Matteo) && greta_talking_second_tier.indagini && new_this_loop(-> liarCallLiarStorylet):
    -> liarCallLiarStorylet
    

    - are_three_entities_together(Elia, Ettore, Greta) && not are_four_entities_together(Zeca, Matteo, Paola, Elia) && iTryToBeAGoodFriendStorylet.allestimento && new_this_loop(-> liesAndPromisesStorylet ):
    -> liesAndPromisesStorylet
    


    - currentTime >= 200:
    -> paolaIsDeadStorylet    


    
- inventoryContents(Foto) && are_two_entities_together (Zeca, Ettore): -> iLlKillThatBitchStorylet    


//CONVERSAZIONI ORIGLIATE
TODO: quando due o più persone devono essere da sole, mettere not + are two entities per ogni singola combinazione di personaggie
    - are_two_entities_together(Elia, Zeca) && is_this_entity_near_Ettore(Elia) && not are_four_entities_together(Zeca, Greta, Paola, Matteo)  && greta_talking_second_tier.indagini && loopableVariables == (EliaSpaventatoPerZeca) && new_this_loop(-> whisperingSecretsStorylet): -> whisperingSecretsStorylet
    
    - are_two_entities_together(Elia, Zeca) && is_this_entity_near_Ettore(Elia) && not are_four_entities_together(Greta, Matteo, Paola, Elia) && elia_talking_second_tier.allestimento2 && paola_talking_second_tier.foto2 && iTryToBeAGoodFriendStorylet.allestimento && new_this_loop(-> trueLoveStorylet):
    -> trueLoveStorylet
    
    - are_two_entities_together(Matteo, Zeca) && is_this_entity_near_Ettore(Matteo) && not are_four_entities_together(Zeca, Greta, Paola, Elia) && matteo_talking_second_tier.allestimento && new_this_loop(-> iTryToBeAGoodFriendStorylet):
    -> iTryToBeAGoodFriendStorylet  
    
- else: ->->

//CONVERSAZIONI IN ALTRE STANZE, CHE NON ORIGLIAMO, E CHE CONTINUANO QUANDO ENTRIAMO

}

->->

//STORYLETS
=== liarCallLiarStorylet
    + (Indagini) Zeca ci dice che la polizia ha avuto anche dati personali di Paola.
        Dati a cui solo la segretaria personale avrebbe potuto avere accesso.
    -
->->



=== whisperingSecretsStorylet
Qui Elia e Zeca bisbigliano, e se facciamo domande si zittiscono.
Si capisce che Elia sia convinto che Zeca voglia proteggerlo, fino forse a minacciare Paola.
Zeca risponde "Figurati. E poi se lei casca come li prendo tutti quei soldi?"
    + XX
    -
->->

=== notABigSecretPartOneStorylet
    + (allestimento) Matteo ci dice che Greta ed Elia hanno recuperato il bere
        Si sono occupati anche degli elementi della scenografia
{
    - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Matteo, Ettore, Greta) or are_three_entities_together(Matteo, Ettore, Zeca): -> quickTalk
    -else: ->->
}
->->

= quickTalk
Matteo dice cazzate e ci caccia.

-> intro

=== notABigSecretPartTwoStorylet
    + (allestimento) Elia ci dice che Zeca e Matteo hanno recuperato le cibarie
        Sono anche passati in farmacia, e a prendere le ricariche per le sigarette elettroniche di Paola

{
    - are_three_entities_together(Matteo, Ettore, Elia) or are_three_entities_together(Elia, Ettore, Greta) or are_three_entities_together(Elia, Ettore, Zeca): -> quickTalk
    -else: ->->
}

= quickTalk
Elia dice cazzate e ci caccia.

-> intro


=== iTryToBeAGoodFriendStorylet
Conversazione origliata
Zeca e Matteo parlano del litigio, e si capisce che Matteo sa qualcosa e non vuole che Zeca ci rimanga male, ma non risponde alle pressioni di Zeca.
    + (allestimento) qui, se sappiamo che i due scopano possiamo intervenire e dirlo, col risultato che poi Zeca affronterà Elia.
        "Son quei due che andavano in giro col veleno per topi, non noi."
->->

=== liesAndPromisesStorylet 
Storylet solo narrativo con Elia che promette a Greta amore etc.
 + {trueLoveStorylet}: possiamo guastare la festa.
->->

=== trueLoveStorylet
Conversazione origliata
Elia ammette i suoi sentimenti per Zeca, promette che smetterà di cazzeggiare con Greta.
->->

=== iLlKillThatBitchStorylet
Zeca ci sgama con la foto e andrà ad aggredire Greta, con piccole variazioni a seconda che lei sia già o meno nella stanza.
->->