///oTitleMenu Step Event
/*This object represents the title menu object.*/
//This event is responsible for handling title menu object behavior.

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
	
	/*// --- Analog stick support ---
	var deadzone = 0.5;//tweak as needed (0.3–0.5 works well) - how far the stick must be pushed to count
	var delay = 15;//steps before allowing another input - lower values make it more responsive, higher values slow it down to act like a button

	//Initialize stick_delay if it doesn't exist
	if(!variable_instance_exists(id, "stick_delay")) {
		stick_delay = 0;
	}

	var lx = gamepad_axis_value(_gamePad, gp_axislh);//left stick X
	var ly = gamepad_axis_value(_gamePad, gp_axislv);//left stick Y
	
	//Reduce delay each step
	if(stick_delay > 0) stick_delay--;

	//treat stick as a "press" when it crosses threshold
	if(stick_delay <= 0) {
		if(ly < -deadzone) {
			up_key = true;
			audio_play_sound(sndClick, 10, false);
			stick_delay = delay;
		}else if(ly > deadzone) {
			down_key = true;
			audio_play_sound(sndClick, 10, false);
			stick_delay = delay;
		}

		if(lx < -deadzone) {
			left_key = true;
			audio_play_sound(sndClick, 10, false);
			stick_delay = delay;
		}else if(lx > deadzone) {
			right_key = true;
			audio_play_sound(sndClick, 10, false);
			stick_delay = delay;
		}
	}*/
	
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
if(menu_level == 6 && pos == 0)//Check if in the Settings menu and the first option (music)
{
    if(left_key){
        global.musicvolume = max(0, global.musicvolume - 0.1);//Reduce volume by 10%
		//option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
		option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0);
    }
    else if(right_key){
        global.musicvolume = min(1, global.musicvolume + 0.1);//Increase volume by 10%
		//option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
		option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0);
    }
}
//Adjust sound effects volume
if(menu_level == 6 && pos == 1)//Check if in the Settings menu and the second option (sfx)
{
    if(left_key){
        global.sfxvolume = max(0, global.sfxvolume - 0.1);//Reduce volume by 10%
		//option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
		option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0);
    }
    else if(right_key){
        global.sfxvolume = min(1, global.sfxvolume + 0.1);//Increase volume by 10%
		//option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
		option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0);
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

if(menu_level == 6) {
    if(oControllerIndicator.controller_count == 0) {
        //Lock to Keyboard
        global.controllerMode = 0;
        option[6, 2] = "Controls: Keyboard";
    }else {
        //Unlock - keep the toggleable text
        if(global.controllerMode == 0) {
            option[6, 2] = "Controls: Keyboard";
        }else {
            option[6, 2] = "Controls: Controller";
        }
    }
}

