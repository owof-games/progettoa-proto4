INCLUDE move_between_rooms.ink
INCLUDE variables_and_functions.ink
INCLUDE exceptions.ink
INCLUDE update_entities_location.ink

~ updateEntitiesLocations()
-> loop

=== loop

~ temp ettore_location = entity_location(Ettore)

@interact
<- move_between_rooms(ettore_location)
+ [debug:advance_time]
  ~ advance_time()
+ ->
-

-> loop