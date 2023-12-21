/// @description Insert description here

if(audio_group_is_loaded(agMusic)){
	if room == rm_title_screen{
		audio_play_sound(sndMenuTheme, 8, true);//Plays music in the title screen.
	}
}