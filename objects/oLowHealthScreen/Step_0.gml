///oLowHealthScreen Create Event
/*This object represents a low health screen.*/
//This event is responsible for setting some variables for the low health screen.

//If the player is gone, kill ourselves
if(!instance_exists(oPlayer)) {
    instance_destroy();//no player → no need for low‑health overlay :contentReference[oaicite:1]{index=1}
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

//If player recovered, remove effect
if(!oPlayer.lowHealth) {
    instance_destroy();
    exit;
}

//Advance our timer
time += pulseSpd;

//Compute alpha = (sin wave + 1)/2 scaled by pulseAmt
alpha = ((sin(time) + 1) / 2) * pulseAmt;