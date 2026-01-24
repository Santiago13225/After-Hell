///oGameOverScreen Draw Event
/*This object represents a game over screen.*/
//This event is responsible for handling game over screen object drawing.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(alpha);

//Draw over the camera
var _cX = camera_get_view_x(view_camera[0]);
var _wx = camera_get_view_width(view_camera[0]);
var _cY = camera_get_view_y(view_camera[0]);
var _wy = camera_get_view_height(view_camera[0]);
draw_set_font(global.fontHUD);

//Draw selected modifier and match setting icons
var iconSize = 64;//Assuming 64x64 icons
var iconScale = 1;//Scale
var spacing = 8;//Padding between icons

//Ensure the map sprite icon variable exists for tutorial and sandbox levels
if(!variable_global_exists("selectedMapSprite")) {
    global.selectedMapSprite = 12;//13th frame
}

draw_sprite_ext(sScoreboardScreen, 0, _cX, _cY, 1, 1, 0, c_white, alpha);

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
	case 12: mapText = "Supermarket"; break;
	case 13: mapText = "Subway Station"; break;
	case 14: mapText = "Gas Station"; break;
	case 15: mapText = "Cathedral"; break;
	case 16: mapText = "Void"; break;
	case 17: mapText = "Cloudwalk"; break;
	case 18: mapText = "Inferno"; break;
	case 19: mapText = "Test_Level"; break;
	default: mapText = "???"; break;
}

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

draw_text_transformed(_cX + 160, _cY + 90, mapText + " - " + matchText, 1, 1, 0);

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
draw_text_transformed(_cX + 160, _cY + 90 + 10, "Modifier: " + modifierText, 1, 1, 0);

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
	draw_sprite_ext(sCarouselMenu3, global.selectedMapSprite, _cX + 160 + 32 + 20, _cY + 90 + 32 + 26, 1, 1, 0, c_white, alpha);
}

//Draw the selected mode icon
if(global.matchPresetIndex != undefined) {
	draw_sprite_ext(sSettingsCarouselMenu, global.matchPresetIndex, _cX + 320, _cY + 90 + 32 + 26, 1, 1, 0, c_white, alpha);
}

//Draw the selected modifier icon
if(global.perkIndex != undefined) {
	draw_sprite_ext(sPerksCarouselMenu, global.perkIndex, _cX + 480 - 32 - 20, _cY + 90 + 32 + 26, 1, 1, 0, c_white, alpha);
}

//Draw stats for single player
//draw_text_transformed(_cX + 160, _cY + _wy/2 + 1, "Waves Survived: " + string(oInvisibleSpawner2.currentWave), 1, 1, 0);
if(room == rm_Mission0){
	draw_text_transformed(_cX + 160, _cY + _wy/2 + 1, "Waves Survived: 0", 1, 1, 0);
}else {
	draw_text_transformed(_cX + 160, _cY + _wy/2 + 1, "Waves Survived: " + string(global.finalWave), 1, 1, 0);
}
//draw_text_transformed(_cX + 160, _cY + _wy/2 + 11, "Time Survived: 00:00:00", 1, 1, 0);

//var _timeMS;

//Time survived display
var _secondsTotal;

if(instance_exists(oPlayer)) {
    //_timeMS = current_time - oPlayer.spawnTime;
	_secondsTotal = floor(oPlayer.survivalSteps / room_speed);
}else {
	//_timeMS = global.playerSurvivalTime;
	_secondsTotal = global.playerSurvivalTime;//backup if player is gone
}

//var _secondsTotal = floor(_timeMS / 1000);

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

draw_text_transformed(_cX + 160, _cY + _wy/2 + 11, "Time Survived: " + _timeText, 1, 1, 0);

draw_text_transformed(_cX + 260, _cY + _wy/2 + 85/3, "Kills:", 1, 1, 0);
draw_text_transformed(_cX + 340, _cY + _wy/2 + 85/3, "Score:", 1, 1, 0);

draw_text_transformed(_cX + 160, _cY + _wy/2 + 140/3, "Player 1", 1, 1, 0);
draw_text_transformed(_cX + 260, _cY + _wy/2 + 140/3, string(global.enemyKillCount), 1, 1, 0);
if(room == rm_Mission0){
	draw_text_transformed(_cX + 340, _cY + _wy/2 + 140/3, "10000000", 1, 1, 0);
}else{
	draw_text_transformed(_cX + 340, _cY + _wy/2 + 140/3, string(oHUD2.playerTotalScore), 1, 1, 0);
}
//draw_text_transformed(_cX + 340, _cY + _wy/2 + 140/3, "500", 1, 1, 0);

draw_text_transformed(_cX + 160, _cY + _wy/2 + 170/3, "-", 1, 1, 0);
draw_text_transformed(_cX + 260, _cY + _wy/2 + 170/3, "-", 1, 1, 0);
draw_text_transformed(_cX + 340, _cY + _wy/2 + 170/3, "-", 1, 1, 0);

draw_text_transformed(_cX + 160, _cY + _wy/2 + 200/3, "-", 1, 1, 0);
draw_text_transformed(_cX + 260, _cY + _wy/2 + 200/3, "-", 1, 1, 0);
draw_text_transformed(_cX + 340, _cY + _wy/2 + 200/3, "-", 1, 1, 0);

