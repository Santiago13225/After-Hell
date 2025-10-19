//global volume control
global.masterVolume = 1;
global.mscVolume = 1;

//info for the song we are currently playing / trying to play
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
//targetSongAsset = sndCasinoTheme;
endFadeOutTime = 0;//how many frames to fade out the song currently playing
startFadeInTime = 0;//how many frames to fade in the new song
fadeInInstVol = 1;//the volume of the songInstance

//for fading music out and stopping songs that are no longer playing
fadeOutInstances = array_create(0);//the audio instances to fade out
fadeOutInstVol = array_create(0);//the volumes of each individual audio instance
fadeOutInstTime = array_create(0);//how fast the fadeout should happen

