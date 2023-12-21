///oGameOverScreen Create Event
/*This object represents a game over screen.*/
//This event is responsible for setting some variables for the game over screen.

//Fade in
alpha = 0;
alphaSpd = 1/75;
alphaMax = .6;

//depth = -10000;
depth = -8500;//Let's you see health and enemy count.
//depth = -9500;//Does not let you see health and enemy count or HUD.

width = 64;
height = 104;

op_border = 8;
op_space = 16;

pos = 0;

//Pause Menu
option[0, 0] = "Restart";
option[0, 1] = "Settings";
option[0, 2] = "Quit";
/*
//Settings Menu
option[1, 0] = "Controls: Keyboard";
option[1, 1] = "Back";
*/
//Settings Menu
option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
option[1, 2] = "??? (*Locked in demo)";
//option[1, 2] = "Controls: Keyboard";
option[1, 3] = "Back";

op_length = 0;
menu_level = 0;