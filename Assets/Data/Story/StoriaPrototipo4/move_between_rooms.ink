=== move_between_rooms(my_location)
TODO: mappare correttamente

+ {my_location == RedRoom or my_location == GreenRoom || my_location == YellowRoom} [Vai nella stanza bianca]
    ~ move_entity(Ettore, WhiteRoom)
    ~ advance_time()
+ {my_location == WhiteRoom} [Vai nella stanza verde]
    ~ move_entity(Ettore, GreenRoom)
    ~ advance_time()
+ {my_location == WhiteRoom} [Vai nella stanza rossa]
    ~ move_entity(Ettore, RedRoom)
    ~ advance_time()
+ {my_location == WhiteRoom} [Vai nella stanza gialla]
    ~ move_entity(Ettore, YellowRoom)
    ~ advance_time()
-

{ current_time == Time_22_35:
    // loop restarted!
    -> intro
- else:
    -> character_based
}
