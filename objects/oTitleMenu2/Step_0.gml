///oTitleMenu Step Event
/*This object represents the title menu object.*/
//This event is responsible for handling title menu object behavior.

//Get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//Get inputs for volume control
left_key = keyboard_check_pressed(vk_left);
right_key = keyboard_check_pressed(vk_right);

//Controller inputs
var _gamePad = 0;
var is_controller_connected = gamepad_is_connected(_gamePad);

if is_controller_connected{
	up_key = gamepad_button_check_pressed(_gamePad, gp_padu) || keyboard_check_pressed(vk_up);
	down_key = gamepad_button_check_pressed(_gamePad, gp_padd) || keyboard_check_pressed(vk_down);
	left_key = gamepad_button_check_pressed(_gamePad, gp_padl) || keyboard_check_pressed(vk_left);
	right_key = gamepad_button_check_pressed(_gamePad, gp_padr) || keyboard_check_pressed(vk_right);
    
    //Convert controller button presses to accept_key
    accept_key |= gamepad_button_check_pressed(_gamePad, gp_face1) || keyboard_check_pressed(vk_space);
}

//Adjust music volume
if(menu_level == 6 && pos == 0)//Check if in the Settings menu and the first option (music)
{
    if (left_key){
        global.musicvolume = max(0, global.musicvolume - 0.1);//Reduce volume by 10%
		option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
    }
    else if (right_key){
        global.musicvolume = min(1, global.musicvolume + 0.1);//Increase volume by 10%
		option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
    }
}
//Adjust sound effects volume
if(menu_level == 6 && pos == 1)//Check if in the Settings menu and the second option (sfx)
{
    if (left_key){
        global.sfxvolume = max(0, global.sfxvolume - 0.1);//Reduce volume by 10%
		option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
    }
    else if (right_key){
        global.sfxvolume = min(1, global.sfxvolume + 0.1);//Increase volume by 10%
		option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
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
					TransitionStart(rm_Mission0, sqFadeOut, sqFadeIn);
					//menu_level = 1;
					break;
				//Survival Mode
				case 1:
					menu_level = 2;
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
					TransitionStart(rm_TM13, sqFadeOut, sqFadeIn);
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
					option[6, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
					break;
				//Sound Effects
				case 1:
					//Update the displayed volume percentage
					option[6, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
					break;
				//Controls
				case 2:
					//Controller option
					if global.controllerMode == 0{
						option[6, 2] = "Controls: Controller";
						global.controllerMode = 1;
					}else{
						option[6, 2] = "Controls: Keyboard";
						global.controllerMode = 0;
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