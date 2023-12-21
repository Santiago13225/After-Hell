///oVictoryScreen Draw Event
/*This object represents a victory screen object.*/
//This event is responsible for handling victory screen object drawing.

var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//Draw a black rectangle over the screen
draw_set_alpha(alpha*alphaMax);
draw_rectangle_color(_camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false);
//draw_set_alpha(1);

//Draw the text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_font(fnt8Bit);

//"game over"
var _gameoverOffset = -16;
draw_text_transformed(_camX + _camW/2, _camY + _camH + _gameoverOffset*20, "The match has ended.", 1.5, 1.5, 0);
draw_text_transformed(_camX + _camW/2, _camY + _camH + _gameoverOffset*19, "You won.", 1.5, 1.5, 0);
//"press shoot to restart"
var _restartOffset = 40;
//draw_text_transformed(_camX + _camW/2, _camY + _camH + _gameoverOffset*8, "- Press Shoot to Restart -", 1, 1, 0);
//reset draw settings
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
draw_set_alpha(1);

//Dynamically get width and height of menu
var _new_w = 0;

for(var i = 0; i < op_length; i++){
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}
width = (_new_w + op_border);
height = op_border*2 + ((string_height(option[0,0])+op_space) * op_length/2);
//height = op_border*2 + ((sprite_get_height(sMainFont)+op_space) * (op_length));

//Center menu
x = (camera_get_view_x(view_camera[0])) + (camera_get_view_width(view_camera[0])/2) -width/2;
//x = x + oPlayer.x - camera_get_view_width(view_camera[0])/2;
y = (camera_get_view_y(view_camera[0])) + (camera_get_view_height(view_camera[0])/2) -height/2;
//y = y;


//Draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//Draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < op_length; i++){
	var _c = c_white;
	if pos == i{
		_c = c_yellow;
	}
	draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, 1);
}
//width = _new_w + (op_border * 2);
//height = op_border * 2 + string_height(option[0,0]) + (op_length + 1) * op_space;
//height = (op_border * 2) + sprite_get_height(sMainFont) + ((op_length + 1) * op_space);

//Settings and quitting the game and stuff
//Get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//Store the number of options in current menu
op_length = array_length(option[menu_level]);

//Move through the menu
pos += down_key - up_key;
if pos >= op_length{
	pos = 0;
}
if pos < 0{
	pos = op_length-1;
}

//Using the options
if accept_key{
	//Pause menu
	switch(pos)
	{
		case 0:
			instance_deactivate_object(oPlayer);
			TransitionStart(rm_title_screen, sqFadeOut, sqFadeIn);
			game_restart();//Reset wave-related data.
			//audio_pause_sound(sndLaugh);
			break;
	}
}