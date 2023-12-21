///oWarpBlock Step Event
/*This object represents a warp block object.*/
//This event is responsible for handling warp block object behavior.

if !instance_exists(oWarp) && place_meeting(x, y, oPlayer){//Create the warp object when the player touches this, but only if a warp object doesn't already exist.
	with(instance_create_depth(0, 0, 0, oWarp))
	{//Create the warp object and set it's target room and coordinate object to match this warp block's.
		//targetRoom = other.targetRoom;
		targetObj = other.targetObj;
	}
}

/*
if place_meeting(x, y, obj_player)
{
	room_goto(target_rm);
	oPlayer.x = target_x;
	oPlayer.y = target_y;
}*/