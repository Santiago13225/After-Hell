///oExplosiveCrate Step Event
/*This object represents an explosive crate.*/
//This event is responsible for setting explosive crate behavior.
get_damage(oDamageParent);//Set damage behavior.

//Show Damage
var _healthPercent = 1 - (hp / maxHp);
image_index = _healthPercent * image_number;

if hp <= 0{//If HP is less than or equal to 0...
	//Create Explosion
	//Code to set explosion size within crate
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oExplosion);
	with(_boomInst){//Set explosion scale.
		image_xscale = 2;//Set explosion x-scale.
		image_yscale = 2;//Set explosion y-scale.
	}
	
	audio_play_sound(sndExplosion, 8, false);//Play a sound effect.
	
	create_screen_pause();//Screen pause.

	if(global.screenShake){
		screen_shake(8);//Screen shake.
	}
	
	instance_destroy();//Destroy self.
}