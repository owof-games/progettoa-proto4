VAR currentTime = 0
/**
 * Print the current time.
 * E.g.:
 * Sono le {print_time()}
 * =======> Sono le 23:13
 */
=== function print_time()
{ currentTime:
    - 0:
        22:00:00
    - 15:
        22:00:15
    - 30:
        22:00:30
    - 45:
        22:00:45
    - 60:
        22:01:00
    - 120:
        22:02:00
    - 180:
        22:03:00
    - 240:
        22:04:00
    - 300:
        22:05:00
    - 360:
        22:06:00
    - 420:
        22:07:00
    - 480:
        22:08:00
    - 540:
        22:09:00
    - 600:
        22:10:00     
    - else:
        UNKNOWN TIME /INTERMEDIATE TIME {currentTime}
}

/**
 * Make the time advance one step, or trigger a loop.
 * Used in move_between_rooms.
 */
 
 
 
=== advance_time
{debug: <i>Passo per function advance_time</i>}
~ currentTime = currentTime + 15

//UPDATE
~ updateEntitiesLocations()

{ currentTime >= 600:
    -> loop_reset
}

// PER PAUSE DOPO IL TUTORIAL
{ 
- paolaPausa != -1 && currentTime == paolaPausa + 120:
    -> loop_reset
}

// PER STORYLET CON AVANZAMENTO A TEMPO
{
- are_three_entities_together(Matteo, Elia, Ettore) && not are_two_entities_together(Elia, Greta) && not are_two_entities_together(Elia, Zeca) && peopleTalking == false && new_this_loop(->sheIsTheBestStorylet) && sheIsTheBest == -1:
        ~ sheIsTheBest = currentTime
}




->->



/*FUNZIONE CHIAMATA QUANDO PAOLA CHIAMA LA PAUSA*/
=== resting_time
{debug: <i>Passo per function resting_time</i>}
~ peopleTalking = true
~ paolaPausa = currentTime
->->



/**
 * Called whenever the loop resets. All state must be brought back
 * to its initial state here
 */
=== loop_reset
{debug: <i>Passo per function loop_reset</i>}
// set the current time
~ currentTime = 0
// clear story variables

~ loopableVariables = ()

// clear talking tracking variables
~ EliaActing = 0
~ PaolaActing = 0
~ GretaActing = 0
~ ZecaActing = 0
~ MatteoActing = 0

~ PaolaTalking = 0
~ EliaTalking = 0
~ GretaTalking = 0
~ ZecaTalking = 0
~ MatteoTalking = 0

~ peopleTalking = false


//clear storylets variables
~ paolaPausa = -1
~ sheIsTheBest = -1


// print something for the user
{
- tierState == FirstTier: Paola: La festa è finita, resettiamo tutto, ripartiamo da dopo il mio omicidio!
- else: Questo è il testo che dice che è avvenuto un loop!
}


~ updateEntitiesLocations()

-> intro
