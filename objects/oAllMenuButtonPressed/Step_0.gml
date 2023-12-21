///oAllMenuButtonPressed Step Event
/*This object represents a menu button pressed object.*/
//This event is responsible for handling menu button press behavior.

//Menu Sound Effect
#region
/*
if instance_exists(oGameOverScreen)
{
	if keyboard_check_pressed(vk_up) == true
	{
		audio_play_sound(sndClick, 10, false);	
	}
	if keyboard_check_pressed(vk_down) == true
	{
		audio_play_sound(sndClick, 10, false);	
	}
	if keyboard_check_pressed(vk_space) == true
	{
		audio_play_sound(sndBeep, 10, false);	
	}
} else if instance_exists(oPauseMenu)
{
	if keyboard_check_pressed(vk_up) == true
	{
		audio_play_sound(sndClick, 10, false);	
	}
	if keyboard_check_pressed(vk_down) == true
	{
		audio_play_sound(sndClick, 10, false);	
	}
	if keyboard_check_pressed(vk_space) == true
	{
		audio_play_sound(sndBeep, 10, false);	
	}
} else if instance_exists(oVictoryScreen)
{
	if keyboard_check_pressed(vk_up) == true
	{
		audio_play_sound(sndClick, 10, false);	
	}
	if keyboard_check_pressed(vk_down) == true
	{
		audio_play_sound(sndClick, 10, false);	
	}
	if keyboard_check_pressed(vk_space) == true
	{
		audio_play_sound(sndBeep, 10, false);
	}
}*/
#endregion

if instance_exists(oGameOverScreen) || instance_exists(oPauseMenu) || instance_exists(oVictoryScreen){//If any of the menu instances exist...
    if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu)){//Check for button press.
        audio_play_sound(sndClick, 10, false);//Play sound effect.
    }
    if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)){//Check for button press.
        audio_play_sound(sndClick, 10, false);//Play sound effect.
    }
//gp_face1 represents the X button on most controllers
    if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)){//Check for button press.
		oSFX.beepSnd = true;//Play sound effect.
        //audio_play_sound(sndBeep, 10, false);//Play sound effect.
    }
}