//FIRST TIER STORYLETS

== storylets

{

- areThreeEntitiesTogether(Elia, Greta, Ettore) && not relationshipDiscovered:
    -> aStolenKissStorylet

- areFourEntitiesTogether(Elia, Greta, Zeca, Ettore) && relationshipDiscovered:
    -> hotMessStorylet
    
- areTwoEntitiesTogether(Elia, Ettore) && entity_location(Lettera) == inventory_contents:
    -> hardLifeStorylet    

- areTwoEntitiesTogether(Elia, Ettore) && not areTwoEntitiesTogether(Elia, Greta)||areTwoEntitiesTogether(Elia, Zeca) && hotMessStorylet == true:
    -> aPainfullConfessionStorylet

- else: ->->

}

->->
