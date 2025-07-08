///oApexPurpleEyedZombie Step Event
/*This object represents an Apex Purple Eyed Zombie.*/
//This event is resposible for handling zombie behavior.

//Pause Self
if screen_pause(){
	exit;
}
/*
if instance_exists(oScreenPause)
{
	image_speed = 0;
	exit;
} else {
	image_speed = 1;	
}*/

//Code Commands
var _wallCollisions = true;//Set wall collisions to true.
var _getDamage = true;//Set get damage to true.

//State Machine
switch(state){
	case -1://Spawn in from spawn object.
	
	if place_meeting(x, y, oInvisibleSpawner2){//If the zombie is in contact with the spawner object.
		if image_alpha >= 1{//Walk Out
			spd = emergeSpd;//Set the right speed.
			dir = 270;//Set the direction.
		}
		image_alpha = 1;//Make the zombie fully visable.

		if !place_meeting(x, y, oInvisibleSpawner2){//Switch to the chasing state after out of the spawner object.
			state = 0;
		}
	}
	
	//Fade In
	if image_alpha < 1{
		spd = 0;//Don't walk while fading in.
		image_alpha += fadeSpd;//Fade in using the fade speed variable.
	}
	
	//Walk Out
	_wallCollisions = false;//Set wall collisions to false.
	_getDamage = false;//Set get damage to false.
	if image_alpha >= 1{//If completely visible.
		spd = emergeSpd;//Set the right speed.
		dir = 270;//Set the direction.
	}
	
	if !place_meeting(x, y, oWall) {//Switch to the chasing state after out of spawner object.
		state = 0;
	}
	break;
	
	//Chase State
	case 0:
	#region
		if instance_exists(oPlayer){//If the player exists.
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);//Get the player's direction.
		}
		spd = chaseSpd;//Set the chasing speed.
	
	//Transition to Shooting State
	var _camLeft = camera_get_view_x(view_camera[0]);//Left of camera variable.
	var _camRight = _camLeft + camera_get_view_width(view_camera[0]);//Right of camera variable.
	var _camTop = camera_get_view_y(view_camera[0]);//Top of camera variable.
	var _camBottom = _camTop + camera_get_view_height(view_camera[0]);//Bottom of camera variable.
	
	if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom{//If on screen...
		shootTimer++;//Add to timer.
	}
	
	if shootTimer > cooldownTime{//If shoot timer is greater than the cooldown time...
		state = 1;//Go to the shoot state.
		shootTimer = 0;//Reset the timer so the shooting state can use it too.
	}
	#endregion
	break;
	//Pause and Shoot State
	#region
	case 1:
	if instance_exists(oPlayer){//If the player exists...
		dir = point_direction(x, y, oPlayer.x, oPlayer.y);//Get the player's direction.
	}

	spd = 0;//Set the correct speed.
	
	image_index = 0;//Stop animating / manually set the image index.
	
	shootTimer++;//Shoot a bullet.
	
	//old shooting code
	if shootTimer == 1{//Create the bullet.
		bulletInst = instance_create_depth(x + bulletXoff*face, y + bulletYoff, depth, oApexEnemyBullet);
	}
	
	if shootTimer <= windupTime && instance_exists(bulletInst){//Keep the bullet in the zombie's hands.
		bulletInst.x = x + bulletXoff*face;
		bulletInst.y = y + bulletYoff;
	}

	if shootTimer == windupTime && instance_exists(bulletInst){//Shoot bullet after the windup time is over.
		//audio_play_sound(sndThrow, 8, false);//Play a sound effect.
		//bulletInst.state = 1;//Set our bullet's state to the movement state.
	
		//fire three bullets in a -15°, 0°, +15° arc
        var spread = 15;
        var base_x = x + bulletXoff*face;
        var base_y = y + bulletYoff;
        for (var i = -1; i <= 1; i++) {
            var b = instance_create_depth(base_x, base_y, depth, oApexEnemyBullet);
            b.dir   = dir + i * spread;
            b.state = 1;
        }
        audio_play_sound(sndThrow, 8, false);
		bulletInst.state = 1;//Set our bullet's state to the movement state.

        //destroy the “held” one if you spawned it earlier
        if (instance_exists(bulletInst)) instance_destroy(bulletInst);
	
	}
	
	if shootTimer > windupTime + recoverTime{//Recover and return to chasing the player.
		state = 0;//Go back to chasing the player.
		
		shootTimer = 0;//Reset the timer so that we can use it again.
	}	
	break;
	#endregion
}

	//Chase the Player
	if screen_pause() {
		//path_delete(path);
		xspd = 0;
		yspd = 0;
	}else{
		//path = path_add();
		xspd = lengthdir_x(spd, dir);//Get the x speed.
		yspd = lengthdir_y(spd, dir);//Get the y speed.
	}

	if dir > 90 && dir < 270{//Get the correct face.
		face = -1;
	}else{
		face = 1;
	}
	/*if xspd > 0{
		face = 1;	
	}
	if xspd < 0{
		face = -1;	
	}*/
	
	//Collisions
	//Wall Collisions
	if _wallCollisions == true{//If zombie can collide with walls
		if place_meeting(x + xspd, y, oWall){//If zombie meets with wall horizontally.
			xspd = 0;//Set horizontal speed to 0.
		}
		if place_meeting(x, y + yspd, oWall){//If zombie meets with wall vertically.
			yspd = 0;//Set vertical speed to 0.
		}
	}
	//Enemy Collisions
		if place_meeting(x + xspd, y, oEnemyParent){//If zombie meets with other zombie horizontally.
			xspd = 0;//Set horizontal speed to 0.
		}
		if place_meeting(x, y + yspd, oEnemyParent){//If zombie meets with other zombie vertically.
			yspd = 0;//Set vertical speed to 0.
		}

	//Movement
	x += xspd;//Move by horizontal speed.
	y += yspd;//Move by vertical speed.

	depth = -y;//Set the depth.

//Inherit the parent event
if _getDamage == true{//If zombie can get damaged...
	event_inherited();//Inherit getting damaged and dying behavior.
}