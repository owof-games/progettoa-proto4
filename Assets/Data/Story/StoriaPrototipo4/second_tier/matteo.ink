=== cb_second_tier_matteo ===
{debug: <i>passo per second_tier_matteo</i>}

+ {are_two_entities_together(Matteo, Ettore)} [character:Matteo]
    -> matteo_talking_second_tier ->    

+ {are_two_entities_together(Matteo, Ettore) && loopableVariables has PaolaDavveroMorta} [character:Matteo]
    -> paola_is_dead_matteo ->
-    

-

-> intro


/* ---------------------------------
Opzioni di dialogo con la persona Matteo
 ----------------------------------*/

=== matteo_talking_second_tier
 {debug: <i>Passo per matteo_talking_second_tier</i>}
    //INFO GENERALI//

    + (loop) {new_this_loop(->loop)} Ettore: Non stai notando nulla di strano?
            Matteo: Mmm, con Elia in giro è difficile dirlo. Prova ad essere più specifico.
                + + Ettore: Ho come questo senso di deja-vu...
                        Ettore: Abbiamo già vissuto tutto questo, anche se in modo diverso.
                        Ettore: E tende a finire male. So che tende a finire male.
                        Matteo: Quindi sai dirmi cosa sto per dirti?
                            -> advance_time ->
                            + + + Ettore: Ehm, no.
                                Matteo: Anche a me capita spesso, quando devo ripetere queste dannate scene.
                                Matteo: Una volta non riuscivo più a ricordare se ero Matteo, o il personaggio Matteo, e ci ho provato con Elia.
                                Matteo: Ma se vedi che butta male, chiedi una pausa più lunga a Paola.
                                Matteo: O fai finta di svenire, che forse è efficace.
                                Matteo: O dille che ha i capelli fuori posto, e ci guadagnamo mezz'ora sicura!
                                        -> advance_time ->
                                    -> matteo_talking_second_tier
                            + + + (loop2){matteo_talking_second_tier.loop && new_this_loop(->loop2)} Ettore: Sì!
                                Ettore: Che una volta ci hai provato con Elia perché non sapevi più se eri Matteo, o il personaggio.
                                Matteo: Uh, interessante.
                                Matteo: Prova a parlarne con Greta. Lei sa un sacco di cose strane.
                                Matteo: Ma se siamo davvero in un loop, allora vorrei un tuo bacio prima o poi.
                                Matteo: Almeno una cosa bella continuerà a ripetersi.
                                    -> advance_time ->
                                    -> matteo_talking_second_tier
                            + + + (loop3) {matteo_talking_second_tier.loop2 && new_this_loop(->loop3)} [Baci Matteo]
                                Ettore: Scusa, ma mi hai detto in un altro loop di farlo.
                                Ettore: Hai detto che almeno sarebbe capitato di nuovo qualcosa di bello.
                                Matteo: Ok, questa è una cosa che potrei aver davvero detto. Perché mi piaci da che ti ho visto.
                                Matteo: E tu stai cercando di fermare tutto questo?
                                Ettore: Sì, perché qualcuno sta per morire.
                                Matteo: Quando avrai risolto il crimine, allora, ridammi un altro bacio, e portami via da qui. 
                                    -> advance_time ->
                                    -> matteo_talking_second_tier

                            - - -    
                + + Ettore: Lascia perdere, è solo una inutile preoccupazione. -> matteo_talking_second_tier
                - -
                -> advance_time ->
            + + [Cambi argomento] -> matteo_talking_second_tier

    + (rapporto) {new_this_loop(->rapporto)} Ettore: Che rapporto hai con Paola?
        Matteo: cose
            -> advance_time ->
            + + [Cambi argomento] -> matteo_talking_second_tier

    + (omicidio) {new_this_loop(->omicidio)} Ettore: Secondo te qualcuno potrebbe volere del male a Paola?
        Matteo: 
        -> advance_time ->

    + Fai domande sulla persona Matteo -> esplora_matteo
    
    // OPZIONE PER IL FINALE
    + {(choice_WhoWasInChargeOfTheBuffet== True or choice_WhoWasInChargeOfTheBuffet == False) && (choice_ForWhomTheLetterWas == True or choice_ForWhomTheLetterWas == False)} [È il momento di fermare l’omicida di Paola!] Ettore: Matteo: so che vuoi uccidere Paola! -> arringa_finale_Matteo

    //SCELTE CONDIZIONALI//
    + (allestimento) {paola_talking_second_tier.allestimento} Diciamo quello che Paola ha detto su Matteo e il litigio.
        Matteo: Quella strega! Devo subito trovare Zeca!
         + + {whiteRoomContents hasnt Ettore} Ettore: Credo sia nella stanza bianca.
                ~ move_entity(Elia, WhiteRoom)
        + + {greenRoomContents hasnt Ettore} Ettore: Credo sia nella stanza verde.
                ~ move_entity(Elia, GreenRoom)
        + + {yellowRoomContents hasnt Ettore} Ettore: Credo sia nella stanza gialla.                
                ~ move_entity(Elia, YellowRoom)
        + + {redRoomContents hasnt Ettore} Ettore: Credo sia nella stanza rossa.               
                ~ move_entity(Elia, RedRoom)
        + + Ettore: "Non ho idea di dove sia, scusa."
   
    + (coglione) {trueLoveStorylet} Matteo è felice per Zeca, e per Greta, ma crede che Elia sia un coglione.
    
    + (lavoro) {zeca_talking_second_tier.money}: Se lo diciamo a Zeca, ci dice che Paola piuttosto dovrebbe farsi delle domande su Matteo, che è lui a campare sulle spalle dei due fratelli.
        Matteo: I dubbi di Zeca sono sensati.
        Matteo: Ma proprio per questo, perché dovrei distruggere le uniche cose che mi tengono vagamente a galla economicamente?
        Matteo: Sono due lavori che odio? Sì. Ma a chi può seriamente piacere il proprio lavoro in questo sistema?

    + {matteo_talking_second_tier.lavoro} Ettore: Sai che ancora non ho capito cosa fai, Matteo?
        -> evilJobStorylet
    
    //SCELTE CONDIZIONALI OGGETTI//
    + (lettera) {inventoryContents has Lettera} Guarda questa lettera!
        Matteo: Mettila via, subito! Se Paola la trova ti mangia vivo!
    + {inventoryContents has Torta} Guarda questo cibo!
    + {inventoryContents has BottigliaDiVino} Guarda questa bottiglia di vino!
    + {inventoryContents has FlaconcinoAsma} Guarda questo flaconcino per l'asma!
    + {inventoryContents has SigarettaElettronica} Guarda questa sigaretta elettronica!
    
      
    + Te ne vai
    -> intro
    -
    
    -> matteo_talking_second_tier

