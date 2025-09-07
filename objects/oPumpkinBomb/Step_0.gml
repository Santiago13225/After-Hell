if screen_pause() exit;

//float and gravity
z += zspd;
zspd -= grav;

depth = -y;

//explode
if(z <= 0){
	//Create Explosion
	//Code to set explosion size within crate
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oExplosion);
	with(_boomInst){//Set explosion scale.
		image_xscale = 1.25;//Set explosion x-scale.
		image_yscale = 1.25;//Set explosion y-scale.
	}
	
	audio_play_sound(sndExplosion, 8, false);//Play a sound effect.
	
	create_screen_pause();//Screen pause.

	if(global.screenShake){
		screen_shake(8);//Screen shake.
	}
	
	instance_destroy();//Destroy self.
}