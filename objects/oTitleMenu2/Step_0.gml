///oTitleMenu Step Event
/*This object represents the title menu object.*/
//This event is responsible for handling title menu object behavior.

//Get inputs
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
back_key = keyboard_check_pressed(vk_backspace);

// --- TRACK PERK 1 CHANGES AND RESET PERK 2 ---
if(!variable_instance_exists(id, "perk_index_prev")) perk_index_prev = perk_index;

if(perk_index != perk_index_prev) {
	perk_index2 = 0;//always reset Perk 2 to None
	option[3,1] = "  Mod 2: " + perk_names[perk_index2] + "  ";//update text
	perk_index_prev = perk_index;//store new Perk 1 value
}

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
	back_key |= gamepad_button_check_pressed(_gamePad, gp_face2);// B / Circle
	
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

arrowLeftAnim = max(arrowLeftAnim - 0.05, 0);
arrowRightAnim = max(arrowRightAnim - 0.05, 0);

arrowLeftAnim2 = max(arrowLeftAnim2 - 0.05, 0);
arrowRightAnim2 = max(arrowRightAnim2 - 0.05, 0);

//Adjust music volume
if(menu_level == 6 && pos == 0)//Check if in the Settings menu and the first option (music)
{
    if(left_key){
        global.musicvolume = max(0, global.musicvolume - 0.1);//Reduce volume by 10%
		//option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
		option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
    }
    else if(right_key){
        global.musicvolume = min(1, global.musicvolume + 0.1);//Increase volume by 10%
		//option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
		option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
    }
}
//Adjust sound effects volume
if(menu_level == 6 && pos == 1){//Check if in the Settings menu and the second option (sfx)
    if(left_key){
        global.sfxvolume = max(0, global.sfxvolume - 0.1);//Reduce volume by 10%
		//option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
		option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
    }
    else if(right_key){
        global.sfxvolume = min(1, global.sfxvolume + 0.1);//Increase volume by 10%
		//option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
		option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
    }
}

//Detect entering main menu
if(!variable_instance_exists(id, "prev_menu_level")) {
    prev_menu_level = menu_level;
}

if(menu_level == 0 && prev_menu_level != 0) {
	//We just ENTERED the main menu, so reset everything
	//Reset preset
	global.matchPresetIndex = 0;
	preset_index = 0;
	option[2,0] = "  Mode: " + preset_names[preset_index] + "  ";
	//Reset perk 1
	global.perkIndex = 0;
	perk_index = 0;
	option[3,0] = "  Mod 1: " + perk_names[perk_index] + "  ";
	//Reset perk 2
	global.perkIndex2 = 0;
	perk_index2 = 0;
	option[3,1] = "  Mod 2: " + perk_names[perk_index2] + "  ";
}

//Update previous menu level
prev_menu_level = menu_level;

//Preset selection (Survival Mode preset page)
if(menu_level == 2 && pos == 0){
	if(left_key){
		preset_index--;
		arrowLeftAnim = 1;
		if(preset_index < 0){
			preset_index = array_length(preset_names) - 1;
		}
	}
	if(right_key){
		preset_index++;
		arrowRightAnim = 1;
		if(preset_index >= array_length(preset_names)){
			preset_index = 0;
		}
	}
	option[2,0] = "  Mode: " + preset_names[preset_index] + "  ";
}

if(menu_level == 3 && pos == 0){
	if(left_key){
		perk_index--;
		arrowLeftAnim = 1;
		if(perk_index < 0){
			perk_index = array_length(perk_names) - 1;
		}
	}
	if(right_key){
		perk_index++;
		arrowRightAnim = 1;
		if(perk_index >= array_length(perk_names)){
			perk_index = 0;
		}
	}
	option[3,0] = "  Mod 1: " + perk_names[perk_index] + "  ";
	
	/*// --- Reset Perk 2 whenever Perk 1 changes ---
	if(perk_index == 0){
		//Perk 1 is "None" -> force Perk 2 to "None"
		perk_index2 = 0;
	}else if(perk_index2 == perk_index){
		//Perk 2 is same as Perk 1 -> move it to "None"
		perk_index2 = 0;
	}
	option[3,1] = "  Perk 2: " + perk_names[perk_index2] + "  ";*/
}

