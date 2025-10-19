///oIntroTM2 Create Event
/*This object represents an introTM2 object.*/
//This event is responsible for setting some variables for the introTM2 object.
xpos = 3200;
a = 1;
fadeout = 0;

str = "";
print = "";

l = 0;
next = 0;

holdspace = 0;

global.dialog_active = true;//Disable silhouette drawing.
//else if (room == rm_TM1){
	//sndUniversal = sndTestLevelTheme;
audio_play_sound(sndAmbient, 8, true);
	//audio_play_sound(sndUniversal, 8, true);
//}

strings[0] = "- Island -\nTrapped on a forsaken island, you must endure the horrors that rise with each passing wave.";
//strings[1] = "Narrator:\nA grand, isolated structure, shrouded in a haunting history of madness and despair.";
skipTimer = 30 * 60;//30 seconds