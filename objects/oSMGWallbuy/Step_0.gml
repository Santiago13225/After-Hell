///oSMGWallbuy Step Event
/*This object represents the smg wallbuy object.*/
//This event is responsible for handling smg wallbuy behavior.
if distance_to_object(oPlayer) < 32 {
	image_blend = c_yellow;
	if !audio_is_playing(sndSMG1500){
		audio_play_sound(sndSMG1500, 10, false);
	}
	if created == false{
		create_textbox(text_id);
		created = true;
	}
} else{
	image_blend = c_white;
	created = false;
}