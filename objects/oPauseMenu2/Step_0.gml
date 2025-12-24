///oPauseMenu Step Event
/*This object represents a pause menu.*/
//This event is responsible for handling pause menu behavior.

if !instance_exists(oPlayer){
	instance_destroy();
	exit;
}

if(instance_exists(oTextbox2)){
	instance_destroy(oTextbox2);
}

//Settings and quitting the game and stuff
//Get inputs
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);

//Get inputs for volume control
left_key = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));

//Controller inputs
var _gamePad = 0;
var is_controller_connected = gamepad_is_connected(_gamePad);

if is_controller_connected{
	up_key |= gamepad_button_check_pressed(_gamePad, gp_padu);
	down_key |= gamepad_button_check_pressed(_gamePad, gp_padd);
	left_key |= gamepad_button_check_pressed(_gamePad, gp_padl);
	right_key |= gamepad_button_check_pressed(_gamePad, gp_padr);
	accept_key |= gamepad_button_check_pressed(_gamePad, gp_face1);
	
	//Stick settings
	var deadzone = 0.5;//threshold
	var delay_initial = 15;//delay before repeat starts
	var delay_repeat  = 6;//faster repeat after holding

	if(!variable_instance_exists(id, "stick_delay")) stick_delay = 0;
	if(!variable_instance_exists(id, "stick_held")) stick_held = false;

	//Stick input
	var lx = gamepad_axis_value(0, gp_axislh);
	var ly = gamepad_axis_value(0, gp_axislv);
	var moved = false;

	//Countdown
	if(stick_delay > 0) stick_delay--;

	//Check input
	if(stick_delay <= 0) {
		if(lx > deadzone) { right_key = true; audio_play_sound(sndClick, 10, false); moved = true; }
		else if(lx < -deadzone) { left_key = true; audio_play_sound(sndClick, 10, false); moved = true; }
		else if(ly > deadzone) { down_key = true; audio_play_sound(sndClick, 10, false); moved = true; }
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

//Adjust music volume
if(menu_level == 1 && pos == 0)//Check if in the Settings menu and the first option (music)
{
    if(left_key){
        global.musicvolume = max(0, global.musicvolume - 0.1);//Reduce volume by 10%
		//option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
		option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0);
    }
    else if(right_key){
        global.musicvolume = min(1, global.musicvolume + 0.1);//Increase volume by 10%
		//option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
		option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0);
    }
}
//Adjust sound effects volume
if(menu_level == 1 && pos == 1)//Check if in the Settings menu and the second option (sfx)
{
    if(left_key){
        global.sfxvolume = max(0, global.sfxvolume - 0.1);//Reduce volume by 10%
		//option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
		option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0);
    }
    else if(right_key){
        global.sfxvolume = min(1, global.sfxvolume + 0.1);//Increase volume by 10%
		//option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
		option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0);
    }
}

//Store number of options in current menu
op_length = array_length(option[menu_level]);

//Move through the menu
pos += down_key - up_key;
if pos >= op_length{
	pos = 0;
}
if pos < 0{
	pos = op_length-1;
}

if(menu_level == 1) {
    if(oControllerIndicator.controller_count == 0) {
        //Lock to Keyboard
        global.controllerMode = 0;
        option[1, 2] = "Controls: Keyboard";
    }else {
        //Unlock - keep the toggleable text
        if(global.controllerMode == 0) {
            option[1, 2] = "Controls: Keyboard";
        }else {
            option[1, 2] = "Controls: Controller";
        }
    }
}

