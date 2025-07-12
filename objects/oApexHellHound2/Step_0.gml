event_inherited();//Inherit the parent event.	
	
//Trap Dropping — only when on screen
var _camLeft = camera_get_view_x(view_camera[0]);
var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
var _camTop = camera_get_view_y(view_camera[0]);
var _camBottom = _camTop + camera_get_view_height(view_camera[0]);

if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom {
	trapTimer++;
	if trapTimer >= cooldownTime {
		var trap = instance_create_depth(x, y, depth, oApexFire);//Temporary trap object
		trapTimer = 0;
		//Optional sound effect
		audio_play_sound(sndFire, 8, false);
	}
}