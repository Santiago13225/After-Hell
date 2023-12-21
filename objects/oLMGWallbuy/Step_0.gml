///oLMGWallbuy Step Event
/*This object represents the lmg wallbuy object.*/
//This event is responsible for handling lmg wallbuy behavior.
if distance_to_object(oPlayer) < 32 {
	image_blend = c_yellow;
	if !audio_is_playing(sndLMG2500){
		audio_play_sound(sndLMG2500, 10, false);
	}
	if created == false{
		create_textbox(text_id);
		created = true;
	}
} else{
	image_blend = c_white;
	created = false;
}