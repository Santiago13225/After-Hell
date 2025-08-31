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

global.dialog_active = true;//Disable silhouette drawing.

width = 64;
height = 32;

op_border = 8;
op_space = 16;

pos = 0;

//Pause Menu
option[0, 0] = "Restart";
option[0, 1] = "Quit";

op_length = 0;
menu_level = 0;