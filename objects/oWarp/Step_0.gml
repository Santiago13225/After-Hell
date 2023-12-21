///oWarp Step Event
/*This object represents a warp object.*/
//This event is responsible for handling warp object behavior.

/*Put the player in the correct coordinates after the room transition has happened
(*otherwise, the warp object won't recognize the targetObj).*/

//if room == targetRoom{//oPlayer has to be persistent for this to work!

//New coordinates based on targetObj.
	oPlayer.x = targetObj.x;//Get player to the right x-coordinate.
	oPlayer.y = targetObj.y;//Get player to the right y-coordinate.
	oPlayer.face = targetObj.image_index;//Set correct facing direction.
	
//Make player face the right direction AND update centerY since the player's code is currently frozen by this object (oWarp is a child of oScreenPause).
//NOTE: this can be done in the player object by checking if an oWarp exists and running this coe of it does (this code would have to be above the screen freeze check).
	/*with(oPlayer){
		//image_index = 0;//force image index to be 0 if we wanted to
		sprite_index = sprite[face];
		aimDir = face * 90;
		centerY = y + centerYOffset;
	}*/
//}

//Destroy self when done with reverse animating
if image_speed == -1 && image_index < 1{
	instance_destroy();
}