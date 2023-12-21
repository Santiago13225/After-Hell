///oAssaultWallbuy Step Event
/*This object represents the assault wallbuy object.*/
//This event is responsible for handling assault wallbuy behavior.
if distance_to_object(oPlayer) < 32{
	image_blend = c_yellow;
	if !audio_is_playing(sndAR1800){
		audio_play_sound(sndAR1800, 10, false);
	}	
	if created == false{
		create_textbox(text_id);
		created = true;
	}
} else{
	image_blend = c_white;
	created = false;
}