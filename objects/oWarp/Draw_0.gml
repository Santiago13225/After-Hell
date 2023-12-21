///oWarp Draw Event
/*This object represents a warp object.*/
//This event is responsible for drawing the warp effect.

//draw_sprite_tiled(sprite_index, image_index,  camera_get_view_x(view_camera[0]),  camera_get_view_y(view_camera[0]));
draw_sprite_tiled(sprite_index, image_index, 0, 0);//Draw the warp effect in tiles.
//draw_sprite_stretched(sprite_index, image_index, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));