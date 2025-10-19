///oIntroTM2 Create Event
/*This object represents an introTM2 object.*/
//This event is responsible for setting some variables for the introTM2 object.
xpos = 1280;
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

strings[0] = "- Museum -\nRelics of the past line the halls, yet something unseen moves among them. History breathes again.";
//strings[0] = "- Water Station -\nDefend a crucial water station against waves of zombies. Water is life, and so is survival.";
//strings[1] = "- Water Station -\nA grand, isolated structure, shrouded in a haunting history of madness and despair.";
skipTimer = 30 * 60;//30 seconds