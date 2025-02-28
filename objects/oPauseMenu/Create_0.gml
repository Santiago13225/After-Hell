///oPauseMenu Create Event
/*This object represents a pause menu.*/
//This event is responsible for setting some variables for the pause menu.

alpha = .6;

depth = -8500;//Let's you see the health and enemy count.
//depth = -9500;//Does not let you see the health and enemy count or HUD.

global.dialog_active = true;//Disable silhouette drawing.

width = 64;
height = 104;

op_border = 8;
op_space = 16;

pos = 0;

//Pause Menu
option[0, 0] = "Resume";
option[0, 1] = "Settings";
option[0, 2] = "Quit";

//Settings Menu
option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
option[1, 2] = "Controls: ???";
// Set the initial control mode based on a global variable
if (global.controllerMode == 0) {
    option[1, 2] = "Controls: Keyboard";
} else {
    option[1, 2] = "Controls: Controller";
}
option[1, 3] = "Back";
/*
//Settings Menu
option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
option[6, 2] = "Controls: Keyboard";
option[6, 3] = "Back";
*/

op_length = 0;
menu_level = 0;