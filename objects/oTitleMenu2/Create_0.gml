///oTitleMenu Create Event
/*This object represents the title menu object.*/
//This event is responsible for setting some variables for the title menu object.

//Initialize all global perk variables to false
global.firerate = false;
global.energyshield = false;
global.juggernaut = false;
global.speed = false;
global.luck = false;
global.magnet = false;
global.flakjacket = false;
global.instakill = false;
global.badluck = false;
global.lowspeed = false;
global.weakness = false;
global.nomedkit = false;
global.slowfirerate = false;

arrowLeftAnim = 0;
arrowRightAnim = 0;

arrowLeftAnim2 = 0;
arrowRightAnim2 = 0;

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

//Survival Mode Menu (Preset Selection)
option[2, 0] = "  Mode: Standard  ";
option[2, 1] = "Next Page";
option[2, 2] = "Back";

//Modifier Menu (Perk Selection)
option[3, 0] = "  Perk 1: None  ";
option[3, 1] = "  Perk 2: None  ";
option[3, 2] = "Next Page";
option[3, 3] = "Back";

/*
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
option[5, 2] = "Back";*/

//Settings Menu
//option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
//option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
option[6, 2] = "Controls: Keyboard and Mouse";

// --- Add after your existing control option setup ---
control_options = ["Controls: Keyboard and Mouse", "Controls: Controller"];

//Determine longest string for the Controls option
control_longest_text = "";
for(var i = 0; i < array_length(control_options); i++) {
	if(string_width(control_options[i]) > string_width(control_longest_text)) {
		control_longest_text = control_options[i];
	}
}

//Set the initial control mode based on a global variable
if(global.controllerMode == 0) {
    option[6, 2] = "Controls: Keyboard and Mouse";
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

//Preset system
if(variable_global_exists("matchPresetIndex")){
	preset_index = global.matchPresetIndex;
}else{
	preset_index = 0;
}

//Perk system
if(variable_global_exists("perkIndex")){
	perk_index = global.perkIndex;
}else{
	perk_index = 0;
}

//Perk 2
if(variable_global_exists("perkIndex2")){
	perk_index2 = global.perkIndex2;
}else{
	perk_index2 = 0;
}

preset_names = [
"Standard",
"Elite Invasion",
"Deadlier Forces",
"Final Hour",
"Hell Unleashed",
"Wailing Shadows",
"Bloodthirst",
"Arcane Onslaught",
"Masters of the Dead",
"Hounds of Horror",
"Rapid Terror",
"Plague of the Dead",
"Rattle and Bone",
"Bare Bones",
"Dulled Danger",
"Beginner's Curse"
];

perk_names = [
"None",
"Rapid Fire",
"Energy Shield",
"Toughness",
"Lightweight",
"Extra Luck",
"Magnet",
"Flak Jacket",
"Wild Card",
"Last Stand",
"Sudden Death",
"Bad Luck",
"Sluggish",
"Weakness",
"Deprivation",
"Heavy Trigger"
];

option[2,0] = "  Mode: " + preset_names[preset_index] + "  ";

option[3,0] = "  Perk 1: " + perk_names[perk_index] + "  ";
option[3,1] = "  Perk 2: " + perk_names[perk_index2] + "  ";

//Determine longest preset string for menu width locking
preset_longest_text = "";
for(var i = 0; i < array_length(preset_names); i++){
	var t = "   Mode: " + preset_names[i] + "   ";

	if(string_width(t) > string_width(preset_longest_text)){
		preset_longest_text = t;
	}
}

//Lock width (same idea as presets)
perk_longest_text = "";
for(var i = 0; i < array_length(perk_names); i++){
	var tp = "  Perk 2: " + perk_names[i] + "  ";

	if(string_width(tp) > string_width(perk_longest_text)){
		perk_longest_text = tp;
	}
}