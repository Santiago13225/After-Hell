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

//else if (room == rm_TM1){
	//sndUniversal = sndTestLevelTheme;
audio_play_sound(sndAmbient, 8, true);
	//audio_play_sound(sndUniversal, 8, true);
//}

strings[0] = "- Temple -\nZombies advance on these jungle ruins. Something lurks in the darkness.";
//strings[1] = "- Temple -\nThey stumble upon an ancient temple, hidden from the world for centuries.";