=== function updateEntitiesLocations()
/* NOTA: per com'è strutturato ora, se passiamo per un nodo che modifica la posizione di un soggetto, quel soggetto poi rimarrà in quella stanza anche negli altri loop, per noi è ok?*/

{debug: [applico la timeline per {currentTime}]}


// Matteo
{currentTime:
    - 0:
        ~ move_entity(Matteo, WhiteRoom)
    - 180:
        ~ move_entity(Matteo, RedRoom)
    - 240:
        ~ move_entity(Matteo, RedRoom)
    - 300:
        ~ move_entity(Matteo, RedRoom)    
}


// Paola
{currentTime:
    - 0:
        ~ move_entity(Paola, WhiteRoom)
        - 165:
            ~ move_entity(Paola, RedRoom)   //lascio spostati in avanti gli orari di "decoro", che ci servono per dare senso di movimento quando passa da una stanza a ad una b e ci sono una o due stanze lungo il percorso
    - 180:
        ~ move_entity(Paola, GreenRoom)
    - 240:
        ~ move_entity(Paola, RedRoom)
        - 285:
            ~ move_entity(Paola, GreenRoom)    
    - 300:
        ~ move_entity(Paola, YellowRoom)   
}

TODO: nota. Rispetto a prima, è più difficile prevedere dove possa trovarsi un personaggio, per cui in situazioni tipo "Elia raggiungi Greta!", non è detto che Greta sia sempre nello stesso luogo, e potrebbe anche andare bene: invece di scaricare questa cosa su delle condizioni, può essere la giocatrice a dover dire al personaggio "vai in questa stanza", tenendo conto degli spostamenti della personaggia da raggiungere. Può tornare come piano?
// Elia
{currentTime:
    - 0:
        ~ move_entity(Elia, WhiteRoom)
    - 180:
        {
        - loopableVariables == (EliaRaggiungeGreta):
            ~ move_entity(Elia, WhiteRoom)
        - else:
            ~ move_entity(Elia, RedRoom)    
        }
    - 240:
        {
        - loopableVariables == (EliaRaggiungeGreta):
            ~ move_entity(Elia, WhiteRoom)
        - else:
            ~ move_entity(Elia, RedRoom)    
        }
    - 300:
        {
        - loopableVariables == (EliaRaggiungeGreta):
            ~ move_entity(Elia, WhiteRoom)
        -else:
            ~ move_entity(Elia, RedRoom)    
        }
 
}

// Greta
{currentTime:
    - 0:
        ~ move_entity(Greta, WhiteRoom)
    - 180:
        ~ move_entity(Greta, WhiteRoom)
    - 240:
        ~ move_entity(Greta, WhiteRoom)
    - 300:
        ~ move_entity(Greta, WhiteRoom)    
}


// Zeca
{currentTime:
    - 0:
        ~ move_entity(Zeca, WhiteRoom)
        - 150:
            ~ move_entity(Zeca, RedRoom)
        - 165:
            ~ move_entity(Zeca, GreenRoom)    
    - 180:
        ~ move_entity(Zeca, YellowRoom)
    - 240:
        ~ move_entity(Zeca, GreenRoom)
    - 300:
        ~ move_entity(Zeca, GreenRoom)    
}

// Settaggio oggetti
{currentTime:
    - 0:
        ~ move_entity(LimettaUnghie, GreenRoom)
        ~ move_entity(AnticoPugnale, WhiteRoom)
        ~ move_entity(SpiedinoCocktail, YellowRoom)
        ~ move_entity(Lettera, RedRoom)    
}