//Using the options
if accept_key{
	var _sml = menu_level;
	
	switch(menu_level)
	{
		//Main Menu
		case 0:
			switch(pos)
			{
				//Story Mode
				case 0:
					//global.matchPresetIndex = 0;
					global.perkIndex = 0;
					global.firerate = false;
					global.energyshield = false;
					global.juggernaut = false;
					global.speed = false;
					global.luck = false;
					global.flakjacket = false;
					global.instakill = false;
					global.badluck = false;
					global.lowspeed = false;
					global.weakness = false;
					global.nomedkit = false;
					global.slowfirerate = false;
					oHUD2.playerTotalScore = 500;
					global.screenShake = true;
					//TransitionStart(rm_Mission0, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Tutorial_Level, sqFadeOut, sqFadeIn);
					TransitionStart(rm_TM0_2, sqFadeOut, sqFadeIn);
					//menu_level = 1;
					break;
				//Survival Mode
				case 1:
					//menu_level = 2;
					//Instead of switching menu pages, destroy the title menu
					//and create the carousel menu object.
					instance_destroy();  
					//instance_create_layer(0, 0, "Instances", oCarouselMenu);
					instance_create_layer(0, 0, "Instances", oSettingsCarouselMenu);
					break;
				//Multiplayer Mode
				case 2:
					menu_level = 7;
					break;
				//Settings
				case 3:
					menu_level = 6;
					break;
				//Reset Game	
				case 4:
					//game_end();
					//draw_set_font(global.font);
					draw_text(16, 16, "Restarting game...");
					game_restart();
					break;
			}
			break;

		//Story
		case 1:
			switch(pos)
			{
				//Tutorial
				case 0:
					TransitionStart(rm_Mission0, sqFadeOut, sqFadeIn);
					break;
				//Test Mission 1
				case 1:
					TransitionStart(rm_TM1, sqFadeOut, sqFadeIn);
					break;
				//Test Mission 2
				case 2:
					TransitionStart(rm_TM2, sqFadeOut, sqFadeIn);
					break;
				//Back
				case 3:
					menu_level = 0;
					break;
			}
			break;

		//Levels
		case 2:
			switch(pos)
			{
				//House
				case 0:
					TransitionStart(rm_TM1, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_House_Level1, sqFadeOut, sqFadeIn);
					break;
				//Facility
				case 1:
					TransitionStart(rm_TM2, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Facility_Level, sqFadeOut, sqFadeIn);
					break;
				//Temple
				case 2:
					TransitionStart(rm_TM3, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Temple_Level1, sqFadeOut, sqFadeIn);
					break;
				//Overlook
				case 3:
					TransitionStart(rm_TM4, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Overlook_Level1, sqFadeOut, sqFadeIn);
					break;
				//Next Page
				case 4:
					menu_level = 3;
					break;
				case 5:
					menu_level = 0;
					break;
			}
			break;
	
		case 3:
			switch(pos)
			{
				//Island
				case 0:
					TransitionStart(rm_TM5, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Island_Level1, sqFadeOut, sqFadeIn);
					break;
				//Casino
				case 1:
					TransitionStart(rm_TM6, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Casino_Level1, sqFadeOut, sqFadeIn);
					break;
				//Labyrinth
				case 2:
					TransitionStart(rm_TM7, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Labyrinth_Level, sqFadeOut, sqFadeIn);
					break;
				//Graveyard
				case 3:
					TransitionStart(rm_TM8, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Graveyard_Level, sqFadeOut, sqFadeIn);
					break;
				//Next Page
				case 4:
					menu_level = 4;
					break;
				//Back
				case 5:
					menu_level = 2;
					break;
				case 6:
					menu_level = 0;
					break;
			}
			break;
	
		case 4:
			switch(pos)
			{
				//Museum
				case 0:
					TransitionStart(rm_TM9, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Museum_Level1, sqFadeOut, sqFadeIn);
					break;
				//Water Station
				case 1:
					TransitionStart(rm_TM10, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_WaterStation_Level1, sqFadeOut, sqFadeIn);
					break;
				//City Block
				case 2:
					TransitionStart(rm_TM11, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_CityBlock_Level1, sqFadeOut, sqFadeIn);
					break;
				//Yard
				case 3:
					TransitionStart(rm_TM12, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Yard_Level1, sqFadeOut, sqFadeIn);
					break;
				//Next Page
				case 4:
					menu_level = 5;
					break;
				//Previous Page
				case 5:
					menu_level = 3;
					break;
				//Main Menu
				case 6:
					menu_level = 0;
					break;
			}
			break;
			
		case 5:
			switch(pos)
			{
				//Test Level
				case 0:
					TransitionStart(rm_TM20, sqFadeOut, sqFadeIn);
					//TransitionStart(rm_Level1, sqFadeOut, sqFadeIn);
					break;
				//Previous Page
				case 1:
					menu_level = 4;
					break;
				//Main Menu
				case 2:
					menu_level = 0;
					break;
			}
			break;
	
		//Settings
		case 6:
			switch(pos)
			{
				//Music
				case 0:
					//Update the displayed volume percentage
					//option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
					option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0);
					break;
				//Sound Effects
				case 1:
					//Update the displayed volume percentage
					//option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
					option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0);
					break;
				//Controls
				case 2:
					//Controller option
					if(oControllerIndicator.controller_count != 0) {//only allow toggle if unlocked
						if global.controllerMode == 0{
							option[6, 2] = "Controls: Controller";
							global.controllerMode = 1;
						}else{
							option[6, 2] = "Controls: Keyboard";
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
			
		//Extras
		case 7:
			switch(pos)
			{
				//YouTube
				case 0:
					url_open("https://youtube.com/@centillioneons4223?si=NdM79kEtwOOrm_ma");
					break;
				//Discord
				case 1:
					url_open("https://discord.gg/M7KNv2xtGq");
					break;
				//Peyton Burnham
				case 2:
					url_open("https://youtube.com/@peytonburnham4316?si=p9hPxJ4nZXdwINIe");
					break;
				//Vorpal Lance Music
				case 3:
					url_open("https://youtube.com/@VorpalLanceMusic?si=eE-hTWMeYtK5lDDr");
					break;
				//Chris Jay
				case 4:
					url_open("https://soundbetter.com/profiles/386761-chris-jay");
					break;
				//Main Menu
				case 5:
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