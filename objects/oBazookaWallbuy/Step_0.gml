///oBazookaWallbuy Step Event
/*This object represents the bazooka wallbuy object.*/
//This event is responsible for handling bazooka wallbuy behavior.
if distance_to_object(oPlayer) < 32 {
	image_blend = c_yellow;
	if !audio_is_playing(sndBazooka18000){
		audio_play_sound(sndBazooka18000, 10, false);
	}
	if created == false{
		create_textbox(text_id);
		created = true;
	}
} else{
	image_blend = c_white;
	created = false;
}