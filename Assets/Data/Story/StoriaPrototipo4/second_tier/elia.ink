=== cb_second_tier_elia ===
{debug: <i>passo per cb_second_tier_elia</i>}
+ {are_two_entities_together(Elia, Ettore)} [character:Elia]
    -> elia_talking_second_tier -> 


+ {are_two_entities_together(Elia, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Elia]
    -> paola_is_dead_elia ->

-

-> intro


/* ---------------------------------
Opzioni di dialogo con la persona Elia
 ----------------------------------*/

=== elia_talking_second_tier
 {debug: <i>Passo per elia_talking_second_tier</i>}
    //INFO GENERALI//
    + (loop) {new_this_loop(->loop)} Ettore: Elia, non stai notando nulla di strano?
        Elia: In effetti, sì.
        Ettore: Oh, allora non sto perdendo la testa!
        Elia: No no, lo sto notando anche io.
        Elia: Fino a stamani, sollevavo tranquillo quel tavolo.
        Elia: Ora ci metto circa due secondi in più.
        Elia: Possibile che stia perdendo la mia forza?
        Elia: O è colpa dei colori? Queste stanze, è colpa di queste stanze!
                -> advance_time ->
            -> elia_talking_second_tier

    + (rapportoPaola) {new_this_loop(->rapportoPaola)} Ettore: Che rapporto hai con Paola?
        Elia: Un po' complicato, per colpa delle piramidi.
        Ettore: Aiuto.
        Elia: Eh sì, mi serve aiuto.
        Elia: Praticamente sono entrato in questa piramide di fotografi.
        Elia: E la cosa è che dovevo comprare delle macchine fotografiche.
        Elia: E poi rivenderle a altre piramidi per fare una piramide più grande.
        Elia: E a quel punto avrei guadagnato un sacco.
        Elia: Un sacco di soldi, non di piramidi.
            -> advance_time ->
        Elia: Ma devo aver fatto confusione a manetta perché ho iniziato a comprare macchine, autonomobili.
        Elia: E a venderle alle fotografie.
        Elia: Che però hanno le idee poco chiare su cosa sia il denaro.
        Elia: E quindi mi sentivo in colpa a insistere e gliele ho regalate, le macchine.
        Elia: E per recuperare un po' di dignità ho iniziato a fare una piramide di fotografie.
        Elia: Ma quelli dell'altra piramide erano arrabbiati.
        Elia: E poi è arrivata la polizia a dirmi che ho fatto reato di occupazione di suolo pubblico.
        Elia: Ma io ho occupato solo una statua, per cui non tocca il suolo.
            -> advance_time ->
        Elia: Ma mentre che discutevamo di questa cosa è arrivato questo gruppo di lontre giganti.
        Elia: Ero un po' perplesso ma sono state molto carine.
        Elia: E hanno iniziato a montare luci, telecamere, e a fare, a fare cose.
        Elia: Non ho ben capito, ma si stavano divertendo e gli ho lasciati lontrellare.
        Elia: E altre persone hanno iniziato a portare altre foto, foto con un sacco di animali giganti.
        Elia: E allora ho chiamato i tipi delle piramidi per dire che stavo facendo finalmente bene il mio lavoro.
        Elia: Ma loro ripetevano che mancava uno schema, uno schema e che non mi avrebbero mai pagato.
        Elia: E poi mi son ricordato che Paola è brava coi cruciverba a schema libero.
            -> advance_time ->
        Elia: E ho dato ai tizi delle piramidi il suo numero, ma lei non era contenta.
        Elia: E ora quelli delle piramidi mi dicono che mi lasceranno in mutande.
        Elia: Paola mi dice che mi mi lascerà in mutande.
        Elia: Le lontre giganti mi dicono che mi lasceranno in mutande.
        Elia: Tranne quella con la frusta. Quella dice che me le toglierà.
        Elia: E io non so cosa fare.
        Elia: Zeca dice che può mettermi in contatto con la mafia gay.
        Elia: Forse sanno dove parcheggiare le sei Maserati che ho preso per le fotografie.
        Elia: Sono molto confuso, Ettore, molto confuso.
            -> advance_time ->
            -> elia_talking_second_tier



    + (omicidio) {new_this_loop(->omicidio)} Ettore: Conosci qualcuno che vorrebbe far male a Paola?
        Elia: Uh, spero non i tizi delle piramidi, vero?
        Elia: O le lontre giganti.
        Elia: Naa, loro sono molto tenere.
        Elia: Paola vorrebbe fare del male a me, ogni tanto.
        Elia: Ma quello succede spesso.
        Elia: Tu però sei gentile con me.
        Elia: Mi fai due grattini?
                -> advance_time ->
            -> elia_talking_second_tier

    + [Conosci meglio Elia]-> esplora_elia

    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Elia: so che vuoi uccidere Paola! -> arringa_finale_Elia

    //SCELTE CONDIZIONALI//
    + {greta_talking_second_tier.indagini && not are_two_entities_together(Elia, Zeca)} Qui è dove Elia mette la musica al massimo per non risponderci.

    + (allestimento) {notABigSecretPartOneStorylet.allestimento} Ci dice che lui e Greta hanno lasciato le bottiglie all'ingresso, avvisando Zeca, perché dovevano risolvere un problema coi tavoli
    
    + (allestimento2){zeca_talking_second_tier.allestimento2} Dice una cosa che contraddice Greta
        Elia: Zeca sente sesso ovunque, giuro! Ma purtroppo ho passato la mattina con Greta a chiamare i fornitori del pub.
        + + Ettore: Del pub inesistente? Quello della recita?
            Elia: Beh, sì. Mi piace restare nella parte!
        - -

    + (indagini) {iTryToBeAGoodFriendStorylet} Se lo diciamo ad Elia, ci rimane male.
        Dice che si aspettava qualcosa di diverso da Matteo, e che lui sa una cosa ed è stato zitto per difenderlo.
        Elia ci dice che Greta ha dato a Matteo info per "contrattare" meglio con Paola per la sindacalizzazione e questo avrebbe fatto pissare Paola.
   
    + (minacce) {zeca_talking_second_tier.love && phone.indagini && elia_talking_second_tier.minacce} Se chiediamo ad Elia se Zeca potrebbe aver denunciato Paola
        Elia sbotta, dice che non ha senso, che il suo "socio d'affari" che motivo avrebbe di rovinarlo? e si allontana subito, possiamo "pedinarlo"
                ~ move_first_entity_to_second_entity_location(Elia,Zeca)
                ~ loopableVariables += EliaSpaventatoPerZeca
    
    //SCELTE CONDIZIONALI OGGETTI//
    + {inventoryContents has Lettera} Guarda questa lettera!
    + {inventoryContents has Torta} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai -> intro
    -
    
    -> elia_talking_second_tier

= esplora_elia
{debug: <i>Passo per esplora_elia</i>}


{
- EliaTalking > 1: Elia: "Non mi va di rispondere ad altre domande personali".
    -> advance_time ->
    -> intro
- else:
    { shuffle:
    -   -> first_qn
    -   -> second_qn
    -   -> third_qn
    
    }
}

//DOMANDE SULLA PERSONA ELIA

= first_qn
~ EliaTalking++
    + Prima domanda
    -> advance_time ->
    
    -
-> elia_talking_second_tier 

= second_qn
 ~ EliaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> elia_talking_second_tier    

= third_qn
~ EliaTalking++
    Elia dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> elia_talking_second_tier



=== rapporto_Elia_Paola
    { shuffle:
    -   -> first_paola
    -   -> second_paola
    -   -> third_paola
    
    }

= first_paola
 Elia: Eravamo fratello e sorella.
        Ettore: Questo lo so, ma ci andavi d'accordo? Passavi del tempo con lei?
        Elia: Solo quando eravamo assieme.
        Ettore: Solo quando eri con lei ci andavi d'accordo?
        Elia: No, passo del tempo con lei solo quando sono con lei.
        Elia: Non posso passarlo con lei se non sono con lei, no?
            -> advance_time ->
            + + Ettore: E ti manca?
                Elia: Il tempo?
                Ettore: No, Paola.
                Elia: No, lei è qui con noi.
                Ettore: Non sapevo fossi religioso.
                Elia: Religioso?
                Elia: No no, il collarino è alla coreana, non è da prete.
                Elia: Però una volta ho preso un prete in testa con un pallone.
                Elia: E ora credo morirò all'inferno.
                Elia: Ed è un bene perché sono freddoloso.
                    -> advance_time ->
                     -> elia_talking_second_tier
            + + [Cambi argomento] -> elia_talking_second_tier

= second_paola
    Elia: Eravamo fratello e sorella.
        Ettore: Questo lo so, ma ci andavi d'accordo? Passavi del tempo con lei?
        Elia: Spesso.
        Ettore: <i>Spesso</i> d'accordo o <i>spesso</i> assieme?
        Elia: Non bastavano i centimetri?
        Ettore: Per cosa?
        Elia: Per lo spessore.
        Elia: Ma sono un tipo musicale, per cui direi "spesso d'accordo".
        Elia: Tengo "spesso assieme" per Zeca.
            -> advance_time ->
        Elia: Quante fette di bresaola ci tiro fuori con un chilo di spesso assieme?
            + + Ettore: Ti manca Paola?
                Elia: No, non so quanto mi manca di bresaola.
                Elia: Perché se le fette <i>spesso assieme</i>sono più sottili di quelle <i>spesso d'accordo</i> allora mi hai fregato, perché sono due chili che pesano diversamente.
                Elia: Mi fa vedere il pacchetto?
                Ettore: Di bresaola?
                Elia: No ho cambiato idea, mi faccia due etti di festa di tacchino, è più leggera.
                Elia: Ma ha visto Paola?
                Elia: Che vorrei farle una festa ma non col tacchino, con la bresaola.
                Elia: Lei preferisce i sapori forti.
                Elia: Ma devo capire ancora cosa ne pensa il tacchino, della bresaola.
                Elia: Ma mi aveva chiesto qualcosa, vero? A volte mi perdo.
                    -> advance_time ->
                     -> elia_talking_second_tier
            + + [Cambi argomento] -> elia_talking_second_tier


    = third_paola   

    -> advance_time ->
        -> elia_talking_second_tier

/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/

=== paola_is_dead_elia
    
    Elia: {~ Secondo te è già in Paradiso? O con tutti questi morti in guerra sta trovando traffico?|Non credo molto nella morte, sai? Deve esserci la possibilità di fare restart, per forza.|Spero che Zeca non si stia preoccupando troppo per me.|Ricordo che Paola pianse un sacco alla morte di Fufi. Ora starà piangendo per la sua, di morte?}

-> advance_time ->
->->

/* ---------------------------------

   Arringa finale. 

 ----------------------------------*/
=== arringa_finale_Elia
Con cosa
    + {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Usando il vino.
    + {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Il boccettino dell'asma.
    + {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} La sigaretta elettronica.
    + {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} La torta.
    -
    
Con l'aiuto di chi
    + Paola
    + Greta
    + Matteo
    + Zeca
    + Hai fatto da solo
    -
    
Perché
    + xxx
    -
    
Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset