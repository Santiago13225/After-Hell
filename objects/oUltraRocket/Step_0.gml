///oUltraRocket Create Event
/*This object represents the ultra rocket object.*/
//This event is responsible for setting some variables for the ultra rocket object.

//Pause Self
if screen_pause(){
	exit;	
}

//Move
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;

//Depth
depth = -y;

//Cleanup
//Hit confirm destroy
if hitConfirm == true && enemyDestroy == true{
	destroy = true;
}

//Destroy
if destroy == true{
	if place_meeting(x, y, oSolidWall){
		var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oUltraExplosion);
		with(_boomInst){
			image_xscale = 1.5;
			image_yscale = 1.5;
		}
	
		//Play a sound effect
		audio_play_sound(sndExplosion, 8, false);
	
		//Screen pause
		//create_screen_pause();
	
		//Screen shake
		screen_shake(16);
	
		//Destroy self
		instance_destroy();
		
		//Play a sound effect
		//audio_play_sound(sndExplosion, 8, false);
	} else if place_meeting(x, y, oEnemyParent){
		var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oUltraExplosion);
		with(_boomInst){
			image_xscale = 1.5;
			image_yscale = 1.5;
		}
	
		//Play a sound effect
		audio_play_sound(sndExplosion, 8, false);
	
		//Screen pause
		//create_screen_pause();
	
		//Screen shake
		screen_shake(16);
	
		//Destroy self
		instance_destroy();
		//Play a sound effect
		//audio_play_sound(sndExplosion, 8, false);
	}
	//Shoot burst
	create_animated_vfx(sShootBurst, x, y, depth-50);
	
	//Destroy
	instance_destroy();
}

//Collision
if place_meeting(x, y, oSolidWall){
	//instance_destroy();
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oUltraExplosion);
		with(_boomInst){
			image_xscale = 1.5;
			image_yscale = 1.5;
		}
	
		//Play a sound effect
		audio_play_sound(sndExplosion, 8, false);
	
		//Screen pause
		create_screen_pause();
	
		//Screen shake
		screen_shake(16);
	
		//Destroy self
		instance_destroy();
	destroy = true;
}

//Bullets out of range
if point_distance(xstart, ystart, x, y) > maxDist{
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oUltraExplosion);
		with(_boomInst){
			image_xscale = 1.5;
			image_yscale = 1.5;
		}
	
		//Play a sound effect
		audio_play_sound(sndExplosion, 8, false);
	
		//Screen pause
		create_screen_pause();
	
		//Screen shake
		screen_shake(16);
	
		//Destroy self
		instance_destroy();
	destroy = true;
}

image_angle = dir;