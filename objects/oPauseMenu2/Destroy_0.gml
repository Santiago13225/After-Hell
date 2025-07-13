with(oEnemyParent) {
    //Only start pathfinding if the player exists
    if(instance_exists(oPlayer)) {
        if(path_exists(path)) path_delete(path);//Clean up
        path = path_add();

        target_x = oPlayer.x;
        target_y = oPlayer.y;

        if(mp_grid_path(oSetupPathway.grid, path, x, y, target_x, target_y, true)) {
            pathspeed = 0.5;//or whatever your normal path speed is
            path_start(path, pathspeed, path_action_stop, true);
            usingPathfinding = true;
            alarm[0] = 120;//Resume regular path refresh
        }else {
            usingPathfinding = false;
            alarm[0] = 15;//Retry soon
        }
    }
}
