TODO: scegliere se farli accadere una sola volta, o ripeterli. Potrebbe essere carino lasciarli sempre ma, dopo il primo ascolto, offrire l'opzione di fuga (diversa a seconda del contesto, da "ho già sentito questa storia" a "te ne vai e li lasci litigare").
//INDEX
=== second_tier_storylets

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