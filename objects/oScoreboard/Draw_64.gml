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

//Ensure the map sprite icon variable exists for tutorial and sandbox levels
if(!variable_global_exists("selectedMapSprite")) {
    global.selectedMapSprite = 12;//13th frame
}

draw_sprite_ext(sScoreboardScreen, 0, 0, 0, 3, 3, 0, c_white, 1);

//draw_rectangle(x, y, x + width, y + height, false);

//draw_rectangle_color(160 * 3, 90 * 3, 480 * 3, 270 * 3, c_black, c_black, c_black, c_black, false);
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

//Ensure the map text variable exists for tutorial level
if(room == rm_Tutorial_Level) {
    mapText = "Tutorial Level";
}

//Ensure the map text variable exists for sandbox level
if(room == rm_Mission0) {
    mapText = "Test_Level";
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

//Ensure the map sprite icon variable exists for tutorial level
if(room == rm_Tutorial_Level){
	global.selectedMapSprite = 12;//13th frame
}

//Ensure the map sprite icon variable exists for sandbox level
if(room == rm_Mission0){
	global.selectedMapSprite = 12;//13th frame
}

//Draw the selected map icon
if(global.selectedMapSprite != undefined) {
	//draw_sprite_ext(sCarouselMenu3, global.selectedMapSprite, 160 * 3 + (32 * 3) + 30, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
	draw_sprite_ext(sCarouselMenu3, global.selectedMapSprite, 160 * 3 + (32 * 3) + 60, (90 * 3) + (32 * 3) + 78, 3, 3, 0, c_white, 1);
}

//Draw the selected mode icon
if(global.matchPresetIndex != undefined) {
	//draw_sprite_ext(sSettingsCarouselMenu, global.matchPresetIndex, 320 * 3 + (32 * 3) + 30, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
	draw_sprite_ext(sSettingsCarouselMenu, global.matchPresetIndex, 320 * 3, (90 * 3) + (32 * 3) + 78, 3, 3, 0, c_white, 1);
}

//Draw the selected modifier icon
if(global.perkIndex != undefined) {
	//draw_sprite_ext(sPerksCarouselMenu, global.perkIndex, 320 * 3 + (32 * 3) + 30, (90 * 3) + (32 * 3) + 80, 3, 3, 0, c_white, 1);
	draw_sprite_ext(sPerksCarouselMenu, global.perkIndex, 480 * 3 - (32 * 3) - 60, (90 * 3) + (32 * 3) + 78, 3, 3, 0, c_white, 1);
}

//Draw stats for single player
if(room == rm_Mission0){
	draw_text_transformed(160 * 3, _wy/2 + 3, "Waves Survived: 0", 3, 3, 0);
}else {
	draw_text_transformed(160 * 3, _wy/2 + 3, "Waves Survived: " + string(oInvisibleSpawner2.currentWave), 3, 3, 0);
}
//draw_text_transformed(160 * 3, _wy/2 + 33, "Time Survived: 00:00:00", 3, 3, 0);
/*var _timeMS;
if(instance_exists(oPlayer)) {
    //Player is alive → calculate time survived dynamically
    _timeMS = current_time - oPlayer.spawnTime;
}else {
    //Player dead → use stored global value
    _timeMS = global.playerSurvivalTime;
}

//Convert milliseconds to hh:mm:ss
var _secondsTotal = floor(_timeMS / 1000);
var _hours = floor(_secondsTotal / 3600);
var _minutes = floor((_secondsTotal mod 3600) / 60);
var _seconds = _secondsTotal mod 60;

//Format string with leading zeros
var _timeText = string_format(_hours, 2, 0) + ":" + string_format(_minutes, 2, 0) + ":" + string_format(_seconds, 2, 0);

draw_text_transformed(160 * 3, _wy/2 + 33, "Time Survived: " + _timeText, 3, 3, 0);
*/

var _timeMS;
if(instance_exists(oPlayer)) {
    _timeMS = current_time - oPlayer.spawnTime;
}else {
    _timeMS = global.playerSurvivalTime;
}

var _secondsTotal = floor(_timeMS / 1000);

//Cap at 99:59:59 (in seconds)
var _maxSeconds = (99 * 3600) + (59 * 60) + 59;
var _plus = false;
if(_secondsTotal > _maxSeconds){
    _secondsTotal = _maxSeconds;
    _plus = true;
}

var _hours = floor(_secondsTotal / 3600);
var _minutes = floor((_secondsTotal mod 3600) / 60);
var _seconds = _secondsTotal mod 60;

//Add leading zeros manually
var _hoursStr = string(_hours);
if(_hours < 10) _hoursStr = "0" + _hoursStr;

var _minutesStr = string(_minutes);
if(_minutes < 10) _minutesStr = "0" + _minutesStr;

var _secondsStr = string(_seconds);
if(_seconds < 10) _secondsStr = "0" + _secondsStr;

var _timeText = _hoursStr + ":" + _minutesStr + ":" + _secondsStr;

//Add plus if over the cap
if(_plus) _timeText += "+";

draw_text_transformed(160 * 3, _wy/2 + 33, "Time Survived: " + _timeText, 3, 3, 0);

//draw_text_transformed(160 * 3, _wy/2 + 85, "Player:", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 85, "Kills:", 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 85, "Score:", 3, 3, 0);

draw_text_transformed(160 * 3, _wy/2 + 140, "Player 1", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 140, string(global.enemyKillCount), 3, 3, 0);
//draw_text_transformed(340 * 3, _wy/2 + 140, "500", 3, 3, 0);
if(room == rm_Mission0){
	draw_text_transformed(340 * 3, _wy/2 + 140, "10000000", 3, 3, 0);
}else {
	draw_text_transformed(340 * 3, _wy/2 + 140, string(oHUD2.playerTotalScore), 3, 3, 0);
}

draw_text_transformed(160 * 3, _wy/2 + 170, "-", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 170, "-", 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 170, "-", 3, 3, 0);

draw_text_transformed(160 * 3, _wy/2 + 200, "-", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 200, "-", 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 200, "-", 3, 3, 0);

draw_text_transformed(160 * 3, _wy/2 + 230, "-", 3, 3, 0);
draw_text_transformed(260 * 3, _wy/2 + 230, "-", 3, 3, 0);
draw_text_transformed(340 * 3, _wy/2 + 230, "-", 3, 3, 0);