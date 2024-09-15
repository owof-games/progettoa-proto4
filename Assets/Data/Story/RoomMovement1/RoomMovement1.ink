INCLUDE characters.ink
INCLUDE rooms.ink
INCLUDE exceptions.ink
INCLUDE interact.ink

@moveTo roomName:{Room1}


-> loop

=== loop ===


@interact
+ [{interaction_exit(Room1)}]
  ~ move_entity(Ettore, Room1)
  -> loop
+ [{interaction_exit(RoomRed)}]
  ~ move_entity(Ettore, RoomRed)
  -> loop
+ [{interaction_exit(RoomGreen)}]
  ~ move_entity(Ettore, RoomGreen)
  -> loop

-> DONE