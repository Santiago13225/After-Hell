///oIntroTM2 Create Event
/*This object represents an introTM2 object.*/
//This event is responsible for setting some variables for the introTM2 object.
xpos = 2240;
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

strings[0] = "- City Block -\nOnce full of life, now eerily still. The streets echo with chaos freshly unleashed.";
//strings[0] = "- The Yard -\nBehind the loading dock doors, a once-quiet refuge becomes a battleground against the advancing undead.";
//strings[1] = "- The Yard\nA grand, isolated structure, shrouded in a haunting history of madness and despair.";
skipTimer = 30 * 60;//30 seconds