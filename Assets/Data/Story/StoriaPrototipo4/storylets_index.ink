//FIRST TIER STORYLETS

== storylets

TODO: creare funzione per chiamare gli storylets
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
