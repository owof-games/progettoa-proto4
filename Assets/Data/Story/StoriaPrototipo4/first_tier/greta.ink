=== cb_first_tier_greta ===
{debug: <i>passo per second_tier_greta</i>}
+ {are_two_entities_together(Greta, Ettore) && !peopleTalking} [character:Greta] {debug: <i>Ho scelto di parlare con Greta</i>}
    -> greta_acting->
    
+ {are_two_entities_together(Greta, Ettore) && peopleTalking} [character:Greta] 
    -> greta_talking->    
-

-> intro


/* ---------------------------------
Opzioni di dialogo con il personaggio Greta
 ----------------------------------*/


=== greta_acting
    {debug: <i>Passo per greta_acting</i>}
    //INFO GENERALI//
    + [Conosci meglio Greta] -> esplora_greta_personaggia
    
    //SCELTE CONDIZIONALI//
    + (missioneGreta) {new_this_loop(->missioneGreta)} Ettore: Secondo te chi ha ucciso Paola?
            Greta: Un essere senza cuore, incapace di provare sentimenti.
            Greta: Destinato a osservare il mondo da un angolo buio, provando odio e rancore eterno.
            Greta: Spendendo ore su ore a immaginare modi atroci per distruggere sé stesso e il resto del mondo.
            Greta: Ma c'è solo una persona che può corrispondere a questa descrizione: io!
            Greta: E sono abbastanza sicura di non aver ucciso nessuno.
            Greta: Non stasera, per lo meno.
            Greta: Ma ti propongo un patto: ti dirò chi è l'assassino se tu convinci Elia a venire a parlarmi.
            Greta: Mi sta evitando da quando è venuta a mancare Paola, e non capisco perché.
            -> advance_time ->        
    + {seen_in_this_loop(->missioneGreta) && not are_two_entities_together(Greta, Elia) && loopableVariables hasnt EliaRaggiungeGreta}  Ettore: Non sono ancora riuscito a convincere Elia.
            Greta: Mi stupisce: quel ragazzo {~ha il cervello di un pesce bollito|ha smesso di ragionare nel '96|ha un unico neurone, ed è disperso da quell'undici settembre|crede che la noce moscata sia un insetto}, non deve essere difficile!
    + (paolaPerfetta) {loopableVariables has EliaRaggiungeGreta} Ettore: Ho fatto quello che mi hai chiesto, Greta.
            Greta: E Greta te ne è grata, gretino.
            Greta: Scusa, ti ho preso un po' in giro.
            Greta: Sinceramente, non ho idea di chi possa aver ucciso Paola, lei era perfetta.
            Greta: È l'unica persona che non posso davvero insultare, perché sarebbe come insultare un'icona.
            Greta: Fossi religiosa, penserei che l'abbia uccisa un demone.
            Greta: O il fisco. So che aveva aperto partita IVA da poco, ed è cosa peggiore dell'inferno.
        -> advance_time ->
     + (matteoGreta) {hardTrueFeelingsStorylet && new_this_loop(->matteoGreta)} Ettore: Quindi, Matteo ti ama?
            Ettore: Mi ha scaricato, vuole sposare te.
            Greta: Uh, questa mi è nuova.
            Ettore: Quindi non è vero che avete scopato?
            Greta: Non ho detto questo.
            Greta: Ma è successo solo una volta, ed ero molto molto molto ubriaca.
            Greta: A un certo punto pensavo fosse mio padre.
            Greta: Scusa, un po' di daddy issues li abbiamo tutti, no?
            -> advance_time ->
            Greta: Cioè, anche tu a uscire con quel tizio che è vecchio dentro da quando ha sei anni.
            Greta: Ma no, niente amore, mai.
            Greta: Greta ama solo due cose: psilocibina e Kesha.
            Greta: Se lo becco provo a farlo ragionare.
            Greta: Ma vuoi ancora sposarlo, dopo questo numero?
                + + (loVoglio)Ettore: Sì, è l'uomo giusto per me.
                + + Ettore: No, te lo puoi tenere.
                - -
            Greta: Te la butto lì: fatti dare un indennizzo, tanto i nonni son pieni di soldi.
            Greta: E facciamoci tre settimane in Messico a farci un po' di allucinogeni.
            Greta: Comunque due chiacchiere vedi che le faccio appena capita.    
            -> advance_time ->

    //SCELTE CONDIZIONALI OGGETTI//
    + (minacce) {inventoryContents has Lettera} Guarda questa lettera!
        Greta: Uh, è la calligrafia di Paola. Dove l'hai trovata?
        Greta: Non importa, comunque. Questa rimane a me per un po'.
            ~ inventoryContents -= Lettera
            ~ objectStorageContents += Lettera
            ~ gretaHaLaLettera = true
        -> advance_time ->    
    + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Briciole} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
      
    + Te ne vai
        -> intro
    -
