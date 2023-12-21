///oVictoryScreen Create Event
/*This object represents a victory screen object.*/
//This event is responsible for setting some variables for the victory screen object.

//Fade in
alpha = 0;
alphaSpd = 1/75;
alphaMax = .6;

depth = -10000;
depth = -8500;//Lets you see the health and enemy count.
//depth = -9500;//Does not let you see the health and enemy count or HUD.

width = 64;
height = 104;

op_border = 8;
op_space = 16;

pos = 0;

//Return to menu
option[0, 0] = "Back to Menu";

op_length = 0;
menu_level = 0;