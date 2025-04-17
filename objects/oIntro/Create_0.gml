///oIntro Create Event
/*This object represents an intro object.*/
//This event is responsible for setting some variables for the intro object.
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

strings[0] = "- House -\nA rural house is your last hope for survival as the zombies advance.";
//strings[1] = "- House -\nThe once vibrant streets are now teeming with the undead, hungry for the living.";

skipTimer = 30 * 60;//30 seconds