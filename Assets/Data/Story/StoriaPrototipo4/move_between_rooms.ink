=== move_between_rooms(my_location)

+ {my_location == RedRoom} [Vai nella stanza bianca]
    ~ move_entity(Ettore, WhiteRoom)
    ~ advance_time()
+ {my_location == RedRoom || my_location == YellowRoom} [Vai nella stanza verde]
    ~ move_entity(Ettore, GreenRoom)
    ~ advance_time()
+ {my_location == WhiteRoom || my_location == GreenRoom} [Vai nella stanza rossa]
    ~ move_entity(Ettore, RedRoom)
    ~ advance_time()
+ {my_location == GreenRoom} [Vai nella stanza gialla]
    ~ move_entity(Ettore, YellowRoom)
    ~ advance_time()
-

{
    - current_time == Time_22_35:
    @next-loop
    // loop restarted!
    -> intro
    - TierState == first_tier: -> cb_first_tier
    - TierState == second_tier: -> cb_second_tier
}
