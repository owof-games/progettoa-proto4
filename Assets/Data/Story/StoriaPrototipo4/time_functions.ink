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
    - 75:
        22:01:15
    - 90:
        22:01:30
    - 105:
        22:01:45
        
    - 120:
        22:02:00
    - 135:
        22:02:15
    - 150:
        22:02:30
    - 165:
        22:02:45
        
    - 180:
        22:03:00
    - 195:
        22:03:15
    - 210:
        22:03:30
    - 225:
        22:03:45
        
    - 240:
        22:04:00
    - 255:
        22:04:15
    - 270:
        22:04:30
    - 285:
        22:04:45
        
    - 300:
        22:05:00
    - 315:
        22:05:15
    - 330:
        22:05:30
    - 345:
        22:05:45
        
    - 360:
        22:06:00
    - 375:
        22:06:15
    - 390:
        22:06:30
    - 405:
        22:06:45
        
    - 420:
        22:07:00
    - 435:
        22:07:15
    - 450:
        22:07:30
    - 465:
        22:07:45
        
    - 480:
        22:08:00
    - 495:
        22:08:15
    - 510:
        22:08:30
    - 525:
        22:08:45
        
    - 540:
        22:09:00
    - 555:
        22:09:15
    - 570:
        22:09:30
    - 585:
        22:09:45
        
    - 600:
        22:10:00     
    - else:
        UNKNOWN TIME {currentTime}
}

/**
 * Make the time advance one step, or trigger a loop.
 * Used in move_between_rooms.
 */
 
 
 
=== advance_time
{debug: <i>Passo per function advance_time</i>}
~ currentTime = currentTime + 15
{debugTime: <b>Sono le {print_time()}, ovvero {currentTime} secondi</b>}
//UPDATE
~ updateEntitiesLocations()

TODO: se in conversazione "maiali" o analoga, non far ripartire il loop

{ currentTime >= 660:
    -> loop_reset
}

// PER PAUSE DOPO IL TUTORIAL
{ 
- paolaPausa != -1 && currentTime == paolaPausa + 120:
    -> loop_reset
}

//Da qui gli storylet possono ripartire
~ pauseStorylet = false

->->



/*FUNZIONE CHIAMATA QUANDO PAOLA CHIAMA LA PAUSA*/
=== resting_time
{debug: <i>Passo per function resting_time</i>}
~ peopleTalking = true
~ paolaPausa = currentTime
->->



VAR loopResetAtSecondTier = false
/**
 * Called whenever the loop resets. All state must be brought back
 * to its initial state here
 */
=== loop_reset
{debug: <i>Passo per function loop_reset</i>}
// set the current time
{
- not loopResetAtSecondTier && tierState == SecondTier:
    ~ currentTime = 0
    ~ loopResetAtSecondTier = true
- else:
    ~ currentTime = 120
}

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
    ~ change_status(Paola, PaolaUnalived)
- else: Questo è il testo che dice che è avvenuto un loop!
}


~ updateEntitiesLocations()

-> intro
