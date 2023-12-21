///oMedkitWallbuy Step Event
/*This object represents the medkit wallbuy object.*/
//This event is responsible for handling medkit wallbuy behavior.
if distance_to_object(oPlayer) < 32 {
	image_blend = c_yellow;
	if !audio_is_playing(sndMedkit500){
		audio_play_sound(sndMedkit500, 10, false);
	}
	if created == false{
		create_textbox(text_id);
		created = true;
	}
} else{
	image_blend = c_white;
	created = false;
	//instance_destroy();
}