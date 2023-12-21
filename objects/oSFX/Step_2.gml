///oSFX End Step Event
/*This object represents a SFX object.*/
//This event is responsible for handling the SFX object end step behavior.

//Get the volume
var _sfxVol = global.SFX_VOL * global.MASTER_VOL;

//Pickup sound
if pickupSnd == true{
	var _snd = audio_play_sound(sndPickup, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 1000);

	pickupSnd = false;//Reset the pickup variable.
}

//Beep sound
if beepSnd == true{
	var _snd = audio_play_sound(sndBeep, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 1000);
	
	beepSnd = false;//Reset the pickup variable.
}

//Win sound
if winSnd == true{
	var _snd = audio_play_sound(sndVictory, 8, false);//Play sound.
	audio_sound_gain(_snd, _sfxVol, 1000);
	
	winSnd = false;//Reset the pickup variable.
}

//win sound
/*
if htSnd == true
{
	//play sound
	var _snd = audio_play_sound(global.MUSIC, 8, false);
	audio_sound_gain(_snd, _sfxVol, 1000);
	
	//reset variable
	htSnd = false;
}*/

//Looping SFX example
//House
//Turn sound effect on and store the instance of the sound
if houseSndLoop == true && !audio_is_playing(houseSndLoopInst){
	houseSndLoopInst = audio_play_sound(sndHouseTheme1, 8, true);
}

//Turn sound effect off
if houseSndLoop == false && audio_is_playing(houseSndLoopInst){
	audio_stop_sound(houseSndLoopInst);
}
houseSndLoop = false;
//oSFX.houseSndloop = true;

//See 34:36 of sound video on YouTube!

//Island
if beachSndLoop == true{//Start the loop and turn up the volume
	if !audio_is_playing(beachSndLoopInst){//Play the sound
		beachSndLoopInst = audio_play_sound(sndWind, 6, true);
	}
	if beachSndLoopVol < 1{//Raise the volume
		beachSndLoopVol += beachSndLoopVolSpd;
	} else{
		beachSndLoopVol = 1;
	}
}
	if beachSndLoop == false{//Fade out and turn off
		if beachSndLoopVol > 0 {//Lower the volume
			beachSndLoopVol -= beachSndLoopVolSpd;
		}else{
			beachSndLoopVol = 0;
		}
		if beachSndLoopVol <= 0 {//Stop the sound if the gain is 0
			audio_stop_sound(beachSndLoopInst);
		}
	}
	if audio_is_playing(beachSndLoopInst){//Set the volume
		audio_sound_gain(beachSndLoopInst, beachSndLoopVol * _sfxVol, 0);
	}
	beachSndLoop = false;//Reset variable
	
//Temple
if templeSndLoop == true{//Start the loop and turn up the volume
	if !audio_is_playing(templeSndLoopInst){//Play the sound
		templeSndLoopInst = audio_play_sound(sndTempleAmbience, 6, true);
	}
	if templeSndLoopVol < 1{//Raise the volume
		templeSndLoopVol += templeSndLoopVolSpd;
	} else{
		templeSndLoopVol = 1;
	}
}
	if templeSndLoop == false{//Fade out and turn off
		if templeSndLoopVol > 0 {//Lower the volume
			templeSndLoopVol -= templeSndLoopVolSpd;
		}else{
			templeSndLoopVol = 0;
		}
		if templeSndLoopVol <= 0 {//Stop the sound if the gain is 0
			audio_stop_sound(templeSndLoopInst);
		}
	}
	if audio_is_playing(templeSndLoopInst){//Set the volume
		audio_sound_gain(templeSndLoopInst, templeSndLoopVol * _sfxVol, 0);
	}
	templeSndLoop = false;//Reset variable
	
//Casino
if casinoSndLoop == true{//Start the loop and turn up the volume
	if !audio_is_playing(casinoSndLoopInst){//Play the sound
		casinoSndLoopInst = audio_play_sound(sndSlotMachine, 6, true);
	}
	if casinoSndLoopVol < 1{//Raise the volume
		casinoSndLoopVol += casinoSndLoopVolSpd;
	} else{
		casinoSndLoopVol = 1;
	}
}
	if casinoSndLoop == false{//Fade out and turn off
		if casinoSndLoopVol > 0 {//Lower the volume
			casinoSndLoopVol -= casinoSndLoopVolSpd;
		}else{
			casinoSndLoopVol = 0;
		}
		if casinoSndLoopVol <= 0 {//Stop the sound if the gain is 0
			audio_stop_sound(casinoSndLoopInst);
		}
	}
	if audio_is_playing(casinoSndLoopInst){//Set the volume
		audio_sound_gain(casinoSndLoopInst, casinoSndLoopVol * _sfxVol, 0);
	}
	casinoSndLoop = false;//Reset variable