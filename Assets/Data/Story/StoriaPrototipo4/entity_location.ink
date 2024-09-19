=== function updateEntitiesLocations()
/* NOTA: per com'è strutturato ora, se passiamo per un nodo che modifica la posizione di un soggetto, quel soggetto poi rimarrà in quella stanza anche negli altri loop, per noi è ok?*/

{debug: [applico la timeline per {current_time}]}
{ current_time:

- Time_22_35:
    ~ move_entity(Matteo, WhiteRoom)
    ~ move_entity(Matteo, WhiteRoom)
    ~ move_entity(Paola, WhiteRoom)
    /*  {Zeca_ha_risposta and elia_in_cucina:
        ~ move_entity(Elia, YellowRoom) } */
    ~ move_entity(Zeca, WhiteRoom)
    ~ move_entity(Greta, WhiteRoom)
    ~ move_entity(Ettore, WhiteRoom)
    
    ~ move_entity(LimettaUnghie, GreenRoom)
    ~ move_entity(AnticoPugnale, WhiteRoom)
    ~ move_entity(SpiedinoCocktail, YellowRoom)
    ~ move_entity(Lettera, RedRoom)



- Time_23_13:
    ~ move_entity(Matteo, GreenRoom)
    ~ move_entity(Greta, RedRoom)
    ~ move_entity(Paola, GreenRoom)
    ~ move_entity(Zeca, YellowRoom)


- Time_00_12:
    ~ move_entity(Matteo, RedRoom)
    ~ move_entity(Greta, GreenRoom)
    ~ move_entity(Paola, RedRoom)
    ~ move_entity(Zeca, YellowRoom)

    

- Time_01_49:
    ~ move_entity(Matteo, RedRoom)
    ~ move_entity(Greta, WhiteRoom)
    ~ move_entity(Paola, GreenRoom)
    ~ move_entity(Zeca, YellowRoom)

}