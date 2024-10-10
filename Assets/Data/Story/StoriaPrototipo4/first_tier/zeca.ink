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
    -> first_tier_storylets ->
    //INFO GENERALI//
    + [Conosci meglio Zeca] -> esplora_zeca_personaggia
    
    //SCELTE CONDIZIONALI//
    + (matrimonio) {marryMeStorylet && not hardTrueFeelingsStorylet.ah or hardTrueFeelingsStorylet.mono} Ettore: Matteo ed io ci sposeremo!
            Zeca: E immagino sia una cosa buona?
            Ettore: Non è il modo più nobile di stare assieme?
            Zeca: Nobile, è un parolone: Non è forse più nobile decidere giorno per giorno se stare assieme, senza vincoli esterni?
            Zeca: Svegliarsi e decidere di affrontare la giornata uno fianco all'altro, e non per la paura.
            Zeca: Paura di un giuidizio esterno, di un costo economico, di un vincolo legale, di un dio iracondo.
            Ettore: Sei mai stato innamorato, Zeca?
            Zeca: Buffo: Matteo mi ha chiesto la stessa cosa quando mi ha detto del matrimonio.
            -> advance_time ->
            Ettore: Te l'ha detto stasera?
            Zeca: No. Matteo mi ha detto che ti avrebbe sposato mesi fa, quando ha prenotato il luogo, l'orchestra e mandato gli inviti.
            Ettore: Ma a me ha fatto la proposta solo pochi minuti fa!
            Zeca: Matteo è una persona lungimirante, che si organizza in anticipo.
            Zeca: Non sono persona da gossip, ma una cosa però te la devo dire.
            Zeca: Matteo e Paola hanno litigato per il matrimonio, perché Paola pensa che lui ti stia usando solo per candidarsi come sindaco.
            Zeca: Sposare un povero lo renderebbe molto popolare.
            -> advance_time ->
            Ettore: Ma non sono povero! Vivo in un bilocale e riesco persino a pagarmelo!
            Zeca: Nella nostra famiglia, in quella parte della nostra famiglia per lo meno, è stato perso da tempo il contatto con la realtà.
            Ettore: Credi quindi che non mi ami davvero? Matteo, intendo.
            Zeca: Non sta a me dirlo.
            Zeca: Spero sia cambiato con gli anni, ma il Matteo che conoscevo amava solo una cosa: Matteo.
            Zeca: E tu mi sembri un bravo ragazzo. Vedi di badare a te stesso.
            -> advance_time ->

    + (matteoGreta) {hardTrueFeelingsStorylet && not are_two_entities_together(Zeca, Matteo) && not are_two_entities_together(Zeca, Greta)} Ettore: Matteo mi ha mollato.
            {zeca_acting.matrimonio: Zeca: Sai già che per me questa è una buona cosa per te.}
            Zeca: E come mai ti avrebbe lasciato?
            Ettore: Dice che ama Greta.
            Zeca: Ah, questa è buffa, davvero buffa come cosa.
            Zeca: Non voglio dire che le persone non cambino.
            Zeca: Ma in quarant'anni non ricordo una volta in cui Matteo abbia degnato di uno sguardo una donna.
            Zeca: A parte nonna, che ha sempre adorato.
            -> advance_time ->
            Ettore: Forse si è scoperto bisessuale?
            Ettore: C'è così tanto pregiudizio nella comunità gay, che a volte è difficile anche solo pensarlo.
            Zeca: O forse la nostra sorellastra ha in mente qualcosa.
            Zeca: Sinceramente, non ho mai creduto che a Greta interessi tanto il pub, quanto controllare Elia.
            Zeca: E non ho mai creduto molto nell'amicizia tra lei e Paola.
            Zeca: Non mi stupirebbe se Greta stesse ricattando Matteo in qualche modo.
            Ettore: Ricattando? E per cosa?
            Zeca: Per l'unica cosa che conta in questa famiglia: i soldi.
            Zeca: No, non è vero: <i> l'affetto dei nonni </i> e i soldi.
  
    
    //SCELTE CONDIZIONALI OGGETTI//
    + (pugnaleMatteo){inventoryContents has AnticoPugnale} Ettore: Ehi Zeca, riconosci questo pugnale!
        Zeca: Matteo lo usa in modo <b>ossessivo</b> per pulirsi la soletta delle scarpe!
        {
        - are_two_entities_together(Ettore, Matteo): Matteo: Non sono ossessivo!
            Matteo: E ora me lo riprenderei, grazie mille!
            ~ inventoryContents -= AnticoPugnale
            ~ objectStorageContents += AnticoPugnale
            }
        -> advance_time ->    
    + {inventoryContents has SpiedinoCocktail} Ettore: Questo spiedino da cocktail ti dice qualcosa?
            Zeca: Che mi manca uno spritz a modo, e una manciata di noccioline.
            Zeca: Sai cosa stavo pensando, Ettore?
            Zeca: Che sei una benedizione per la famiglia.
            Zeca: Paola è morta, ma tutti si stanno facendo i cavoli loro.
            Zeca: E invece tu cerchi di capire cosa sia successo e perché.
            Zeca: E sei un po' come questo spiedino, che sa tenere assieme cose di norma destinate a restare separate.
            Zeca: O forse, forse è la morte di Paola, lo spiedino?
            Zeca: Ci devo pensare.
            -> advance_time ->   
    + {inventoryContents has Lettera} Ettore: Hai mai visto questa lettera?
            Zeca: No, mi spiace, mio giovane amico.
    + {inventoryContents has LimettaUnghie} Ettore: Sai chi potrebbe aver perso questa limetta?
            Zeca: Una persona che non bada troppo agli orpelli, direi.
            Zeca: Potrebbe starmi persino simpatica.
    + {inventoryContents has Torta} Ettore: Hai portato tu questa torta, Zeca?
            Zeca: No. Anche perché probabilmente l'avrei mangiata tutta per strada.
            Zeca: Pensi c'entri con l'omicidio?
                + + Ettore: Lo trovo improbabile.
                + + EttorE: Non escludo niente.
                - -
            Zeca: Di certo sarebbe un colpo di scena, non trovi?
            Zeca: Una persona così motivata da spaccare la trachea di un'altra a suon di briciole.
            Zeca: Con tale costanza potrebbe salvare il mondo, altro che uccidere una sola persona.
            Zeca: O forse ha pensato di salvarlo, il mondo, uccidendola?
            Zeca: Quasi quasi anche io mi metto a indagare.
            -> advance_time ->       
    + {inventoryContents has BottigliaDiVino} Ettore: Hai idea di chi può aver portato questa bottiglia?
            Zeca: Assolutamente no, ma ora è mia.
                ~ inventoryContents -= BottigliaDiVino
                ~ objectStorageContents += BottigliaDiVino
            Ettore: Ma potrebbe essere avvelenata!
            Zeca: E io potrei essere un furgoncino.
            Zeca: Scherzi a parte, non la berrò, promesso.
            Zeca: Ma è gentile da parte tua preoccuparti per me.
            -> advance_time ->   
    + {inventoryContents has FlaconcinoAsma} Ettore: Non riesco a capire a chi appartenga questo flaconcino.
            Zeca: Mai visto, mi dispiace. Però ha una forma molto carina.
    + {inventoryContents has SigarettaElettronica} Ettore: Sei tu che fumi le sigarette elettroniche?
            Zeca: No, giovane amico.
            Zeca: La mia unica droga è l'alcool.
            Zeca: E Schopenhauer.
            Zeca: E non ho ancora capito chi dei due mi ucciderà per primo.
            Zeca: Ma nessuno dei due ha questo odore terribile.
            -> advance_time ->  
    
      
    + Te ne vai
        -> intro
    -
