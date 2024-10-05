=== cb_second_tier_zeca ===
{debug: <i>passo per second_tier_zeca</i>}

+ {are_two_entitites_together(Zeca, Ettore)} [character:Zeca]
    -> zeca_talking_second_tier ->    
-

-> intro




/* ---------------------------------
Opzioni di dialogo con la persona Zeca
 ----------------------------------*/

=== zeca_talking_second_tier
 {debug: <i>Passo per zeca_talking_second_tier</i>}
    //INFO GENERALI//
    + Fai domande sulla persona Zeca -> esplora_zeca

    //SCELTE CONDIZIONALI//
    + (allestimento) {notABigSecretPartTwoStorylet.allestimento} Ci dice che lui e Matteo hanno lasciato il cibo sui tavoli e poi chiesto a Greta di occuparsene, che loro dovevano sistemare i costumi.
    + (allestimento2) {elia_talking_second_tier.allestimento} Zeca ci dice che qualcuno si è chiuso nella stanza a scopare a una certa, mentre lui e Matteo montavano le luci
        Senza convinzione, dice "forse Paola e il suo vibratore"
    + (money) {paola_talking_second_tier.money} Se lo diciamo a Zeca, ci dice che Paola piuttosto dovrebbe farsi delle domande su Matteo, che è lui a campare sulle spalle dei due fratelli.
    + (love) Zeca ci dice che farebbe di tutto per proteggere Elia.
        

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
    

= esplora_zeca
{debug: <i>Passo per esplora_zeca</i>}


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
    + Prima domanda
    -> advance_time ->
    
    -
-> zeca_talking_second_tier 

= second_qn
 ~ ZecaTalking++
    +  altra domanda
    -> advance_time ->
   
    -
-> zeca_talking_second_tier    

= third_qn
~ ZecaTalking++
    Zeca dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> zeca_talking_second_tier
