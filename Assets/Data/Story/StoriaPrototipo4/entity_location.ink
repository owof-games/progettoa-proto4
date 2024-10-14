=== function updateEntitiesLocations()
/* NOTA: per com'è strutturato ora, se passiamo per un nodo che modifica la posizione di un soggetto, quel soggetto poi rimarrà in quella stanza anche negli altri loop, per noi è ok?*/

{debug: [applico la timeline per {currentTime}]}


// Ettore
{ currentTime == 0:
    ~ move_entity(Ettore, WhiteRoom)
}

// Matteo
{currentTime:
    - 0:
        ~ move_entity(Matteo, WhiteRoom)

    - 120:
        ~ move_entity(Matteo, RedRoom)    

    - 180:
        ~ move_entity(Matteo, GreenRoom) 

    - 240:
         ~ move_entity(Matteo, YellowRoom)    

    - 300:
        ~ move_entity(Matteo, YellowRoom)    
        
    - 360:
        ~ move_entity(Matteo, YellowRoom)    
        
    - 420:
        ~ move_entity(Matteo, WhiteRoom)

    - 480:
        ~ move_entity(Matteo, GreenRoom)        
              
 
}


// Paola
{currentTime:
    - 0:
        ~ move_entity(Paola, WhiteRoom)
    
    - 120:
        ~ move_entity(Paola, WhiteRoom)  

    - 180:
        {
            - tierState has FirstTier:
            ~ move_entity(Paola, WhiteRoom)
            - tierState has SecondTier:
            ~ move_entity(Paola, RedRoom)
        }

    - 240:
        {
            - tierState has FirstTier:
            ~ move_entity(Paola, WhiteRoom)
            - tierState has SecondTier:
            ~ move_entity(Paola, GreenRoom)
        }

    - 300:
        ~ move_entity(Paola, WhiteRoom)   
        
    - 360:
        ~ move_entity(Paola, WhiteRoom)    
        
    - 420:
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

    - 480:
        ~ move_entity(Elia, RedRoom)            
              
 
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
        ~ move_entity(Zeca, WhiteRoom)

    - 120:
        ~ move_entity(Zeca, YellowRoom)    

    - 180:
        ~ move_entity(Zeca, GreenRoom) 

    - 240:
         ~ move_entity(Zeca, WhiteRoom)    

    - 300:
        ~ move_entity(Zeca, RedRoom)    
        
    - 360:
        ~ move_entity(Zeca, RedRoom)    
        
    - 420:
        ~ move_entity(Zeca, RedRoom)

    - 480:
        ~ move_entity(Zeca, YellowRoom)     
              
 
}



// Settaggio oggetti
{currentTime:

    - 0 && not objects_tutorial:
        ~ move_entity(LimettaUnghie, GreenRoom)
        ~ move_entity(SpiedinoCocktail, RedRoom)
        ~ move_entity(AnticoPugnale, GreenRoom)
        ~ move_entity(Lettera, YellowRoom)
        ~ move_entity(BottigliaDiVino, YellowRoom)
        ~ move_entity(SigarettaElettronica, RedRoom)
        ~ move_entity(FlaconcinoAsma, WhiteRoom)
        ~ move_entity(Torta, ObjectStorage)
        ~ move_entity(Briciole, ObjectStorage)
        
        
    - 0 && objects_tutorial:
        ~ move_entity(LimettaUnghie, GreenRoom)
        ~ move_entity(SpiedinoCocktail, ObjectStorage)
        ~ move_entity(AnticoPugnale, GreenRoom)
        {
        - gretaHaLaLettera == true:
            ~ move_entity(Lettera, ObjectStorage)
        - else:
            ~ move_entity(Lettera, YellowRoom)
        }
        
        ~ move_entity(BottigliaDiVino, YellowRoom)
        ~ move_entity(SigarettaElettronica, WhiteRoom)
        ~ move_entity(FlaconcinoAsma, RedRoom)
        ~ move_entity(Torta, YellowRoom)

        

        
        
}
