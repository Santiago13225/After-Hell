//get inputs
up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
accept_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move through the menu
pos += down_key - up_key;
if(pos >= op_length){
	pos = 0;
}
if(pos < 0){
	pos = op_length - 1;
}

//use the options
if (accept_key){
	var _sml = menu_level;

	switch(menu_level){
		
		//menu
		case 0:
		switch(pos){
			//start game
			case 0:
				audio_play_sound(sndBeep, 10, false);//Play sound effect.
				//room_goto(rm_Main);
				//TransitionStart(rm_Title_Screen, sqFadeOut, sqFadeIn);
				TransitionStart(rm_Disclaimer_Screen, sqFadeOut, sqFadeIn);
				break;
		}
		break;
	}
	
	//set position back
	if (_sml != menu_level){
		pos = 0;
	}
	
	//correct option length
	op_length = array_length(option[menu_level]);
}