if(menu_level == 3 && pos == 1){
	//Only allow changing if Perk 1 is NOT "None" or "Wild Card"
	if(perk_index != 0 && perk_index != 8){
		var dir = 0;
		if(left_key){
			dir = -1;
			arrowLeftAnim2 = 1;
		}
		if(right_key){
			dir = 1;
			arrowRightAnim2 = 1;
		}
		if(dir != 0){
			var start_index = perk_index2;
			repeat(array_length(perk_names)){
				//Move ONE step in chosen direction
				perk_index2 += dir;
				//Wrap properly
				if(perk_index2 < 0){
					perk_index2 = array_length(perk_names) - 1;
				}
				if(perk_index2 >= array_length(perk_names)){
					perk_index2 = 0;
				}
				//Skip duplicate
				if(perk_index2 == perk_index){
					continue;
				}
				//Skip incompatible
				if(array_contains(perk_incompatibility[perk_index], perk_index2)){
					continue;
				}
				//VALID perk found → stop
				break;
			}
		}

#region
		/*if(left_key){
			perk_index2--;
			arrowLeftAnim2 = 1;
			if(perk_index2 < 0){
				perk_index2 = array_length(perk_names) - 1;
			}
			//Skip Perk 1
			if(perk_index2 == perk_index){
				perk_index2--;
				if(perk_index2 < 0) perk_index2 = array_length(perk_names) - 1;
			}
		}
		if(right_key){
			perk_index2++;
			arrowRightAnim2 = 1;
			if(perk_index2 >= array_length(perk_names)){
				perk_index2 = 0;
			}
			//Skip Perk 1
			if(perk_index2 == perk_index){
				perk_index2++;
				if(perk_index2 >= array_length(perk_names)) perk_index2 = 0;
			}
		}*/
#endregion
	}else {
		//Perk 1 is "None", Perk 2 must be "None"
		perk_index2 = 0;
	}

	option[3,1] = "  Mod 2: " + perk_names[perk_index2] + "  ";
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
        option[6, 2] = "Controls: Keyboard and Mouse";
    }else {
        //Unlock - keep the toggleable text
        if(global.controllerMode == 0) {
            option[6, 2] = "Controls: Keyboard and Mouse";
        }else {
            option[6, 2] = "Controls: Controller";
        }
    }
}

