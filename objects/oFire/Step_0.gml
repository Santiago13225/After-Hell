/// oFireTrap Step Event
/* Controls trap behavior and lifetime. */

if screen_pause() {
	exit;
}

//Lifetime countdown
timer++;
if timer >= lifetime {
	//instance_destroy();//Remove trap after 5 seconds
	destroy = true;
}

if hitConfirm == true && playerDestroy == true{//Clean Up
	destroy = true;
}

if destroy == true{//Actually destroy self.
	create_animated_vfx(sPoof, x, y, depth);//Create visual effect.

	//audio_play_sound(sndSmokePuff, 8, false);//Play a sound effect.

	instance_destroy();//Destroy.
}

//Damage player on contact
if place_meeting(x, y, oPlayer) {
	destroy = true;
}
