=== cb_second_tier_matteo ===
{debug: <i>passo per second_tier_matteo</i>}

+ {are_two_entitites_together(Matteo, Ettore)} [character:Matteo]
    -> matteo_talking_second_tier ->    
-

-> intro


/* ---------------------------------
Opzioni di dialogo con la persona Matteo
 ----------------------------------*/

=== matteo_talking_second_tier
 {debug: <i>Passo per matteo_talking_second_tier</i>}
    //INFO GENERALI//
    + Fai domande sulla persona Matteo -> esplora_matteo
    
    TODO: una volta fatto il check che tutto torni, mettere tutte le domande plausibili su tutti i personaggi (es: anche per Matteo domande sul rapporto Elia e Zeca).
    //SCELTE CONDIZIONALI//
    + (allestimento) {paola_talking_second_tier.allestimento} Diciamo quello che Greta ha detto su Matteo e il litigio.
        Matteo: "Quella strega! Devo subito trovare Zeca!"
         + + {whiteRoomContents hasnt Ettore} Ettore: "Credo sia nella stanza bianca."
                ~ move_entity(Elia, WhiteRoom)
        + + {greenRoomContents hasnt Ettore} Ettore: "Credo sia nella stanza verde."
                ~ move_entity(Elia, GreenRoom)
        + + {yellowRoomContents hasnt Ettore} Ettore: "Credo sia nella stanza gialla."                
                ~ move_entity(Elia, YellowRoom)
        + + {redRoomContents hasnt Ettore} Ettore: "Credo sia nella stanza rossa."                
                ~ move_entity(Elia, RedRoom)
        + + Ettore: "Non ho idea di dove sia, scusa."
   
    + {trueLoveStorylet} Matteo è felice per Zeca, e per Greta, ma crede che Elia sia un coglione.
    

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