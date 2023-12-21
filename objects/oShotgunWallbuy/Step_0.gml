///oShotgunWallbuy Step Event
/*This object represents the shotgun wallbuy object.*/
//This event is responsible for handling shotgun wallbuy behavior.
if distance_to_object(oPlayer) < 32 {
	image_blend = c_yellow;
	if !audio_is_playing(sndShotgun500){
		audio_play_sound(sndShotgun500, 10, false);
	}
	if created == false{
		create_textbox(text_id);
		created = true;
	}
} else{
	image_blend = c_white;
	created = false;
}