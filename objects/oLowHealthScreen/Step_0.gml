///oLowHealthScreen Create Event
/*This object represents a low health screen.*/
//This event is responsible for setting some variables for the low health screen.

//Screen Pause
if screen_pause(){
	exit;
}
//Fade out
alpha -= alphaSpd;
if alpha <= 0{
	instance_destroy();
}