//Using the options
if accept_key{
	var _sml = menu_level;
	
	switch(menu_level)
	{
		//Pause Menu
		case 0:
			switch(pos)
			{
				//Resume
				case 0:
				global.dialog_active = false;				
/*
#region
				if room == rm_House_Level1{
					audio_resume_sound(sndHouseTheme1);
				}
				if room == rm_Facility_Level{
					audio_resume_sound(sndFacilityTheme1);
				}
				if room == rm_Temple_Level1{
					audio_resume_sound(sndTempleTheme1);
				}
				if room == rm_Overlook_Level4{
					audio_resume_sound(sndOverlookTheme1);
				}
				if room == rm_Labyrinth_Level{
					audio_resume_sound(sndLabyrinthTheme);
				}
				if room == rm_Casino_Level1{
					audio_resume_sound(sndCasinoTheme);
				}
				if room == rm_Graveyard_Level{
					audio_resume_sound(sndGraveyardTheme);
				}
				if room == rm_Island_Level1{
					audio_resume_sound(sndIslandTheme);
				}
				if room == rm_WaterStation_Level1{
					audio_resume_sound(sndWaterStationTheme1);
				}
				if room == rm_CityBlock_Level1{
					audio_resume_sound(sndCityBlockTheme);
				}
				if room == rm_Yard_Level1{
					audio_resume_sound(sndYardTheme);
				}
				if room == rm_Museum_Level1{
					audio_resume_sound(sndMuseumTheme);
				}else{
					audio_resume_sound(sndTestLevelTheme);
				}
#endregion
*/
				//First, stop all level music so that no duplicate instances remain.
				audio_stop_sound(sndHouseTheme1);
				audio_stop_sound(sndFacilityTheme1);
				audio_stop_sound(sndTempleTheme1);
				audio_stop_sound(sndOverlookTheme1);
				audio_stop_sound(sndLabyrinthTheme);
				audio_stop_sound(sndCasinoTheme);
				audio_stop_sound(sndGraveyardTheme);
				audio_stop_sound(sndIslandTheme);
				audio_stop_sound(sndWaterStationTheme1);
				audio_stop_sound(sndCityBlockTheme);
				audio_stop_sound(sndYardTheme);
				audio_stop_sound(sndMuseumTheme);
				audio_stop_sound(sndSupermarketTheme);
				audio_stop_sound(sndSubwayStationTheme);
				audio_stop_sound(sndGasStationTheme);
				audio_stop_sound(sndCathedralTheme);
				//audio_stop_sound(sndGasStationTheme);
				//audio_stop_sound(sndGasStationTheme);
				//audio_stop_sound(sndGasStationTheme);
				audio_stop_sound(sndTestLevelTheme);
				audio_stop_sound(sndTutorialTheme);

				//Now, start the appropriate music based on the current room.
				if(room == rm_House_Level1) {
				    audio_play_sound(sndHouseTheme1, 8, true);
				}else if(room == rm_Facility_Level) {
				    audio_play_sound(sndFacilityTheme1, 8, true);
				}else if(room == rm_Temple_Level1) {
				    audio_play_sound(sndTempleTheme1, 8, true);
				}else if(room == rm_Overlook_Level4) {
				    audio_play_sound(sndOverlookTheme1, 8, true);
				}else if(room == rm_Labyrinth_Level) {
				    audio_play_sound(sndLabyrinthTheme, 8, true);
				}else if(room == rm_Casino_Level1) {
				    audio_play_sound(sndCasinoTheme, 8, true);
				}else if(room == rm_Graveyard_Level) {
				    audio_play_sound(sndGraveyardTheme, 8, true);
				}else if(room == rm_Island_Level1) {
				    audio_play_sound(sndIslandTheme, 8, true);
				}else if(room == rm_WaterStation_Level1) {
				    audio_play_sound(sndWaterStationTheme1, 8, true);
				}else if(room == rm_CityBlock_Level1) {
				    audio_play_sound(sndCityBlockTheme, 8, true);
				}else if(room == rm_Yard_Level1) {
				    audio_play_sound(sndYardTheme, 8, true);
				}else if(room == rm_Museum_Level1) {
				    audio_play_sound(sndMuseumTheme, 8, true);
				}else if(room == rm_Supermarket_Level) {
				    audio_play_sound(sndSupermarketTheme, 8, true);
				}else if(room == rm_Subway_Station_Level) {
				    audio_play_sound(sndSubwayStationTheme, 8, true);
				}else if(room == rm_Gas_Station_Level) {
				    audio_play_sound(sndGasStationTheme, 8, true);
				}else if(room == rm_Cathedral_Level) {
				    audio_play_sound(sndCathedralTheme, 8, true);
				}
				//else if(room == rm_Gas_Station_Level) {
				//    audio_play_sound(sndGasStationTheme, 8, true);
				//}
				//else if(room == rm_Gas_Station_Level) {
				//    audio_play_sound(sndGasStationTheme, 8, true);
				//}
				//else if(room == rm_Gas_Station_Level) {
				//    audio_play_sound(sndGasStationTheme, 8, true);
				//}
				else if(room == rm_Tutorial_Level) {
				    audio_play_sound(sndTutorialTheme, 8, true);
				}else {
				    audio_play_sound(sndTestLevelTheme, 8, true);
				}

					oSFX.beepSnd = true;
					instance_destroy(oPauseMenu2);
					break;
				//Settings
				case 1:
					menu_level = 1;
					break;
				//Quit Game
				case 2:
					global.dialog_active = false;
					if(instance_exists(oHUD2)) {//Reset HUD safely(only if exists)
						oHUD2.playerScore = 500;
						oHUD2.playerTotalScore = 500;
					}

					instance_deactivate_object(oPlayer);
					//TransitionStart(rm_Title_Screen, sqFadeOut, sqFadeIn);
					clear_weapons();
					array_resize(global.PlayerAmmo, 1);
					array_resize(global.PlayerWeapons, 1);
					
					//Stop all level music
					audio_stop_all();

					//Transition safely back to the title screen
					TransitionStart(rm_Title_Screen, sqFadeOut, sqFadeIn);

					//global.PlayerAmmo = [];//Completely reset the ammo array.
					break;
			}
			break;
		//Settings
		case 1:
			switch(pos)
			{
				//Music
				case 0:
					//option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
					option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0);
					break;
				//Sound
				case 1:
					//option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
					option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0);
					break;
				//Controls
				case 2:
					//Controller option
					if(oControllerIndicator.controller_count != 0) {//only allow toggle if unlocked
						if global.controllerMode == 0{
							option[1, 2] = "Controls: Controller";
							global.controllerMode = 1;
						}else{
							option[1, 2] = "Controls: Keyboard";
							global.controllerMode = 0;
						}
					}
					break;
				//Back
				case 3:
					menu_level = 0;
					break;
			}
			break;
	}
	//Set position back
	if _sml != menu_level{
		pos = 0;
	}
	//Correct option length
	op_length = array_length(option[menu_level]);
}