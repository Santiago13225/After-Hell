///oParallexBackgroundWS Draw Event
/*This object represents the parallax background WS object.*/
//This event is responsible for handling parallax background WS object drawing.
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
//draw_sprite(bgWaterStationLevel1, 0, _camX, _camY);

//var _p = 0.5;

//draw_sprite(bgSpace, 0, _camX, _camY);
draw_sprite_ext(bgSpace, 0, _camX, _camY, 1, 1, 0, c_white, 1);

//draw_sprite_tiled_ext(bgWaterStationLevel, 0, _camX * _p, _camY * _p, 1.5, 1.5, c_white, 1);
//draw_sprite(bgWaterStationLevel1, 0, _camX * _p, _camY * _p);
//draw_sprite_tiled(bgWaterStationLevel1, 0, _camX * _p, _camY * _p);
//draw_sprite_tiled(bgWaterStationLevel1, 1, _camX * 0.25, _camY * 0.25);//subimg 1!!!