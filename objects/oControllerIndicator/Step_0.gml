//Count connected controllers each step
var count = 0;

for(var i = 0; i < 4; i++) { 
	if(gamepad_is_connected(i)) {
		count++;
	}
}
//controller_count = count;

//Detect changes
if(count > prev_controller_count) {
	//A controller was added
	if(prev_controller_count == 0) {
		//First ever controller connected
		audio_play_sound(sndConnect, 10, false);
		//audio_play_sound(sndFirstConnect, 10, false);
	}else {
		//Additional controllers
		audio_play_sound(sndConnect, 10, false);
	}
}
else if(count < prev_controller_count) {
	//A controller was removed
	audio_play_sound(sndDisconnect, 10, false);
}

//Update counts
prev_controller_count = controller_count;
controller_count = count;