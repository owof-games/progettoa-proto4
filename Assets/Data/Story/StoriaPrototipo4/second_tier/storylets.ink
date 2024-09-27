//INDEX
=== second_tier_storylets

{

- are_three_entities_together(Elia, Greta, Ettore) && not are_two_entitites_together(Elia, Zeca)||are_two_entitites_together(Elia, Paola)||are_two_entitites_together(Elia, Matteo) && not relationshipDiscovered:
    -> aStolenKissStorylet

- are_four_entities_together(Elia, Greta, Zeca, Ettore) && not are_two_entitites_together(Elia, Paola)||are_two_entitites_together(Elia, Matteo) && relationshipDiscovered:
    -> hotMessStorylet
    
- are_two_entitites_together(Elia, Ettore) && inventoryContents == Lettera && not are_two_entitites_together(Elia, Paola)||are_two_entitites_together(Elia, Matteo):
    -> hardLifeStorylet

- are_two_entitites_together(Elia, Ettore) && not are_four_entities_together(Zeca, Greta, Paola, Matteo) && hotMessStorylet == true:
    -> aPainfullConfessionStorylet

- else: ->->

}

->->

//STORYLETS
//STORYLETS ABOUT THE ELIA + ZECA + GRETA DRAMA
=== aStolenKissStorylet
Stolen Kiss Storylet
~ relationshipDiscovered = true
    + XX
    -
->->



=== hotMessStorylet
Hot Mess Storylet
    + XX
    -
->->


=== aPainfullConfessionStorylet
a Painfull Confession Storylet
    + XX
    -
->->


=== hardLifeStorylet
Hard Life Storylet
    + XX
    -
->->