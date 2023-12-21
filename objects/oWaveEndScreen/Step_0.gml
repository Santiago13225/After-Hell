///oWaveEndScreen Step Event
/*This object represents a wave end screen object.*/
//This event is responsible for handling the wave end screen object behavior.

//Screen Pause
if screen_pause(){
	exit;
}
//Fade out
alpha -= alphaSpd;
if alpha <= 0{
	instance_destroy();
}