->->

= esplora_zeca_personaggia
{debug: <i>Passo per esplora_zeca_personaggia</i>}

{
- ZecaActing > 1: Zeca: Amico mio, amo le tue domande, ma ora devo riposare un poco.
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
-> zeca_acting 

= second_qn
 ~ ZecaActing++
    +  Ettore: Sai, Matteo non mi parla mai molto di te. Cosa fai nella vita?
        Zeca: Un po' questo, un po' quello.
        Ettore: Nel senso di tanti lavoretti?
        Zeca: No no, nel senso letterale del termine.
        Zeca: Ci sono giornate in cui esploro il <i>questo</i>, tutto ciò che è prossimo, vicino, a contatto con la mia pelle.
        Zeca: E notti in cui esploro il <i>quello</i>, l'alieno, fuori e dentro di me.
        Ettore: Eh, ehm, cosa trovi dentro di te?
        Zeca: Principalmente arachidi e superalcolici.
        -> advance_time ->
  
   
    -
-> zeca_acting     

= third_qn
~ ZecaActing++
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
-> zeca_acting




/* ---------------------------------
Opzioni di dialogo con la persona Zeca
 ----------------------------------*/

=== zeca_talking
 {debug: <i>Passo per zeca_talking</i>}
    -> resting_time ->
    //INFO GENERALI//
    + [Scambia due parole con Zeca] -> esplora_zeca
      
    + [Te ne vai]
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
   
    
    -
-> zeca_talking 

= second_qn
 ~ ZecaTalking++
    
   
    -
-> zeca_talking    

= third_qn
~ ZecaTalking++
      
    -    
-> zeca_talking
