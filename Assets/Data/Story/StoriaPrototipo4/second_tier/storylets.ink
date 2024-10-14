=== second_tier_storylets

{

//SCENA INIZIALE
    - are_six_entities_together(Elia, Matteo, Ettore, Greta, Paola, Zeca) && not reStartingDinnerStorylet && peopleTalking == false && new_this_loop(->reStartingDinnerStorylet):
    -> reStartingDinnerStorylet
    

//STORYLET "NORMALI"    

    - are_three_entities_together(Elia, Ettore, Zeca) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo) && greta_talking_second_tier.indagini && new_this_loop(-> liarCallLiarStorylet):
            -> liarCallLiarStorylet
    
    - inventoryContents(Foto) && are_two_entities_together (Zeca, Ettore): -> iLlKillThatBitchStorylet    


//CONVERSAZIONI ORIGLIATE

    - are_two_entities_together(Elia, Zeca) && is_this_entity_near_Ettore(Elia) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo) && greta_talking_second_tier.indagini && loopableVariables == (EliaSpaventatoPerZeca) && new_this_loop(-> whisperingSecretsStorylet): -> whisperingSecretsStorylet
    
    - are_two_entities_together(Elia, Zeca) && is_this_entity_near_Ettore(Elia) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo) && paola_talking_second_tier.foto2 && new_this_loop(-> trueLoveStorylet):
        -> trueLoveStorylet
    
    - are_two_entities_together(Matteo, Zeca) && is_this_entity_near_Ettore(Matteo) && not are_two_entities_together(Matteo, Greta) && not are_two_entities_together(Matteo, Paola) && not are_two_entities_together(Matteo, Elia) && matteo_talking_second_tier.allestimento && new_this_loop(-> iTryToBeAGoodFriendStorylet):
        -> iTryToBeAGoodFriendStorylet  
    
    
    - are_three_entities_together(Elia, Ettore, Greta) && not are_two_entities_together(Elia, Zeca) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo)&& new_this_loop(-> liesAndPromisesStorylet ):
        -> liesAndPromisesStorylet
    

//CONVERSAZIONI IN ALTRE STANZE, CHE NON ORIGLIAMO, E CHE CONTINUANO QUANDO ENTRIAMO


//CONFESSIONI SOLITARIE 
    - are_entities_together_in(Matteo, Ettore, YellowRoom) && not are_two_entities_together(Matteo, Greta) && not are_two_entities_together(Matteo, Paola) && not are_two_entities_together(Matteo, Elia) && not are_two_entities_together(Matteo, Zeca) && new_this_loop(->notABigSecretPartOneStorylet):
            -> notABigSecretPartOneStorylet

    - are_entities_together_in(Ettore, Elia, YellowRoom) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Paola) && not are_two_entities_together(Elia, Matteo) && not are_two_entities_together(Elia, Zeca) && new_this_loop(->notABigSecretPartTwoStorylet):
            -> notABigSecretPartTwoStorylet


// MORTE DI PAOLA
    - currentTime >= 600:
    -> paolaIsDeadStorylet    

- else: ->->


}



/* ---------------------------------

   Storylets

 ----------------------------------*/
 
 
