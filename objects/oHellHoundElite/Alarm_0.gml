///oHellHoundElite Alarm 0 Event
/*This object represents a Hellhound Elite.*/
//This event is responsible for creating a path for the zombie to track the player.

//Reset the current path by deleting the previous one and creating a new path.
path_delete(path);
path = path_add();

	if instance_exists(oPauseMenu2){
		pathspeed = 0;
	}else{
		pathspeed = 2.0;
	}

	if instance_exists(oPlayer){//Check if the player object exists in the game.
		//Set the target coordinates (x, y) to the player's position.
		target_x = oPlayer.x;
		target_y = oPlayer.y;
		
		//Attempt to find path using grid
	    if mp_grid_path(oSetupPathway.grid, path, x, y, target_x, target_y, true) {
	        path_start(path, pathspeed, path_action_stop, true);
	        usingPathfinding = true;
			alarm_set(0, 120); // Retry later to keep updating the path
	    }else {
	        usingPathfinding = false;
			alarm_set(0, 15); // Retry in 15 steps (~0.25 seconds)
	        //Optional: Log if path fails
	        //show_debug_message("Zombie failed to find path at: " + string(x) + "," + string(y));
	    }
	}