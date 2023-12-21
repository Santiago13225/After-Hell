///oHealEffect Step Event
/*This object represents a heal effect.*/
//This event is responsible for handling heal effect behavior.

//Screen Pause
if screen_pause(){
	exit;
}
//Fade out
alpha -= alphaSpd;
if alpha <= 0{
	instance_destroy();
}