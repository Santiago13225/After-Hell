///oZombie Step Event
/*This object represents a Zombie.*/
//This event is resposible for handling zombie behavior.

if screen_pause(){//Pause self.
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
var _autoSprites = true;

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
	
	if !place_meeting(x, y, oWall){//Switch to the chasing state after out of spawner object.
		state = 0;
	}
	break;
	
	//Chase State
	case 0:
		if instance_exists(oPlayer){//If the player exists.
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);//Get the player's direction.
		}
		spd = chaseSpd;//Set the chasing speed.

	
	//transition to shooting state
	var _camLeft = camera_get_view_x(view_camera[0]);
	var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
	var _camTop = camera_get_view_y(view_camera[0]);
	var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
	
	//only add to timer if on screen
	if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom{
		shootTimer++;
	}
	
	if shootTimer > cooldownTime{
		//go to shoot state
		state = 1;
		//reset timer so the shooting state can use it too
		shootTimer = 0;
	}
	break;
	//Pause and Shoot State
	#region
	case 1:
	
	//gets player's direction
	if instance_exists(oPlayer){
		dir = point_direction(x, y, oPlayer.x, oPlayer.y);
	}
	//set the correct speed
	spd = 0;
	
	//start the attack animation
	_autoSprites = false;
	if(sprite_index != sLostSoulAttack){
		sprite_index = sLostSoulAttack;
		image_index = 0;
	}
	
	if(sprite_index == sLostSoulAttack && floor(image_index) == attackFrame && !attackTriggered){
		attackTriggered = true;
		
		audio_play_sound(sndEarthquake, 8, false);//Play explosion sound effect.
		if(global.screenShake){
			screen_shake(8);//Screen shake.
		}

		var _attackDist = 400;
		var _attackSep = 20;
		var _attackNum = round(_attackDist/_attackSep);
		var _attackDirSep = 10;
		
		for(var ds = 0; ds < 3; ds++){
			var _dir = dir - _attackDirSep + _attackDirSep * ds;
			for(var i = 1; i < _attackNum; i++){

				var _xx = x + lengthdir_x(_attackSep * i, _dir);
				var _yy = y + lengthdir_y(_attackSep * i, _dir);
			
				if(!position_meeting(_xx, _yy, oWall)) {
					var _inst = instance_create_depth(_xx, _yy, depth, oVine);
					_inst.delay = i * 4;
				}else {
					i += 99;
				}
			}
		}
	}
	
	//holding the animation
	if(sprite_index == sLostSoulAttack && floor(image_index) == holdFrame) {
		holdTimer--;
		if(holdTimer > 0) {
			image_index = holdFrame;
		}
	}
	
/*
	//stop animating / manually set the image index
	image_index = 0;
	
	//shoot a bullet
	shootTimer++;
	
	//create the bullet
	if shootTimer == 1{
		bulletInst = instance_create_depth(x + bulletXoff, y + bulletYoff, depth, oEnemyBullet);
	}
	
	//keep the bullet in the zombie's hands
	if shootTimer <= windupTime && instance_exists(bulletInst){
		bulletInst.x = x + bulletXoff;
		bulletInst.y = y + bulletYoff;
	}
	
	//shoot bullet after the windup time is over
	if shootTimer == windupTime && instance_exists(bulletInst){
		//set our bullet's state to the movement state
		//play a sound effect
		audio_play_sound(sndThrow, 8, false);
		bulletInst.state = 1;
	}
	
	//recover and return to chasing the player
	if shootTimer > windupTime + recoverTime{
		//go back to chasing the player
		state = 0;
		
		//reset the timer so that we can use it again
		shootTimer = 0;
	}*/
	break;
	
	#endregion
}

//reset the attack variables
if sprite_index != sLostSoulAttack { attackTriggered = false; holdTimer = holdTime; };
/*
	//Chase the Player
	if screen_pause() {
	    //If paused, don't move at all
	    xspd = 0;
	    yspd = 0;
	}else {
	    //Zombie movement
	    if usingPathfinding {
	        xspd = 0;
	        yspd = 0;
	    }else {
			if(instance_exists(oPlayer)) {
		        dir = point_direction(x, y, oPlayer.x, oPlayer.y);//update direction
		    }
	        xspd = lengthdir_x(spd, dir);
	        yspd = lengthdir_y(spd, dir);
	    }
	}*/
	
	if screen_pause() {
	    xspd = 0;
	    yspd = 0;
	}else {
	    xspd = lengthdir_x(spd, dir);
	    yspd = lengthdir_y(spd, dir);
	}

	//Apply movement (outside pause check!)
	//x += xspd;
	//y += yspd;
	
	//Get the correct sprite
	if _autoSprites {
		face = round(dir/90);
		if(face == 4){face = 0;};
		sprite_index = sprite[face];
		mask_index = sprite[3];
	}
	
	/*if xspd > 0{
		face = 1;	
	}
	if xspd < 0{
		face = -1;	
	}*/
	//image_xscale = face;
	//Collisions
	//Wall collisions
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
if _getDamage == true{//If zombie can get damaged.
	event_inherited();//Inherit getting damaged and dying behavior.
}