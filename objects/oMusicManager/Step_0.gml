var _finalVol = global.mscVolume * global.masterVolume;

if(songAsset != targetSongAsset){
	
	//tell the old song to fade out
	if(audio_is_playing(songInstance)){
		//add our songInstance to our array of songs to fade out
		array_push(fadeOutInstances, songInstance);
		//add the songInstance's starting volume (so there's no abrupt change in volume) 
		array_push(fadeOutInstVol, fadeInInstVol);
		//add the fadeOutInstances' fade out frames
		array_push(fadeOutInstTime, endFadeOutTime);
		
		//reset the songInstance and songAsset variables
		songInstance = noone;
		songAsset = noone;
	}
	
	//play the song, if the old song has faded out
	if(array_length(fadeOutInstances) == 0){
		if(audio_exists(targetSongAsset)){
			//play the song and store its instance in a variable
			songInstance = audio_play_sound(targetSongAsset, 4, true);
	
			//start the song's volume at 0
			audio_sound_gain(songInstance, 0, 0);
			fadeInInstVol = 0;
		}
	
		//set the songAsset to match the targetSongAsset
		songAsset = targetSongAsset;
	}
}

//Volume Control
//Main song volume
if(audio_is_playing(songInstance)){
	//fade the song in
	if(startFadeInTime > 0){
		if(fadeInInstVol < 1){
			fadeInInstVol += 1/startFadeInTime;
		}else{
			fadeInInstVol = 1;
		}
	}//immediately start the song if the fade in time is 0 frames
	else{
		fadeInInstVol = 1;
	}
	
	//actually set the gain
	audio_sound_gain(songInstance, fadeInInstVol * _finalVol, 0);
}

//fading songs out
for(var i = 0; i < array_length(fadeOutInstances); i++){
	//fade the volume
	if(fadeOutInstTime[i] > 0){
		if(fadeOutInstVol[i] > 0){
			fadeOutInstVol[i] -= 1/fadeOutInstTime[i];
		}
	}
	//Immediately cut volume to 0 otherwise
	else{
		fadeOutInstVol[i] = 0;
	}
	
	//Actually set the gain
	audio_sound_gain(fadeOutInstances[i], fadeOutInstVol[i] * _finalVol, 0);
	
	//stop the song when its volume is at 0 and remove it from ALL arrays
	if(fadeOutInstVol[i] <= 0){
		//stop the song
		if(audio_is_playing(fadeOutInstances[i])){
			audio_stop_sound(fadeOutInstances[i]);
		}
		//remove it from the arrays
		array_delete(fadeOutInstances, i, 1);
		array_delete(fadeOutInstVol, i, 1);
		array_delete(fadeOutInstTime, i, 1);
		//set the loop back 1 since we just deleted an entry
		i--;
	}
	
}