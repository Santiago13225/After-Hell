//function flashScreenRed(interval){
///scr_flash_screen(interval)
//Arguments:
//-interval: The interval at which the screen color will toggle (in frames)
var timer = 0;
var flashInterval = 30;

//Toggle the screen color at the specified interval
if (timer % flashInterval == 0){
	//instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -8000, oLowHealthScreen);
    if (draw_get_alpha() > 0){
		//image_blend = c_red;
		//draw_rectangle_color(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),c_red,c_red,c_red,c_red,false);
        draw_set_alpha(0);
    } else{
		//image_blend = c_white;
        draw_set_alpha(1);
    }
}

//Increment the timer
timer++;
//}