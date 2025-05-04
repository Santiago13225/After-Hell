///oTitleMenu Create Event
/*This object represents the title menu object.*/
//This event is responsible for setting some variables for the title menu object.

width = 64;
//height = 104;
height = 32;

op_border = 8;
op_space = 16;

pos = 0;

//Title Menu
option[0, 0] = "Tutorial";
//option[0, 0] = "*Locked in Demo";
option[0, 1] = "Survival Mode";
option[0, 2] = "Extras";
option[0, 3] = "Settings";
option[0, 4] = "Reset Game";

//Story Mode Menu
option[1, 0] = "Mission 0: Tutorial";
option[1, 1] = "Test Mission 1: The Outbreak's Origins (*Not Canon)";
option[1, 2] = "Test Mission 2: Unveiling the Truth (*Not Canon)";
option[1, 3] = "Back";

//Survival Mode Menu
option[2, 0] = "House";
option[2, 1] = "Facility";
option[2, 2] = "Temple";
option[2, 3] = "Overlook";
option[2, 4] = "Next Page";
option[2, 5] = "Back";

//Page 2
option[3, 0] = "Island";
option[3, 1] = "Casino";
option[3, 2] = "Labyrinth";
option[3, 3] = "Graveyard";
option[3, 4] = "Next Page";
option[3, 5] = "Previous Page";
option[3, 6] = "Back";

//Page 3
option[4, 0] = "Museum";
option[4, 1] = "Water Station";
option[4, 2] = "City Block";
option[4, 3] = "The Yard";
option[4, 4] = "Next Page";
option[4, 5] = "Previous Page";
option[4, 6] = "Back";

//Page 4
option[5, 0] = "Test_Level";
option[5, 1] = "Previous Page";
option[5, 2] = "Back";

//Settings Menu
//option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
//option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0);
option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0);
option[6, 2] = "Controls: ???";
// Set the initial control mode based on a global variable
if(global.controllerMode == 0) {
    option[6, 2] = "Controls: Keyboard";
}else {
    option[6, 2] = "Controls: Controller";
}
//if global.controllerMode == 0 option[6, 2] = "Controls: Controller"; else option[6, 2] = "Controls: Keyboard";
option[6, 3] = "Back";

//Extras
option[7, 0] = "CentillionEons";
option[7, 1] = "Discord";
option[7, 2] = "Peyton Burnham";
option[7, 3] = "Vorpal Lance Music";
option[7, 4] = "Chris Jay";
option[7, 5] = "Back";

op_length = 0;
menu_level = 0;