//FIRST TIER STORYLETS

=== storylets

{

- areThreeEntitiesTogether(Elia, Greta, Ettore) && not areTwoEntitiesTogether(Elia, Zeca)||areTwoEntitiesTogether(Elia, Paola)||areTwoEntitiesTogether(Elia, Matteo) && not relationshipDiscovered:
    -> aStolenKissStorylet

- areFourEntitiesTogether(Elia, Greta, Zeca, Ettore) && not areTwoEntitiesTogether(Elia, Paola)||areTwoEntitiesTogether(Elia, Matteo) && relationshipDiscovered:
    -> hotMessStorylet
    
- areTwoEntitiesTogether(Elia, Ettore) && inventory_contents == Lettera && not areTwoEntitiesTogether(Elia, Paola)||areTwoEntitiesTogether(Elia, Matteo):
    -> hardLifeStorylet

- areTwoEntitiesTogether(Elia, Ettore) && not areFourEntitiesTogether(Zeca, Greta, Paola, Matteo) && hotMessStorylet == true:
    -> aPainfullConfessionStorylet

- else: ->->

}

->->
