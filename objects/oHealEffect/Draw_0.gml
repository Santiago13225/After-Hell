///oHealEffect Draw Event
/*This object represents a heal effect.*/
//This event is responsible for handling heal effect drawing.

//Draw over the camera
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_sprite_ext(sprite_index, 0, _camX, _camY, 1, 1, 0, c_white, alpha);