draw_text_transformed(_cX + 160, _cY + _wy/2 + 230/3, "-", 1, 1, 0);
draw_text_transformed(_cX + 260, _cY + _wy/2 + 230/3, "-", 1, 1, 0);
draw_text_transformed(_cX + 340, _cY + _wy/2 + 230/3, "-", 1, 1, 0);

var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//draw a black rectangle over the screen
//draw_set_alpha(alpha*alphaMax);
//draw_rectangle_color(_camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false);

//draw the text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_font(global.font_main);

//"game over"
var _gameoverOffset = -16;
draw_text_transformed(_camX +  _camW/2, _camY + _camH + _gameoverOffset * 20, "The match has ended.", 1, 1, 0);
draw_text_transformed(_camX + _camW/2, _camY + _camH + _gameoverOffset * 19, "You were overwhelmed.", 1, 1, 0);
//"press shoot to restart"
var _restartOffset = 40;
//draw_text_transformed(_camX + _camW/2, _camY + _camH + _gameoverOffset*8, "- Press Shoot to Restart -", 1, 1, 0);
//reset draw settings
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
draw_set_alpha(1);

//reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Dynamically get width and height of menu
var _new_w = 0;

for(var i = 0; i < op_length; i++){
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}
width = _new_w + (op_border * 2);
//height = op_border * 2 + ((string_height(option[0,0]) + op_space) * op_length/2);
height = (op_border * 2) + ((string_height(option[0,0]) + (op_space/4)) * (op_length));
//height = op_border*2 + ((sprite_get_height(sMainFont)+op_space) * (op_length));

//Center menu
//x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2) - (width/2);
x = _camX + _camW/2 - (width/2);
//x = _camX + _camW/2 - (width/2) - 0.75;
//x = x + oPlayer.x - camera_get_view_width(view_camera[0])/2;
//y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2) - (height/2);
y = _camY + _camH/2 - (height/2) + 130;
//y = y;

//Draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, alpha);

draw_set_alpha(1);

//Draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < op_length; i++){
	var _c = c_white;
	if (pos == i){
		draw_sprite_ext(sPixel, 0, x, y + op_border + op_space * i, width, string_height(option[menu_level, i]), 0, c_red, 0.5 * alpha);
		_c = c_yellow;
	}
	draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, alpha);
}
//width = _new_w + (op_border * 2);
//height = op_border * 2 + string_height(option[0,0]) + (op_length + 1) * op_space;
//height = (op_border * 2) + sprite_get_height(sMainFont) + ((op_length + 1) * op_space);
//settings and quitting the game and stuff
//get inputs
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);

//store number of options in current menu
op_length = array_length(option[menu_level]);

//Input (controller)
var _gamePad = 0;
if(gamepad_is_connected(_gamePad)) {
	//D-pad
	up_key |= gamepad_button_check_pressed(_gamePad, gp_padu);
	down_key |= gamepad_button_check_pressed(_gamePad, gp_padd);
	accept_key |= gamepad_button_check_pressed(_gamePad, gp_face1);//Confirm button (A on Xbox, Cross on PlayStation)

	//Stick settings
	var deadzone = 0.5;//threshold
	var delay_initial = 15;//delay before repeat starts
	var delay_repeat  = 6;//faster repeat after holding

	if(!variable_instance_exists(id, "stick_delay")) stick_delay = 0;
	if(!variable_instance_exists(id, "stick_held")) stick_held = false;

	//Stick input
	var ly = gamepad_axis_value(0, gp_axislv);
	var moved = false;

	//Countdown
	if(stick_delay > 0) stick_delay--;

	//Check input
	if(stick_delay <= 0) {
		if(ly > deadzone) { down_key = true; audio_play_sound(sndClick, 10, false); moved = true; }
		else if(ly < -deadzone) { up_key = true; audio_play_sound(sndClick, 10, false); moved = true; }

		if(moved) {
			if(!stick_held) {
				stick_delay = delay_initial;//first delay
				stick_held = true;
			}else {
				stick_delay = delay_repeat;//repeat delay
			}
		}else {
			stick_held = false;//reset if neutral
		}
	}
}

//move through the menu
pos += down_key - up_key;
if pos >= op_length
{
	pos = 0;
}
if pos < 0
{
	pos = op_length-1;
}

//using the options
if accept_key{
	var _sml = menu_level;
	
	switch(menu_level)
	{
		//pause menu
		case 0:
			switch(pos)
			{
				//resume
				case 0:
					room_restart();
					global.dialog_active = false;
					//audio_play_sound(sndBeep, 10, false);
					instance_destroy(oPauseMenu2);
					break;
				//quit game
				case 1:
					global.dialog_active = false;
					instance_deactivate_object(oPlayer);
					TransitionStart(rm_Title_Screen, sqFadeOut, sqFadeIn);
					break;
			}
			break;
	}
	//set position back
	if _sml != menu_level{
		pos = 0;
	}
	//correct option length
	op_length = array_length(option[menu_level]);
}