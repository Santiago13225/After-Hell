///oTextboxTopTutorial Draw Event
/*This object creates a textbox on the top of the screen that the player
can interact with in game for the tutorial.*/
//This event is responsible for handling the tutorial textbox logic.

//Define a variable to keep track of the current dialogue line

if keyboard_check_pressed(ord("L")) {
    // Destroy the instance
    instance_destroy();
}

//Check for a key press event (Spacebar)
if(keyboard_check_pressed(vk_space)) {//If the space key has been pressed.
    switch (oTextboxTopTutorial.currentDialogueLine) {//Use a switch statement or if-else to determine which dialogue line to speak.
        case 0:
			if !audio_is_playing(sndTC1){//If not the case that the audio is playing.
				audio_play_sound(sndTC1, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 1;//Increment the currentDialogueLine value.
            break;
        case 1:
            if !audio_is_playing(sndTC2){//If not the case that the audio is playing.
				audio_play_sound(sndTC2, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 2;
			break;
		case 2:
            if !audio_is_playing(sndTC3){//If not the case that the audio is playing.
				audio_play_sound(sndTC3, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 3;
			break;
		case 3:
            if !audio_is_playing(sndTC4){//If not the case that the audio is playing.
				audio_play_sound(sndTC4, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 4;
			break;
		case 4:
            if !audio_is_playing(sndTC5){//If not the case that the audio is playing.
				audio_play_sound(sndTC5, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 5;
			break;
		case 5:
            if !audio_is_playing(sndTC6){//If not the case that the audio is playing.
				audio_play_sound(sndTC6, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 6;
			break;
		case 6:
            if !audio_is_playing(sndTC7){//If not the case that the audio is playing.
				audio_play_sound(sndTC7, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 7;
			break;
		case 7:
            if !audio_is_playing(sndTC8){//If not the case that the audio is playing.
				audio_play_sound(sndTC8, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 8;
			break;
		case 8:
            if !audio_is_playing(sndTC9){//If not the case that the audio is playing.
				audio_play_sound(sndTC9, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 9;
			break;
		case 9:
            if !audio_is_playing(sndTC10){//If not the case that the audio is playing.
				audio_play_sound(sndTC10, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 10;
			break;
		case 10:
            if !audio_is_playing(sndTC11){//If not the case that the audio is playing.
				audio_play_sound(sndTC11, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 11;
			break;
		case 11:
            if !audio_is_playing(sndTC12){//If not the case that the audio is playing.
				audio_play_sound(sndTC12, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 12;
			break;
		case 12:
            if !audio_is_playing(sndTC13){//If not the case that the audio is playing.
				audio_play_sound(sndTC13, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 13;
			break;
		case 13:
            if !audio_is_playing(sndTC14){//If not the case that the audio is playing.
				audio_play_sound(sndTC14, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 14;
			break;
		case 14:
            if !audio_is_playing(sndTC15){//If not the case that the audio is playing.
				audio_play_sound(sndTC15, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 15;
			break;
		case 15:
            if !audio_is_playing(sndTC16){//If not the case that the audio is playing.
				audio_play_sound(sndTC16, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 16;
			break;
		case 16:
            if !audio_is_playing(sndTC17){//If not the case that the audio is playing.
				audio_play_sound(sndTC17, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 17;
			break;
		case 17:
            if !audio_is_playing(sndTC18){//If not the case that the audio is playing.
				audio_play_sound(sndTC18, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 18;
			break;
		case 18:
            if !audio_is_playing(sndTC19){//If not the case that the audio is playing.
				audio_play_sound(sndTC19, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 19;
			break;
		case 19:
			if !audio_is_playing(sndTC20){//If not the case that the audio is playing.
				audio_play_sound(sndTC20, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 20;
			break;
		case 20:
            if !audio_is_playing(sndTC21){//If not the case that the audio is playing.
				audio_play_sound(sndTC21, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 21;
			break;
		case 21:
            if !audio_is_playing(sndTC22){//If not the case that the audio is playing.
				audio_play_sound(sndTC22, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 22;
			break;
		case 22:
            if !audio_is_playing(sndTC23){//If not the case that the audio is playing.
				audio_play_sound(sndTC23, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 23;
			break;
		case 23:
            if !audio_is_playing(sndTC24){//If not the case that the audio is playing.
				audio_play_sound(sndTC24, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 24;
			break;
		case 24:
            if !audio_is_playing(sndTC25){//If not the case that the audio is playing.
				audio_play_sound(sndTC25, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 25;
			break;
		case 25:
            if !audio_is_playing(sndTC26){//If not the case that the audio is playing.
				audio_play_sound(sndTC26, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 26;
			break;	
		case 26:
            if !audio_is_playing(sndTC27){//If not the case that the audio is playing.
				audio_play_sound(sndTC27, 10, false);//Play the audio.
			}
			oTextboxTopTutorial.currentDialogueLine = 27;
			break;
		case 27:
            break;
        default:
            // Handle the end of dialogue or any other logic
            break;
    }
}