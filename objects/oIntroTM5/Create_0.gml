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

//else if (room == rm_TM1){
	//sndUniversal = sndTestLevelTheme;
audio_play_sound(sndAmbient, 8, true);
	//audio_play_sound(sndUniversal, 8, true);
//}

strings[0] = "- Island -\nStranded on a mysterious island, you must fend off relentless waves of zombies to escape its perilous shores.";
//strings[1] = "Narrator:\nA grand, isolated structure, shrouded in a haunting history of madness and despair.";