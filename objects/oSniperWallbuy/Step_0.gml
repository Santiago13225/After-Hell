///oSniperWallbuy Step Event
/*This object represents the sniper wallbuy object.*/
//This event is responsible for handling sniper wallbuy behavior.
if distance_to_object(oPlayer) < 32 {
	image_blend = c_yellow;
	if !audio_is_playing(sndSniper1500){
		audio_play_sound(sndSniper1500, 10, false);
	}
	if created == false{
		create_textbox(text_id);
		created = true;
	}
} else{
	image_blend = c_white;
	created = false;
}