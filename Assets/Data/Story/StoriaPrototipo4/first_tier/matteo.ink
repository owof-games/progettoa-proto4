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
    
    + (paolaSiSposa) {elia_acting.paolaSiSposa} Ettore: "Matteo, tu sapevi che Paola si stava per sposare?"
        + + {marryMeStorylet} Ettore
            Matteo: "Sì, ero incazzatissimo perché ci ha detto che ci sarebbe sposata il giorno dopo che le ho detto che volevo farti la proposta, la stronza."
    + {new_this_loop(->hardTrueFeelingsStorylet)} {elia_acting.uniti && not are_four_entities_together(Greta, Elia, Matteo, Zeca)} Ettore: "Amore, in merito al nostro matrimonio..."
        ->hardTrueFeelingsStorylet->
    + (zecaTestimone){worstBestManStorylet && not are_two_entities_together(Zeca, Matteo)} Matteo ci dice che Zeca è stato chiamato a fare da testimone.
        "La cosa che mi ha stupito è che abbia chiesto a Zeca di farle da testimone!"
        Matteo: "Sappiamo tutti che Zeca odia la povera Paola da sempre!"
        
    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
            Matteo: "Ma è di Greta!"
    + {inventoryContents has Briciole} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!        
    
      
    + Te ne vai
        -> intro
    -
->->

= esplora_matteo_personaggia
{debug: <i>Passo per esplora_matteo_personaggia</i>}

{
- MatteoActing > 1: Matteo: Amore, fai due passi, che paparino ha da fare due chiamate di lavoro.
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
    + Ettore: Come posso tirarti su il morale, amore?
        Matteo: Un pompino in bagno?
        Ettore: Non credo sia il caso, amore.
        Matteo: Ma sei così bello.
        Ettore: E Paola è così morta, no?
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
    Matteo: "Bel culo. Questo tizio ha davvero un gran bel culo."
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
    + {inventoryContents has Briciole} Guarda questo cibo!
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