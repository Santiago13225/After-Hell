///oWaveStartScreen Step Event
/*This object represents a wave start screen object.*/
//This event is responsible for handling wave start screen object behavior.

//Screen Pause
if screen_pause(){
	exit;
}
//Fade out
alpha -= alphaSpd;
if alpha <= 0{
	instance_destroy();
}