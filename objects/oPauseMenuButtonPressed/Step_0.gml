///oPauseMenuButtonPressed Step Event
/*This object represents a pause menu button press.*/
//This event is responsible for handling pause menu button press behavior.

//Menu Sound Effect
if instance_exists(oPauseMenu2){
	if keyboard_check_pressed(vk_up) == true{
		audio_play_sound(sndClick, 10, false);	
	}
	if keyboard_check_pressed(vk_down) == true{
		audio_play_sound(sndClick, 10, false);	
	}
	if keyboard_check_pressed(vk_space) == true{
		oSFX.beepSnd = true;
		//audio_play_sound(sndBeep, 10, false);	
	}
}