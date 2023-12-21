///oApexBlueEyedZombie Alarm 0 Event
/*This object represents an Apex Blue-Eyed Zombie.*/
//This event is responsible for creating a path for the zombie to track the player.

//Reset the current path by deleting the previous one and creating a new path.
path_delete(path);
path = path_add();

	if instance_exists(oPauseMenu){
		pathspeed = 0;
	}else{
		pathspeed = 1.6;
	}

	if !screen_pause() && instance_exists(oPlayer){//Check if the player object exists in the game.
		//Set the target coordinates (x, y) to the player's position.
		target_x = oPlayer.x;
		target_y = oPlayer.y;
	
		mp_grid_path(oSetupPathway.grid, path, x, y, target_x, target_y, 1);//Calculate a path using the game's grid and the A* pathfinding algorithm from the current position (x, y) to the player's position.

		path_start(path, pathspeed, path_action_stop, true);//Start following the calculated path with a speed of 1.6 pixels per step.

		alarm_set(0, 120);//Set an alarm (Alarm 0) to 120 steps to periodically recalculate the path.
	}