///oHitScreen Step Event
/*This object represents a hit screen.*/
//This event is responsible for handling hit screen behavior.

//Screen Pause
if screen_pause(){
	exit;
}
//Fade out
alpha -= alphaSpd;
if alpha <= 0{
	instance_destroy();
}