=== function updateEntitiesLocations()
/* NOTA: per com'è strutturato ora, se passiamo per un nodo che modifica la posizione di un soggetto, quel soggetto poi rimarrà in quella stanza anche negli altri loop, per noi è ok?*/

{debug: [applico la timeline per {currentTime}]}

TODO: inserire microspostamenti personagge in cambio stanza

// Ettore
{ currentTime == 0:
    ~ move_entity(Ettore, WhiteRoom)
}

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

}

// Elia
{currentTime:
    - 0:
        ~ move_entity(Elia, WhiteRoom)

    - 120:
        ~ move_entity(Elia, YellowRoom)    

    - 180:
        ~ move_entity(Elia, YellowRoom) 

    - 240:
         ~ move_entity(Elia, YellowRoom)    

    - 300:
        ~ move_entity(Elia, GreenRoom)    
        
    - 360:
        ~ move_entity(Elia, GreenRoom)    
        
    - 420:
        ~ move_entity(Elia, YellowRoom)    
              
 
}

// Greta
{currentTime:
    - 0:
        ~ move_entity(Greta, WhiteRoom)

    - 120:
        ~ move_entity(Greta, WhiteRoom)

    - 180:
        ~ move_entity(Greta, WhiteRoom)

    - 240:
        ~ move_entity(Greta, WhiteRoom)

    - 300:
        ~ move_entity(Greta, WhiteRoom)

    - 360:
        ~ move_entity(Greta, WhiteRoom)

    - 420:
        ~ move_entity(Greta, WhiteRoom)             
}


// Zeca
{currentTime:
    - 0:
        ~ move_entity(Zeca, YellowRoom)

    -120: 
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
        ~ move_entity(SpiedinoCocktail, RedRoom)
        ~ move_entity(AnticoPugnale, GreenRoom)
        {
        - gretaHaLaLettera == true:
            ~ move_entity(Lettera, ObjectStorage)
        - else:
            ~ move_entity(Lettera, YellowRoom)
        }
        
        ~ move_entity(BottigliaDiVino, YellowRoom)
        ~ move_entity(SigarettaElettronica, RedRoom)
        ~ move_entity(FlaconcinoAsma, WhiteRoom)
        {
         - tierState == FirstTier: ~ move_entity(Torta, YellowRoom)
         - else: ~ move_entity(Torta, ObjectStorage)
        }
        
        {
         - tierState == SecondTier: ~ move_first_entity_to_second_entity_location(Briciole, Paola)
         - else: ~ move_entity(Briciole, ObjectStorage)
        }
        
        
}
