/*
Avvia la musica con nome "music_name" associata al personaggio "character", e che lo segue
*/
EXTERNAL start_distracting_music(music_name, character)
=== function start_distracting_music(music_name, character)
START MUSIC {music_name} FOR CHARACTER {character}

/*
Il contrario di start_distracting_music.
*/
EXTERNAL stop_distracting_music(music_name, character)
=== function stop_distracting_music(music_name, character)
STOP MUSIC {music_name} FOR CHARACTER {character}