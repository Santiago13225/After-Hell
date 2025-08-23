///oScoreboard Draw GUI Event
//This object represents a scoreboard.
//This event is responsible for handling scoreboard drawing.

//Draw over the camera
//var _camX = camera_get_view_x(view_camera[0]);
//var _camY = camera_get_view_y(view_camera[0]);
var _wx = display_get_gui_width();
var _wy = display_get_gui_height();
draw_set_font(global.fontHUD);

//Draw selected modifier and match setting icons
var iconSize = 64;//Assuming 64x64 icons
var iconScale = 1;//Scale
var spacing = 8;//Padding between icons

draw_sprite_ext(sScoreboardScreen, 0, 0, 0, 3, 3, 0, c_white, 1);

//draw_rectangle(x, y, x + width, y + height, false);

draw_rectangle_color(160 * 3, 90 * 3, 480 * 3, 270 * 3, c_black, c_black, c_black, c_black, false);
//draw_text_transformed(160 * 3, 90 * 3, "Scoreboard:", 3, 3, 0);

//Draw the selected modifier label below the map selection menu
var mapText;
switch(global.selectedMapSprite) {
	case 0: mapText = "House"; break;
	case 1: mapText = "Facility"; break;
	case 2: mapText = "Temple"; break;
	case 3: mapText = "Overlook"; break;
	case 4: mapText = "Island"; break;
	case 5: mapText = "Casino"; break;
	case 6: mapText = "Labyrinth"; break;
	case 7: mapText = "Graveyard"; break;
	case 8: mapText = "Museum"; break;
	case 9: mapText = "Water Station"; break;
	case 10: mapText = "City Block"; break;
	case 11: mapText = "The Yard"; break;
	case 12: mapText = "Test_Level"; break;
	default: mapText = "???"; break;
}
//draw_text_transformed(160 * 3, (90 * 3) + 30, "Map: " + mapText, 3, 3, 0);

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
draw_text_transformed(160 * 3, 90 * 3, mapText + " - " + matchText, 3, 3, 0);
//draw_text_transformed(320 * 3, (90 * 3) + 30, "Game Mode: " + matchText, 3, 3, 0);

//Draw the selected modifier label below the map selection menu
var modifierText;
switch(global.perkIndex) {
    case 0: modifierText = "None"; break;
    case 1: modifierText = "Rapid Fire"; break;
    case 2: modifierText = "Energy Shield"; break;
    case 3: modifierText = "Toughness"; break;
    case 4: modifierText = "Lightweight"; break;
    case 5: modifierText = "Extra Luck"; break;
    case 6: modifierText = "Flak Jacket"; break;
    case 7: modifierText = "Wild Card"; break;
    case 8: modifierText = "Sudden Death"; break;
    case 9: modifierText = "Bad Luck"; break;
    case 10: modifierText = "Sluggish"; break;
    case 11: modifierText = "Weakness"; break;
    case 12: modifierText = "Deprivation"; break;
    case 13: modifierText = "Heavy Trigger"; break;
    default: modifierText = "???"; break;
}
draw_text_transformed(160 * 3, (90 * 3) + 30, "Modifier: " + modifierText, 3, 3, 0);

//Draw the selected map icon
if(global.selectedMapSprite != undefined) {
	//draw_sprite_ext(sCarouselMenu3, global.selectedMapSprite, 160 * 3 + (32 * 3) + 30, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
	draw_sprite_ext(sCarouselMenu3, global.selectedMapSprite, 160 * 3 + (32 * 3) + 60, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
}

//Draw the selected mode icon
if(global.matchPresetIndex != undefined) {
	//draw_sprite_ext(sSettingsCarouselMenu, global.matchPresetIndex, 320 * 3 + (32 * 3) + 30, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
	draw_sprite_ext(sSettingsCarouselMenu, global.matchPresetIndex, 320 * 3, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
}

//Draw the selected modifier icon
if(global.perkIndex != undefined) {
	//draw_sprite_ext(sPerksCarouselMenu, global.perkIndex, 320 * 3 + (32 * 3) + 30, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
	draw_sprite_ext(sPerksCarouselMenu, global.perkIndex, 480 * 3 - (32 * 3) - 60, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
}

//Draw stats for single player
draw_text_transformed(160 * 3, _wy/2, "Waves Survived: " + string(oInvisibleSpawner2.currentWave), 3, 3, 0);
draw_text_transformed(160 * 3, _wy/2 + 30, "Time Survived: 00:00:00", 3, 3, 0);

draw_text_transformed(160 * 3, _wy/2 + 85, "Player:", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 85, "Kills:", 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 85, "Score:", 3, 3, 0);

draw_text_transformed(160 * 3, _wy/2 + 140, "Player 1", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 140, string(global.enemyKillCount), 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 140, "500", 3, 3, 0);

draw_text_transformed(160 * 3, _wy/2 + 170, "-", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 170, "-", 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 170, "-", 3, 3, 0);

draw_text_transformed(160 * 3, _wy/2 + 200, "-", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 200, "-", 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 200, "-", 3, 3, 0);

draw_text_transformed(160 * 3, _wy/2 + 230, "-", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 230, "-", 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 230, "-", 3, 3, 0);