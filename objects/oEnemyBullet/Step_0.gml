///oEnemyBullet Step Event
/*This object represents a Bullet.*/
//This event is responsible for handling bullet logic.

if screen_pause(){//Pause Self
	exit;
}

//State Machine
switch(state){
	case 0://Wait for the enemy to shoot state.
		if instance_exists(oPlayer){//If player exists.
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);//Aim for the player.
		}

		depth = -y - 50;//Set depth to make self more visible.
		
	break;
	
	case 1://Shoot/Travel Case
	//Movement
	xspd = lengthdir_x(spd, dir);//Set x-speed.
	yspd = lengthdir_y(spd, dir);//Set y-speed.
	x += xspd;//Movement along the x-axis.
	y += yspd;//Movement along the y-axis.
	
	depth = -y;//Update the depth.
	
	break;
}

//Out of Room Bounds
var _pad = 16;//How far out of the room the bullet can go.
if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height + _pad{//If above, below, to the left, or to the right of the room with some padding...
	destroy = true;//Destroy the bullet.
}

if hitConfirm == true && playerDestroy == true{//Clean Up
	destroy = true;
}

if destroy == true
{//Actually destroy self.
	create_animated_vfx(sShootBurst, x, y, depth-50);//Shoot burst.

	audio_play_sound(snd8BitExplosion2, 8, false);//Play a sound effect.

	instance_destroy();//Destroy.
}
//Wall Collision
if place_meeting(x, y, oSolidWall){//If it touches a wall.
	destroy = true;//Destroy the bullet.
}
/*
if place_meeting(x, y, oPlayer) && playerDestroy == true{
	destroy = true;
}*/
