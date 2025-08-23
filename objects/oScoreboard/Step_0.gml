///oScoreboard Step Event
//This object represents a scoreboard screen.
//This event is responsible for setting some variables for the scoreboard screen.

//If the player is gone, kill ourselves
if(!instance_exists(oPlayer)) {
    instance_destroy();//no player → no need for scoreboard overlay
    exit;
}

//Screen Pause
if screen_pause(){
	exit;
}
//Fade out
//alpha -= alphaSpd;
//if alpha <= 0{
//	instance_destroy();
//}

//Advance our timer
//time += pulseSpd;

//Compute alpha = (sin wave + 1)/2 scaled by pulseAmt
//alpha = ((sin(time) + 1) / 2) * pulseAmt;