if(back_key && menu_level != 0) {
	switch(menu_level) {
		case 1: menu_level = 0; break;
		case 2: menu_level = 0; break;
		case 3: menu_level = 2; break;
		case 4: menu_level = 0; break;
		case 5: menu_level = 0; break;
		case 6: menu_level = 0; break;
		case 7: menu_level = 0; break;
	}
	pos = 0;//reset cursor position
	op_length = array_length(option[menu_level]);// <-- ADD THIS LINE
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
					global.matchPresetIndex = 0;
					//preset_index = 0;
					global.perkIndex = 0;
					global.perkIndex2 = 0;
					//perk_index = 0;
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
					oHUD2.playerTotalScore = 500;
					global.screenShake = true;
					//TransitionStart(rm_Mission0_2, sqFadeOut, sqFadeIn);
					TransitionStart(rm_TM0_2, sqFadeOut, sqFadeIn);
					//menu_level = 1;
					break;
				//Survival Mode
				case 1:
					//Reset preset
					global.matchPresetIndex = 0;
					preset_index = 0;
					option[2,0] = "  Mode: " + preset_names[preset_index] + "  ";
					//Reset perk 1
					global.perkIndex = 0;
					perk_index = 0;
					option[3,0] = "  Mod 1: " + perk_names[perk_index] + "  ";
					//Reset perk 2
					global.perkIndex2 = 0;
					perk_index2 = 0;
					option[3,1] = "  Mod 2: " + perk_names[perk_index2] + "  ";
					menu_level = 2;
					//Instead of switching menu pages, destroy the title menu and create the carousel menu object.
					//instance_destroy();
					//instance_create_layer(0, 0, "Instances", oSettingsCarouselMenu);
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
					TransitionStart(rm_Mission0_2, sqFadeOut, sqFadeIn);
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

		//Presets
		case 2:
			switch(pos)
			{
				//Preset option
				case 0:
					pos = 1;
					break;
				//Next, go to perk carousel menu
				case 1:
					//Store selected preset
					global.matchPresetIndex = preset_index;
					menu_level = 3;
					//instance_destroy();
					//instance_create_layer(0, 0, "Instances", oPerkCarouselMenu);
					break;
				//Go Back to Main Menu
				case 2:
					//global.matchPresetIndex = 0;//reset preset
					menu_level = 0;
					break;
			}
			break;

		//Perks
		case 3:
			switch(pos)
			{
				//Perk option 1
				case 0:
					pos = 1;
					break;
				//Perk option 2
				case 1:
					pos = 2;
					break;
				//Next, go to map carousel menu
				case 2:
					//Store selected perks
					global.perkIndex = perk_index;
					global.perkIndex2 = perk_index2;
					
					//Apply perk effect 1(same as carousel)
					switch(global.perkIndex){
						case 0: break;
						case 1: global.firerate = true; break;
						case 2: global.energyshield = true; break;
						case 3: global.juggernaut = true; break;
						case 4: global.speed = true; break;
						case 5: global.luck = true; break;
						case 6: global.magnet = true; break;
						case 7: global.flakjacket = true; break;
						case 8:
							global.firerate = true;
							global.energyshield = true;
							global.juggernaut = true;
							global.speed = true;
							global.luck = true;
							global.magnet = true;
							global.flakjacket = true;
							break;
						case 9:
							global.instakill = true;
							global.badluck = true;
							global.lowspeed = true;
							global.slowfirerate = true;
							break;
						case 10: global.instakill = true; break;
						case 11: global.badluck = true; break;
						case 12: global.lowspeed = true; break;
						case 13: global.weakness = true; break;
						case 14: global.nomedkit = true; break;
						case 15: global.slowfirerate = true; break;
					}
					
					//Apply perk effect 2(same as carousel)
					switch(global.perkIndex2){
						case 0: break;
						case 1: global.firerate = true; break;
						case 2: global.energyshield = true; break;
						case 3: global.juggernaut = true; break;
						case 4: global.speed = true; break;
						case 5: global.luck = true; break;
						case 6: global.magnet = true; break;
						case 7: global.flakjacket = true; break;
						case 8:
							global.firerate = true;
							global.energyshield = true;
							global.juggernaut = true;
							global.speed = true;
							global.luck = true;
							global.magnet = true;
							global.flakjacket = true;
							break;
						case 9:
							global.instakill = true;
							global.badluck = true;
							global.lowspeed = true;
							global.slowfirerate = true;
							break;
						case 10: global.instakill = true; break;
						case 11: global.badluck = true; break;
						case 12: global.lowspeed = true; break;
						case 13: global.weakness = true; break;
						case 14: global.nomedkit = true; break;
						case 15: global.slowfirerate = true; break;
					}

					instance_destroy();
					instance_create_layer(0, 0, "Instances", oCarouselMenu);
					break;
				//Go Back to Preset Page
				case 3:
					menu_level = 2;
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
					option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
					break;
				//Sound Effects
				case 1:
					//Update the displayed volume percentage
					//option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
					option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
					break;
				//Controls
				case 2:
					//Controller option
					if(oControllerIndicator.controller_count != 0) {//only allow toggle if unlocked
						if global.controllerMode == 0{
							option[6, 2] = "Controls: Controller";
							global.controllerMode = 1;
						}else{
							option[6, 2] = "Controls: Keyboard and Mouse";
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