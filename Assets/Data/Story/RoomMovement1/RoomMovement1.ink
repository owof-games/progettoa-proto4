@moveTo roomName:room1

-> loop

=== loop ===

@interact
+ [exit:room2]
  @moveTo roomName:room2
  -> loop
+ [exit:room1]
  @moveTo roomName:room1
  -> loop

-> DONE