= esplora_matteo
{debug: <i>Passo per esplora_matteo</i>}


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
-> matteo_talking_second_tier 

= second_qn
 ~ MatteoTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> matteo_talking_second_tier    

= third_qn
~ MatteoTalking++
    Matteo dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> matteo_talking_second_tier

TODO: remind. Il focus investigativo "facile" è sulla lettera, non su una morte che per gli altri non è avvenuta.

/* ---------------------------------

   Dialoghi per quando Paola è morta 

 ----------------------------------*/

=== paola_is_dead_matteo
    
    Matteo: {~ Ho sperato così tante volte che accadesse, e ora che è morta, mi sento solo vuoto.|Dovremmo per lo meno coprire il corpo, povera.|Dovrei aver paura di venire ammazzato anche io, ma sono così <i>invisibile</i>, che rischi corro?|Forse finalmente i genitori di Greta riposeranno in pace.}

    -> advance_time ->
->->


/* ---------------------------------

   Arringa finale. 

 ----------------------------------*/
=== arringa_finale_Matteo
Con cosa
    + {cb_second_tier_bottiglia_di_vino.primoCheck or paola_is_dead.vino} Usando il vino.
    + {cb_second_tier_flaconcino_asma.primoCheck or paola_is_dead.asma} Il boccettino dell'asma.
    + {cb_second_tier_sigaretta_elettronica.primoCheck or paola_is_dead.sigaretta} La sigaretta elettronica.
    + {cb_second_tier_cibo.primoCheck or paola_is_dead.briciole} La torta.
    -
    
Con l'aiuto di chi
    + Elia
    + Greta
    + Paola
    + Zeca
    + Hai fatto da solo
    -
    
Perché
    + xxx
    -
    
Sono sicuro di tutto questo?
    + Sì -> finalStorylet
    + No -> loop_reset