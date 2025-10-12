var pr = ds_priority_create();
var i = 0;

repeat(image_number) {
    ds_priority_add(pr, i, lengthdir_y(1, (rot - 90) + i * (360 / image_number)));
    i += 1;
}

var normSelected = -selected mod image_number;
if (normSelected < 0) normSelected += image_number;

repeat(image_number) {
	i = ds_priority_delete_min(pr);
	draw_sprite_ext(sprite_index, i, menu_x + lengthdir_x(menu_width / 2, 
	(rot - 90) + i * (360 / image_number)), menu_y + lengthdir_y(menu_height / 2, 
	(rot - 90) + i * (360 / image_number)), 1 + lengthdir_y(menu_height / 2, 
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 1 + lengthdir_y(menu_height / 2, 
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 0,
	(i == normSelected) ? c_white : merge_color(c_black, c_white, 0.05),
	1);
}
ds_priority_destroy(pr);

//Perk name text
var text;
switch(item) {
	case 0: text = "None"; break;
	case 1: text = "Rapid Fire"; break;
	case 2: text = "Energy Shield"; break;
	case 3: text = "Toughness"; break;
	case 4: text = "Lightweight"; break;
	case 5: text = "Extra Luck"; break;
	case 6: text = "Flak Jacket"; break;
	case 7: text = "Wild Card"; break;
	case 8: text = "Sudden Death"; break;
	case 9: text = "Bad Luck"; break;
	case 10: text = "Sluggish"; break;
	case 11: text = "Weakness"; break;
	case 12: text = "Deprivation"; break;
	case 13: text = "Heavy Trigger"; break;
	default: text = "???"; break;
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed(menu_x, menu_y + menu_height / 2 + 45, text, 1, 1, 0);

if(global.controllerMode == 0){
	draw_set_font(global.font_main);
	draw_text_transformed(menu_x, menu_y + menu_height/2 + 60, "Press [Space] to Select", 1, 1, 0);
	draw_text_transformed(menu_x, menu_y + menu_height/2 + 75, "Press [Backspace] to Go Back", 1, 1, 0);
}else {
	draw_set_font(global.fontController);//Controller
	draw_text_transformed(menu_x, menu_y + menu_height/2 + 60, "Press [@] to Select", 1, 1, 0);
	draw_text_transformed(menu_x, menu_y + menu_height/2 + 75, "Press [#] to Go Back", 1, 1, 0);
}

//Draw Description Text
var description;
switch(item) {
    case 0: description = "No modifiers applied."; break;
    case 1: description = "Applies a 25% fire rate boost to all weapons."; break;
    case 2: description = "Gives the player a second health bar that can regenerate over time."; break;
    case 3: description = "Doubles player health and medkit effectiveness."; break;
    case 4: description = "Increases player movement speed by 25%."; break;
    case 5: description = "Improves enemy loot drops."; break;
    case 6: description = "Gives the player complete immunity to explosive damage."; break;
    case 7: description = "Gives the player all beneficial modifiers."; break;
    case 8: description = "Player HP set to 1. One hit and it's game over."; break;
    case 9: description = "No loot drops from enemies."; break;
    case 10: description = "Reduces player movement speed by 25%."; break;
    case 11: description = "Halves player health and medkit effectiveness."; break;
    case 12: description = "Disables medkits. No health regeneration allowed."; break;
    case 13: description = "Applies a 25% fire rate reduction to all weapons."; break;
    default: description = "???"; break;
}

//Draw Description Text Below the Menu
draw_text_transformed(menu_x, menu_y + menu_height / 2 + 95, description, 1, 1, 0);

//Draw match setting label below the modifiers menu
var matchText;
switch(global.matchPresetIndex) {
    case 0: matchText = "Standard"; break;
    case 1: matchText = "Elite Invasion"; break;
    case 2: matchText = "Deadlier Forces"; break;
    case 3: matchText = "Final Hour"; break;
    case 4: matchText = "Hell Unleashed"; break;
    case 5: matchText = "Wailing Shadows"; break;
    case 6: matchText = "Bloodthirst"; break;
    case 7: matchText = "Arcane Onslaught"; break;
    case 8: matchText = "Masters of the Dead"; break;
    case 9: matchText = "Hounds of Horror"; break;
    case 10: matchText = "Rapid Terror"; break;
    case 11: matchText = "Plague of the Dead"; break;
    case 12: matchText = "Rattle and Bone"; break;
    case 13: matchText = "Bare Bones"; break;
    case 14: matchText = "Dulled Danger"; break;
    case 15: matchText = "Beginner's Curse"; break;
    default: matchText = "???"; break;
}

//Draw Match Setting Name Below the Menu
draw_text_transformed(menu_x, menu_y + menu_height / 2 + 115, "Game Mode: " + matchText, 1, 1, 0);

//Draw animated arrows
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var leftX = menu_x - 110;
var leftY = menu_y + (menu_height / 2) + 60;
var rightX = menu_x + 110;
var rightY = menu_y + (menu_height / 2) + 60;

var leftScale = 1 + arrowLeftAnim * 0.3;
var rightScale = 1 + arrowRightAnim * 0.3;

draw_sprite_ext(sLeftArrow, 0, leftX, leftY, leftScale, leftScale, 0, merge_color(c_white, c_yellow, arrowLeftAnim), 1);
draw_sprite_ext(sRightArrow, 0, rightX, rightY, rightScale, rightScale, 0, merge_color(c_white, c_yellow, arrowRightAnim), 1);
