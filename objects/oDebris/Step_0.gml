///oDebris Step Event
/*This object represents debris.*/
//This event is responsible for setting debris behavior.
if distance_to_object(oPlayer) < 32{//If distance to player is less than 32.
	image_blend = c_yellow;//Turn the object yellow.
	if !audio_is_playing(sndDebris500){//If announcement audio hasn't played... 
		audio_play_sound(sndDebris500, 10, false);//Play the announcement.
	}
	if created == false{//If created is false...
		create_textbox(text_id);//Create a textbox.
		created = true;//Set created to true.
	}
} else{//Otherwise...
	image_blend = c_white;//Set the object back to its natural color.
	created = false;//Set created to false.
}