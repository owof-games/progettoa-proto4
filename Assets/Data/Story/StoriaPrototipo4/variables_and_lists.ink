// activate debug text
VAR debug = false
/////////////////////////////////////////////////////////////

// list of all characters
LIST characters = Paola, Elia, Zeca, Matteo, Greta, Ettore

// list of all objects
LIST objects = LimettaUnghie, AnticoPugnale, SpiedinoCocktail, Lettera, BottigliaDiVino, FlaconcinoAsma, SigarettaElettronica, Briciole, Torta, Foto

//list of variables to reset on every loop
LIST loopableVariables = EliaRaggiungeGreta, EliaSpaventatoPerZeca

//list to set the current tier
LIST tierState = (FirstTier), SecondTier
////////////////////////////////////////////////////////////


// list of all places (the inventory is considered a physical place)
LIST places = Inventory, WhiteRoom, GreenRoom, RedRoom, YellowRoom, ObjectStorage

// variables for each location, containing the list of characters and objects in them
// can't name them like "white_room" because there are knots with that name
// inventory = mano di Ettore
VAR inventoryContents = ()
VAR whiteRoomContents = (Ettore, Matteo, Paola, Zeca, Elia, Greta, SigarettaElettronica)
VAR greenRoomContents = (LimettaUnghie, AnticoPugnale)
VAR yellowRoomContents = (Lettera, Torta, BottigliaDiVino)
VAR redRoomContents = (FlaconcinoAsma)
VAR objectStorageContents = (SpiedinoCocktail, Briciole, Foto)



/* ---------------------------------

VARIABLES FOR STORY TRACKING

 ----------------------------------*/


//TRACKING DEL PUZZLE FINALE
VAR relationshipDiscovered = false

//TRACKING DIALOGO PG
VAR EliaActing = 0
VAR PaolaActing = 0
VAR GretaActing = 0
VAR ZecaActing = 0
VAR MatteoActing = 0

VAR PaolaTalking = 0
VAR EliaTalking = 0
VAR GretaTalking = 0
VAR ZecaTalking = 0
VAR MatteoTalking = 0


//non resettare al loop
VAR peopleTalking = false
VAR activeNotebook = false
VAR activePhone = false

// situazioni complicate
VAR gretaHaLaLettera = false
VAR paolaPausa = -1