-> greta_acting

= esplora_greta_personaggia
{debug: <i>Passo per esplora_greta_personaggia</i>}

{
- GretaActing > 1: Greta: Ettore bello, mo basta, vai a giocare da un'altra parte!
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    }
}


= first_qn
~ GretaActing++
    + Ettore: Com'è essere una sorella acquisita?
        Greta: Hai presente quando qualcuno della tua famiglia trova un gattino per strada
        Greta: e quel gattino è adorabile e coccoloso e tutti lo adorano
        Greta: e magari all'inizio in famiglia dicono che no, non lo voglio un gattino
        Greta: ma ora fanno a gare a chi lo carezza di più o gli dà da mangiare o lo fa giocare
        Greta: e quella famiglia che magari prima era un po' infelice, ora ha qualcosa di bello attorno a cui riunirsi
        Greta: e ogni giorno sembra Natale, una festa di compleanno, un matrimonio?
        Greta: Ecco, io per loro sono i vermi del micino, e la diarrea che ti caccerà per tutta casa.
    -> advance_time ->
    
    -
-> greta_acting 

= second_qn
 ~ GretaActing++
    +  Ettore: Come mai hai deciso di aprire il pub con Elia?
        Greta: Perché qualcuno doveva chiudere da qualche parte quella specie di labrador.
        Greta: E perché è un bel luogo dove insultare le persone.
        Greta: Tanto i comici che vengono sono solo dei falliti.
        Greta: E poi ho accesso infinito all'alcool, gratuitamente.
        Greta: Cosa che ora mi renderebbe tutto questo più sopportabile.
        Greta: E non intendo la morte di Paola.
        Greta: Intendo questa conversazione.
    -> advance_time ->
   
    -
-> greta_acting     

= third_qn
~ GretaActing++
    Greta: Chissà Matteo come sta.
        +  Ettore: Non sapevo fossi legata a Matteo.
        Greta: Vedrai presto che in questa famiglia tutti sono legati, quasi incollati, inchiodati.
        Greta: Non è una famiglia, è un culto.
        Greta: E se la divinità è Paola, Matteo è l'eretico che vuole prendere il suo posto, e amo gli eretici.
        Ettore: Anche Matteo ha stima di te. Racconta spesso di quello che pensi e dici.
        Greta: E cosa penserei?
        Ettore: Ehm, io ora non ricordo bene.
        Greta: Non parla mai di me, vero?
        Greta: Meglio: adoro essere ignorata dalla mia divinità, è una cosa così cattolica.
    -> advance_time ->    
    -    
-> greta_acting




/* ---------------------------------
Opzioni di dialogo con la persona Greta
 ----------------------------------*/

=== greta_talking
 {debug: <i>Passo per greta_talking</i>}
    -> resting_time ->
    //INFO GENERALI//
    + Fai domande sulla persona Greta -> esplora_greta

    //SCELTE CONDIZIONALI//
    

    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Briciole} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai -> intro
    -
    
    -> greta_talking
    

= esplora_greta
{debug: <i>Passo per esplora_greta</i>}
-> resting_time ->

{
- GretaTalking > 1: Greta: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA GRETA

= first_qn
~ GretaTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> greta_talking 

= second_qn
 ~ GretaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> greta_talking    

= third_qn
~ GretaTalking++
    Greta dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> greta_talking