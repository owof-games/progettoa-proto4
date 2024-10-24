// activate debug text
VAR debug = false
VAR debugTime = true //giusto per avere printato il tempo effettivo
/////////////////////////////////////////////////////////////

// list of all characters
LIST characters = Paola, Elia, Zeca, Matteo, Greta, Ettore

// list of all objects
LIST objects = LimettaUnghie, AnticoPugnale, SpiedinoCocktail, Lettera, BottigliaDiVino, FlaconcinoAsma, SigarettaElettronica, Briciole, Torta, Foto

//list of variables to reset on every loop
LIST loopableVariables = EliaRaggiungeGreta, EliaSpaventatoPerZeca, PaolaDavveroMorta, pausaRapportoMatteo, pausaRapportoZeca, pausaRapportoElia, pausaRapportoGreta

//list to set the current tier
LIST tierState = (FirstTier), SecondTier
////////////////////////////////////////////////////////////


// list of all places (the inventory is considered a physical place)
LIST places = Inventory, WhiteRoom, GreenRoom, RedRoom, YellowRoom, ObjectStorage

// variables for each location, containing the list of characters and objects in them
// can't name them like "white_room" because there are knots with that name
// inventory = mano di Ettore
VAR inventoryContents = ()
VAR whiteRoomContents = (Ettore, Matteo, Paola, Zeca, Elia, Greta)
VAR greenRoomContents = ()
VAR yellowRoomContents = ()
VAR redRoomContents = ()
VAR objectStorageContents = (SpiedinoCocktail, Briciole, Foto, LimettaUnghie, AnticoPugnale, SigarettaElettronica, Lettera, Torta, BottigliaDiVino, FlaconcinoAsma)


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
VAR activeObjects = false

// eventi specifici nella storia
VAR gretaHaLaLettera = false

// variabili degli storylet
VAR paolaPausa = -1
VAR sheIsTheBest = -1