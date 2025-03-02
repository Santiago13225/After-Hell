///oMenuButtonPressed Step Event
/*This object represents a menu button pressed object.*/
//This event is responsible for setting some variables for the menu button pressed object.

//Menu Sound Effect
/*
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
}*/
//Menu Sound Effect
if (keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu)){
    audio_play_sound(sndClick, 10, false);
}

if (keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd)){
    audio_play_sound(sndClick, 10, false);
}

if (keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl)){
    audio_play_sound(sndClick, 10, false);
}

if (keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr)){
    audio_play_sound(sndClick, 10, false);
}

if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)){
    audio_play_sound(sndBeep, 10, false);
}

if (keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(0, gp_face1)){
    audio_play_sound(sndBeep, 10, false);
}