=== cb_first_tier_matteo ===
{debug: <i>passo per first_tier_matteo</i>}
+ {are_two_entitites_together(Matteo, Ettore) && acting} [character:Matteo] {debug: <i>Ho scelto di parlare con Matteo</i>}
    -> matteo_acting ->

+ {are_two_entitites_together(Matteo, Ettore) && !acting} [character:Matteo]
    -> matteo_talking ->    
-

-> intro



/* ---------------------------------
Opzioni di dialogo con il personaggio Matteo
 ----------------------------------*/


=== matteo_acting
    {debug: <i>Passo per matteo_acting</i>}
    -> first_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sul personaggio Matteo -> esplora_matteo_personaggia
    
    //SCELTE CONDIZIONALI//
    
    + (paolaSiSposa) {elia_acting.paolaSiSposa} Ettore: "Matteo, tu sapevi che Paola si stava per sposare?"
        + + {marryMeStorylet} Ettore
            Matteo: "Sì, ero incazzatissimo perché ci ha detto che ci sarebbe sposata il giorno dopo che le ho detto che volevo farti la proposta, la stronza."
    + {new_this_loop(->hardTrueFeelingsStorylet)} {elia_acting.uniti} Ettore: "Amore, in merito al nostro matrimonio..."
        ->hardTrueFeelingsStorylet->
    + (ZecaTestimone){worstBestManStorylet} Matteo ci dice che Zeca è stato chiamato a fare da testimone.
        "La cosa che mi ha stupito è che abbia chiesto a Zeca di farle da testimone!"
        Matteo: "Sappiamo tutti che Zeca odia la povera Paola da sempre!"
        
    //SCELTE CONDIZIONALI OGGETTI//
     + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
     + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
     + {inventoryContents has Lettera} Guarda questa lettera!
     + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
            Matteo: "Ma è di Greta!"
    
      
    + Te ne vai
        -> intro
    -
->->

= esplora_matteo_personaggia
{debug: <i>Passo per esplora_matteo_personaggia</i>}
VAR MatteoActing = 0

{
- MatteoActing > 1: Matteo: "Non mi va di rispondere ad altre domande personali".
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
    + Prima domanda
    -> advance_time ->
    
    -
-> matteo_acting 

= second_qn
 ~ MatteoActing++
    +  altra domanda
    -> advance_time ->
   
    -
-> matteo_acting     

= third_qn
~ MatteoActing++
    Matteo dice cose
        +  tu chiedi
    -> advance_time ->    
    -    
-> matteo_acting




/* ---------------------------------
Opzioni di dialogo con la persona Matteo
 ----------------------------------*/

=== matteo_talking
 {debug: <i>Passo per matteo_talking</i>}
    -> first_tier_storylets ->
    //INFO GENERALI//
    + Fai domande sulla persona Matteo -> esplora_matteo

    //SCELTE CONDIZIONALI//
    

    //SCELTE CONDIZIONALI OGGETTI//
     + {inventoryContents has AnticoPugnale} Guarda questo pugnale!
     + {inventoryContents has SpiedinoCocktail} Guarda questo spiedino!
     + {inventoryContents has Lettera} Guarda questa lettera!
     + {inventoryContents has LimettaUnghie} Guarda questa limetta da unghie!
    
      
    + Te ne vai
    -> intro
    -

= esplora_matteo
{debug: <i>Passo per esplora_matteo</i>}
VAR MatteoTalking = 0


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