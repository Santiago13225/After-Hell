///oSetupPathway Create Event
/*This object represents a pathway.*/
//This event is responsible for initializing a grid for the pathways.

grid = mp_grid_create(0, 0, room_width/16, room_height/16, 16, 16);//Create a grid throughout the whole room.
mp_grid_add_instances(grid, oWall, 0);//Add walls as obstacles in the grid system.
depth = -3000;//Set depth to -3000.