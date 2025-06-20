///oApexEnemyBullet Step Event
/*This object represents an Apex Bullet.*/
//This event is responsible for handling bullet logic.

if screen_pause(){//Pause Self
	exit;
}

//Lifetime countdown
timer++;
if timer >= lifetime {
	destroy = true;
}

//State Machine
switch(state){
	case 0://Wait for the enemy to shoot state.
		if instance_exists(oPlayer){//If player exists...
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);//Aim for the player.
		}
		
		depth = -y - 50;//Set depth to make self more visible.
	break;

	case 1://Shoot/Travel case.
	
	//Movement
	xspd = lengthdir_x(spd, dir);//Set x speed.
	yspd = lengthdir_y(spd, dir);//Set y speed.
	x += xspd;//Move by x speed.
	y += yspd;//Move by y speed.
	
	depth = -y;//Update the depth.
	break;
}

//Out of Room Bounds
var _pad = 16;
if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height + _pad{//If outside of room with padding.
	destroy = true;//Destory bullet.
}

//Clean Up
if hitConfirm == true && playerDestroy == true{//If it hits the player.
	destroy = true;//Destroy bullet.
}

if place_meeting(x, y, oSolidWall){//If it hits a wall.
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oZombieExplosion);//Create an explosion.
	with(_boomInst)
	{
		image_xscale = 1;//Set x-scale of the explosion.
		image_yscale = 1;//Set y-scale of the explosion.
	}

	audio_play_sound(sndExplosion, 8, false);//Play explosion sound effect.
	
	screen_shake(8);//Screen shake.
	
	instance_destroy();//Destroy self.
}else if place_meeting(x, y, oPlayer){//If it hits a player.
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oZombieExplosion);//Create an explosion.
	with(_boomInst)
	{
		image_xscale = 1;//Set x-scale of the explosion.
		image_yscale = 1;//Set y-scale of the explosion.
	}
	
	audio_play_sound(sndExplosion, 8, false);//Play explosion sound effect.
	
	screen_shake(8);//Screen shake.
	
	instance_destroy();//Destroy self.
}