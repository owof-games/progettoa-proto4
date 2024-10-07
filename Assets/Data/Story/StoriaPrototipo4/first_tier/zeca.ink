=== cb_first_tier_zeca ===
{debug: <i>passo per first_tier_zeca</i>}

+ {are_two_entities_together(Zeca, Ettore) && !peopleTalking} [character:Zeca] {debug: <i>Ho scelto di parlare con Zeca</i>}
    -> zeca_acting ->
    
+ {are_two_entities_together(Zeca, Ettore) && peopleTalking} [character:Zeca]
    -> zeca_talking ->    
-

-> intro




/* ---------------------------------
Opzioni di dialogo con il personaggio Zeca
 ----------------------------------*/


=== zeca_acting
    {debug: <i>Passo per zeca_acting</i>}
    //INFO GENERALI//
    + Fai domande sul personaggio Zeca -> esplora_zeca_personaggia
    
    //SCELTE CONDIZIONALI//
    + (matrimonio) {marryMeStorylet} Zeca ci fa capire che sapeva da un po' del matrimonio.
    + (matteoGreta) {hardTrueFeelingsStorylet && not are_two_entities_together(Zeca, Matteo) && not are_two_entities_together(Zeca, Greta)} Zeca ci dice che Matteo è ricattato da Greta, ma non sa bene per cosa.
    
    //SCELTE CONDIZIONALI OGGETTI//
    + (pugnaleMatteo){inventoryContents has AnticoPugnale} Guarda questo pugnale!
        Zeca: "Matteo lo usa in modo <b>ossessivo</b> per pulirsi la soletta delle scarpe!"
        {
        - are_two_entities_together(Ettore, Matteo): Matteo: "Non sono ossessivo!"
        Matteo: "E ora me lo riprenderei, grazie mille!"
            ~ inventoryContents -= AnticoPugnale
            ~ objectStorageContents += AnticoPugnale
            }
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Briciole} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
        -> intro
    -
->->

= esplora_zeca_personaggia
{debug: <i>Passo per esplora_zeca_personaggia</i>}

{
- ZecaActing > 1: Zeca: "Non mi va di rispondere ad altre domande personali".
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
~ ZecaActing++
    + Prima domanda
    -> advance_time ->
    
    -
-> zeca_acting 

= second_qn
 ~ ZecaActing++
    +  altra domanda
    -> advance_time ->
   
    -
-> zeca_acting     

= third_qn
~ ZecaActing++
    Zeca dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> zeca_acting




/* ---------------------------------
Opzioni di dialogo con la persona Zeca
 ----------------------------------*/

=== zeca_talking
 {debug: <i>Passo per zeca_talking</i>}
    -> resting_time ->
    //INFO GENERALI//
    + [Scambia due parole con Zeca] -> esplora_zeca

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
    
      
    + Te ne vai
    -> intro
    -
    
    -> zeca_talking
    

= esplora_zeca
{debug: <i>Passo per esplora_zeca</i>}
-> resting_time ->

{
- ZecaTalking > 1: Zeca: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA ZECA

= first_qn
~ ZecaTalking++
    + Ettore: Ti era mancato vedere i tuoi fratelli e sorelle?
    Zeca: Avrei preferito un contesto diverso, ma sì, mi sono mancati.
    Zeca: Anche se credo mi manchi qualcosa che non c'è più, il passato con loro.
    Zeca: Quando eravamo poveri, ma felici.
    Zeca: Quando nessuno di noi doveva tuffarsi in alcool, lavoro o cazzate spirituali per sopravvivere un'altra giornata.
    Zeca: Mi sembra di stare in una stanza piena di ragazzini che ancora vogliono compiacere papà e mamma.
    Zeca: Anche se son morti da decenni.
    Zeca: E alla fine cosa mi rimane da fare se non riprendere a ignorarli e bere?
    -> advance_time ->
    
    -
-> zeca_talking 

= second_qn
 ~ ZecaTalking++
    +  Ettore: Sai, Matteo non mi parla mai molto di te. Cosa fai nella vita?
    Zeca: Un po' questo, un po' quello.
    Ettore: Nel senso di tanti lavoretti?
    Zeca: No no, nel senso letterale del termine.
    Zeca: Ci sono giornate in cui esploro il <i>questo>/i>, tutto ciò che è prossimo, vicino, a contatto con la mia pelle.
    Zeca: E notti in cui esploro il <i>quello</i>, l'alieno, fuori e dentro di me.
    Ettore: Eh, ehm, cosa trovi dentro di te?
    Zeca: Principalmente arachidi e superalcolici.
    -> advance_time ->
   
    -
-> zeca_talking    

= third_qn
~ ZecaTalking++
    Zeca: Ettore, tu sei in giro a fare un sacco di domande, ma ti sei mai chiesto la cosa più grande?
    Ettore: E quale sarebbe?
    Zeca: La grande domande non è chi avrebbe avuto motivo di uccidere Paola, ma chi avrebbe avuto un motivo per tenerla in vita.
    Zeca: Quello è il crimine più grande.
    Zeca: Davanti a questo mondo che brucia, infettato dal fascismo, distrutto dal capitalismo e dall'individualismo, dimmi:
    Zeca: non è forse più crudele volere che qualcun altro viva un solo giorno in tutto questo?
    Zeca: Forse, giovane amico, stai indagando sul crimine sbagliato.
    Zeca: Pensaci su, mentre vado a cercare del pastis.
    -> advance_time ->    
    -    
-> zeca_talking