//SCENA INIZIALE
=== reStartingDinnerStorylet
    {debug: <i>Passo per startingDinnerStorylet</i>}
        Matteo: No, ma ti giuro Paola, ti giuro! Faceva tutto lo sborone quello.
            -> advance_time ->
        Matteo: Poi ho chiamato nonno e: bang!
        Matteo: Tutto il consiglio di amministrazione muto.
        Matteo: E il progetto per la piscina sul tetto del grattacielo è passato.
        Greta: Un giorno annegherete tutti, e sarà festa nazionale.
        Paola: Non voglio morire non voglio morire non voglio morire non voglio.
        Elia: Quindi è permesso augurare la morte a qualcuno? Perché avrei un po' di nomi, nel caso.
        Zeca: Elia, almeno tu mantieni la tua innocenza o perderei l'unica spinta a sacrificarti.
            + Ettore: Eccomi! In tutto il mio splendore!
            + Ettore: Cosa diavolo è successo?!?
            + Ettore: Non ho alcuna innocenza: chi devo spingere dal grattacielo?
            -
            -> advance_time ->
        Matteo: Amore! Non ti avevo sentito proprio arrivare!
        Matteo: Fratelli, sorella, Greta.
        Greta: Fottiti.
        Matteo: Vi presento l'uomo che amo: Ettore. Ettore, loro sono i miei familiari.
            + Ettore: Finalmente incontro il famoso Elia!
                Elia: Famoso? Sono finito su Tik Tok?
                Greta: No, nel Guinness dei Primati come primo essere umano senza cervello.
            + Ettore: Tu devi essere Paola! Matteo parla un sacco di te!
                Paola: Non voglio morire non voglio morire non voglio morire non voglio.
                Matteo: Non ti parlo così tanto di lei. A parte a pranzo, cena, letto e durante le preghiere.
            + Ettore: Perché state facendo finta di nulla?!?.
                Greta: Bene Matteo, finalmente ci presenti qualcuno di interessante!
                Zeca: E almeno abbiamo qualcosa in comune.
            -
            -> advance_time ->
        Paola: Non voglio morire non voglio morire non voglio morire non voglio.
        Elia: Sapete che nemmeno oggi ho aperto la porta dal lato giusto?
        Elia: Sono tutto un livido, guardate!
        Greta: Questo è un buon motivo per festeggiare in effetti.
        Matteo: Nessuno ha detto che dobbiamo festeggiare.
        Paola: Non voglio morire non voglio morire non voglio morire non voglio.
        Matteo: Però brindiamo! Perché siamo qui ad affrontare l'alcolismo di Zeca, e farlo smettere di bere.
            + Ettore: E avete pensato di partire con un brindisi?
                Zeca: Ettore, giusto? Ecco, Ettore: non farti domande su questa famiglia, o c'è da perdere il senno.
            + Ettore: Ehm, e io che c'entro?
                Matteo: Tu sei il testimone speciale, vedrai!
            + Ettore: Forse ho bevuto davvero? E non lo ricordo?
                Paola: Non voglio morire non voglio morire non voglio morire non voglio.
            -
            -> advance_time ->
            
        Paola: Non voglio morire non voglio morire non voglio morire non voglio.
             ~ move_this_entity_in_a_different_room(Paola)
        Greta: Ho scordato una cosa!
            ~ move_this_entity_in_a_different_room(Greta)
        Matteo: A questo punto faccio una chiamata.
            ~ move_this_entity_in_a_different_room(Matteo)
        Zeca: E io ne approfitto per scappare.
            ~ move_this_entity_in_a_different_room(Zeca)
        Elia: Beh, a questo punto me ne vado anche io!    
            ~ move_this_entity_in_a_different_room(Matteo)
            + Ettore: Bella festa, davvero. Grazie.
            + Ettore: Boh, a questo punto me ne vado anche io.
            + Ettore: Ma non è che c'è dell'altro vino in giro?
            -
            -> advance_time ->

            ~ move_entity(Elia,WhiteRoom)
        Elia entra, muore.
            ~ move_entity(Zeca,WhiteRoom)
        Zeca entra, muore.
            ~ move_entity(Matteo,WhiteRoom)
        Matteo entra, muore.
            ~ move_entity(Greta,WhiteRoom)        
        Greta entra, muore.
            ~ move_entity(Paola,WhiteRoom)
        Paola: Non voglio morire non voglio morire non voglio morire non voglio.
        Paola muore.

            -> advance_time ->

            + (tuttiMorti) Ettore: Perché vi comportate così?!?!
            -
        Paola: Non voglio morire non voglio morire non voglio.
            -> advance_time ->
        Greta: BASTAAAAAAA! Questo script è tremendo!
        Paola: Non voglio morire non voglio.
        Elia: Basta, basta, basta. Prendiamoci dieci minuti di riposo.
        Paola: Non voglio.
            ~ peopleTalking = true
            -> advance_time ->

    -> intro



//STORYLET "NORMALI"

=== liarCallLiarStorylet
    + (indagini) Zeca ci dice che la polizia ha avuto anche dati personali di Paola.
        Dati a cui solo la segretaria personale avrebbe potuto avere accesso.
    -
    -> intro


=== iLlKillThatBitchStorylet
Zeca ci sgama con la foto e andrà ad aggredire Greta, con piccole variazioni a seconda che lei sia già o meno nella stanza.
    -> intro  



//CONVERSAZIONI ORIGLIATE



//CONVERSAZIONI ORIGLIATE

=== whisperingSecretsStorylet
Qui Elia e Zeca bisbigliano, e se facciamo domande si zittiscono.
Si capisce che Elia sia convinto che Zeca voglia proteggerlo, fino forse a minacciare Paola.
Zeca risponde "Figurati. E poi se lei casca come li prendo tutti quei soldi?"
    + XX
    -
    -> intro


=== iTryToBeAGoodFriendStorylet
Conversazione origliata
Zeca e Matteo parlano del litigio, e si capisce che Matteo sa qualcosa e non vuole che Zeca ci rimanga male, ma non risponde alle pressioni di Zeca.
    -> intro


=== liesAndPromisesStorylet 
Storylet solo narrativo con Elia che promette a Greta amore etc.
 + {trueLoveStorylet}: possiamo guastare la festa.
    -> intro


=== trueLoveStorylet
Conversazione origliata
Elia ammette i suoi sentimenti per Zeca, promette che smetterà di cazzeggiare con Greta.
    -> intro    




//CONFESSIONI SOLITARIE 
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


//STORYLET DI CHIUSURA
=== finalStorylet


-> END