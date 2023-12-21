///oUnstableBullet Step Event
/*This object represents the unstable bullet object.*/
//This event is responsible for handling the unstable bullet object behavior.

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
		//Play a sound effect
		audio_play_sound(snd8BitExplosion2, 8, false);
	} else if place_meeting(x, y, oEnemyParent){
		//Play a sound effect
		audio_play_sound(sndFleshHit, 8, false);
	}
	//Shoot burst
	create_animated_vfx(sShootBurst, x, y, depth-50);
	
	//Destroy
	instance_destroy();
}

//Collision
if place_meeting(x, y, oSolidWall){
	//instance_destroy();
	destroy = true;
}

//Bullets out of range
if point_distance(xstart, ystart, x, y) > maxDist{
	destroy = true;
}

image_angle = dir;