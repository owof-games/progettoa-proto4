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
        ~ return "22:00:00"
    - 15:
        ~ return "22:00:15"
    - 30:
        ~ return "22:00:30"
    - 45:
        ~ return "22:00:45"

    - 60:
        ~ return "22:01:00"
    - 75:
        ~ return "22:01:15"
    - 90:
        ~ return "22:01:30"
    - 105:
        ~ return "22:01:45"

    - 120:
        ~ return "22:02:00"
    - 135:
        ~ return "22:02:15"
    - 150:
        ~ return "22:02:30"
    - 165:
        ~ return "22:02:45"

    - 180:
        ~ return "22:03:00"
    - 195:
        ~ return "22:03:15"
    - 210:
        ~ return "22:03:30"
    - 225:
        ~ return "22:03:45"

    - 240:
        ~ return "22:04:00"
    - 255:
        ~ return "22:04:15"
    - 270:
        ~ return "22:04:30"
    - 285:
        ~ return "22:04:45"

    - 300:
        ~ return "22:05:00"
    - 315:
        ~ return "22:05:15"
    - 330:
        ~ return "22:05:30"
    - 345:
        ~ return "22:05:45"

    - 360:
        ~ return "22:06:00"
    - 375:
        ~ return "22:06:15"
    - 390:
        ~ return "22:06:30"
    - 405:
        ~ return "22:06:45"

    - 420:
        ~ return "22:07:00"
    - 435:
        ~ return "22:07:15"
    - 450:
        ~ return "22:07:30"
    - 465:
        ~ return "22:07:45"

    - 480:
        ~ return "22:08:00"
    - 495:
        ~ return "22:08:15"
    - 510:
        ~ return "22:08:30"
    - 525:
        ~ return "22:08:45"

    - 540:
        ~ return "22:09:00"
    - 555:
        ~ return "22:09:15"
    - 570:
        ~ return "22:09:30"
    - 585:
        ~ return "22:09:45"

    - 600:
        ~ return "22:10:00"
    - else:
        ~ return "UNKNOWN TIME {currentTime}"
}

/**
 * Make the time advance one step, or trigger a loop.
 * Used in move_between_rooms.
 */
 
 
 
=== advance_time
{debug: <i>Passo per function advance_time</i>}
TODO: per evitare che il tempo superi i 600 secondi e possa non partire la morte di paola in tempo ho fatto questo magheggio, ha senso?
{
    - currentTime < 600:
    ~ currentTime = currentTime + 15
}

{debugTime: <b>Sono le {print_time()}, ovvero {currentTime} secondi</b>}
//UPDATE
~ updateEntitiesLocations()

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
