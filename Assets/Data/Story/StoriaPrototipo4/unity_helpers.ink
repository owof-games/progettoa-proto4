=== function isObjectWithEttore(obj)
~ temp ettoreLocation = entity_location(Ettore)
~ temp objectLocation = entity_location(obj)
~ return activeObjects && ettoreLocation == objectLocation

=== function getEttoreLocation()
~ return entity_location(Ettore)