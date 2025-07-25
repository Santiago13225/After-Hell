///oZombie Alarm 0 Event
/*This object represents a Zombie.*/
//This event is responsible for creating a path for the zombie to track the player.

//if screen_pause() {
if(instance_exists(oPauseMenu2)){
    exit;
}

//Reset the current path by deleting the previous one and creating a new path.
if path_exists(path) {
	path_delete(path);
}
path = path_add();

	if instance_exists(oPauseMenu2){
		pathspeed = 0;
	}else{
		pathspeed = 0.5;
	}

#region
	/*if instance_exists(oPlayer){//Check if the player object exists in the game.
		//path_delete(path);
		//path = path_add();
		
		//Set the target coordinates (x, y) to the player's position.
		target_x = oPlayer.x;
		target_y = oPlayer.y;
		mp_grid_path(oSetupPathway.grid, path, x, y, target_x, target_y, 1);//Calculate a path using the game's grid and the A* pathfinding algorithm from the current position (x, y) to the player's position.

		path_start(path, pathspeed, path_action_stop, true);//Start following the calculated path with a speed of 0.5 pixels per step.

		alarm_set(0, 120);//Set an alarm (Alarm 0) to 120 steps to periodically recalculate the path.
	}*/
#endregion

if instance_exists(oPlayer) {
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