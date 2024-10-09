=== cb_first_tier_matteo ===
{debug: <i>passo per first_tier_matteo</i>}
+ {are_two_entities_together(Matteo, Ettore) && !peopleTalking} [character:Matteo] {debug: <i>Ho scelto di parlare con Matteo</i>}
    -> matteo_acting ->

+ {are_two_entities_together(Matteo, Ettore) && peopleTalking} [character:Matteo]
    -> matteo_talking ->    
-

-> intro



/* ---------------------------------
Opzioni di dialogo con il personaggio Matteo
 ----------------------------------*/


=== matteo_acting
    {debug: <i>Passo per matteo_acting</i>}
    //INFO GENERALI//
    + [Chiacchiera un po' con Matteo] -> esplora_matteo_personaggia
    
    //SCELTE CONDIZIONALI//
    
    + (paolaSiSposa) {elia_acting.paolaSiSposa} Ettore: Matteo, ma tu sapevi che Paola si stava per sposare?
        {not marryMeStorylet: Matteo: Era un po' un segreto di pulcinella.}
        {marryMeStorylet: Matteo: Paola ha organizzato il matrimonio appena le ho confidato che avrei voluto sposarti, la stronza.}
        + + (paolaZeca){marryMeStorylet && not are_two_entities_together(Zeca, Matteo)} Ettore: E come l'hai presa?
            Matteo: Mi sono incazzato. Ma non così tanto da volerla uccidere, se è quello il tuo dubbio.
            Matteo: Ma la cosa più ridicola è che abbia chiesto a Zeca di fare da testimone.
            Matteo: Quando sappiamo tutti in famiglia che Zeca odia Paola da sempre!
            Matteo: E non a me, il fratello fedele che le dava un sacco di soldi per le sue opere di carità.
            Matteo: No, al fallito, a quello che fa vergognare tutta la famiglia.
            Matteo: Quello che si è rovinato la vita per tirare su un collettivo di videogiochi.
            Matteo: Ma andasse a zappare!
            -> advance_time ->
        - -    
    + {new_this_loop(->hardTrueFeelingsStorylet)} {elia_acting.uniti && not are_four_entities_together(Greta, Elia, Matteo, Zeca)} Ettore: Amore, avrei un favore da chiederti in merito al matrimonio.
        ->hardTrueFeelingsStorylet->
    
        
    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has SpiedinoCocktail} Ettore: Hai mai visto questo spiedino?
            Matteo: No.
    + {inventoryContents has Lettera} Ettore: Riconosci questa lettera?
            Matteo: Come? Mettila via, subito!
            Ettore: Perché?
            Matteo: SUBITO!
    + (limetta) {inventoryContents has LimettaUnghie} Ettore: Sai di chi sia questa limetta?
            Matteo: Pacchiana, economica, e con tracce di schifo? Deve essere di Greta.
    + {inventoryContents has Torta} Ettore: Hai portato tu questa torta?
            Matteo: Palesemente è stata cucinata, e io non ho il tempo di cucinare.
            Matteo: Lo sai che ho la mia azienda da portare avanti!
    + {inventoryContents has BottigliaDiVino} Ettore: Riconosci questa bottiglia di vino?
            Matteo: Dai qui. Uh, un negroamaro.
            Matteo: Profumo intenso, sontuoso direi, quasi balsamico.
            Matteo: Eppure è austero, persino salato.
            Matteo: E un aroma di prugne, di rabarbaro.
            Matteo: Come le caramelle che ci dava nonna da piccoli.
            Matteo: Come un momento di rara felicità.
            Matteo: Come quando eravamo al sicuro, prottetti, e non lo sapevamo.
            Matteo: Fa schifo, portalo via!
            -> advance_time ->
    + {inventoryContents has FlaconcinoAsma} Ettore: Sai chi ha problemi d'asma?
            Matteo: Chi non lavora.
            Ettore: Non è che prendi l'asma se non lavori.
            Matteo: Questo lo dici tu.
            Matteo: Se lavori, se lavori <b>davvero</b>, non hai tempo per ammalarti.
            Matteo: La malattia è una invenzione di ecologisti e comunisti, tutti scansafatiche!
            Ettore: Stai tremando, sai?
            Matteo: Ah sì, ho la dengue da un paio di giorni, niente di grave.
            -> advance_time ->
    + {inventoryContents has SigarettaElettronica} Ettore: Tu sai chi possa fumare questa roba?
            Matteo: <i>Tu sai chi possa fumare questa roba?</i>
            Matteo: Lasciami lavorare, Ettore.
            Ettore: Ma non stai facendo niente.
            Matteo: Lo sto facendo <b>dentro</b>.
            Matteo: Un imprenditore lavora sempre.
            Matteo: Anche mentre dorme.
            Matteo: Anche mentre scopa.
            Ettore: Uh, questo è poco lusinghiero.
            Matteo: Con le lusinghe non si manda avanti l'economia.
            Matteo: Ora via, che c'ho da pensare!      
            -> advance_time ->
      
    + Te ne vai
        -> intro
    -
->->

= esplora_matteo_personaggia
{debug: <i>Passo per esplora_matteo_personaggia</i>}

{
- MatteoActing > 1: Matteo: Cucciolo, fai due passi, che paparino ha da fare due chiamate di lavoro.
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
~ MatteoActing++
    + Ettore: Come posso tirarti su il morale, Matteo?
        Matteo: Un pompino in bagno?
        Ettore: Non credo sia il caso.
        Matteo: Ma sei così bello.
        {not hardTrueFeelingsStorylet.ah or hardTrueFeelingsStorylet.mono: Ettore: E Paola è così morta, no?}
        {hardTrueFeelingsStorylet.ah or hardTrueFeelingsStorylet.mono: Ettore: Ma non ami Greta?}
        Matteo: E quindi non dovremmo celebrare la vita?
        Matteo: Diffondere l'amore, saziarci nei nostri corpi fino a raggiungere le stelle.
        Ettore: Ti va una merendina?
        Matteo: Ecco, sì, una merendina sarebbe perfetta.
    -> advance_time ->
    
    -
-> matteo_acting 

= second_qn
 ~ MatteoActing++
    +  Ettore: Non mi parli mai molto della tua famiglia, come mai?
        Matteo: Ovvio: sono tutti invidiosi.
        Matteo: Zeca è un fallito e pensa solo a chiedermi prestiti.
        Matteo: Elia ha il cervello di un labrador nel corpo di un trent'enne disgraziato.
        Matteo: Paola giudica chiunque non rinunci a ogni piacere possibile.
        Matteo: Greta pensa che essere acide sia un tratto distintivo.
        Matteo: E i nonni sono i nonni. Insomma, son vecchi e quindi noiosi.
        Matteo: Ma almeno mi hanno dato una mano con l'azienda.
        Matteo: Ma solo una mano, giuro, il resto ho fatto da solo!
    -> advance_time ->
   
    -
-> matteo_acting     

= third_qn
~ MatteoActing++
    Matteo: Ti ricordi la sera in cui ci siamo conosciuti?
    Ettore: E come potrei dimenticarla? Pensavo sarebbe stato un semplice colloquio di lavoro, ed eccoci quì.
    Matteo: Sai qual è stata la prima cosa che ho pensato quando ti ho visto entrare?
    Matteo: <i>Bel culo. Questo tizio ha davvero un gran bel culo.</i>
    Ettore: Me lo dicesti pure. Mi imbarazzai un sacco.
    Matteo: Eh, son sempre stato una persona diretta, vero?
    Matteo: Anche se mi son dovuto dare una calmata, dopo quelle denuncie.
    Matteo: Certi ragazzi non sanno stare più allo scherzo.
    Ettore: E cosa pensi di me, ora?
    Matteo: Che ti porterei in bagno e te lo mangerei, quel gran bel culo.
    -> advance_time ->    
    -    
-> matteo_acting




/* ---------------------------------
Opzioni di dialogo con la persona Matteo
 ----------------------------------*/

=== matteo_talking
 {debug: <i>Passo per matteo_talking</i>}
    -> resting_time ->
    //INFO GENERALI//
    + Fai domande sulla persona Matteo -> esplora_matteo

    //SCELTE CONDIZIONALI//
    

    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    + {inventoryContents has Torta} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
    -> intro
    -
    
    -> matteo_talking

= esplora_matteo
{debug: <i>Passo per esplora_matteo</i>}
-> resting_time ->

{
- MatteoTalking > 1: Matteo: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SUllA PERSONA MATTEO

= first_qn
~ MatteoTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> matteo_talking 

= second_qn
 ~ MatteoTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> matteo_talking    

= third_qn
~ MatteoTalking++
    Matteo dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> matteo_talking