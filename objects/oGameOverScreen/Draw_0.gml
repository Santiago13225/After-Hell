var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//draw a black rectangle over the screen
draw_set_alpha(alpha*alphaMax);
draw_rectangle_color(_camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false);
//draw_set_alpha(1);

//draw the text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_font(fnt8Bit);

//"game over"
var _gameoverOffset = -16;
draw_text_transformed(_camX + _camW/2, _camY + _camH + _gameoverOffset*20, "The match has ended.", 1.5, 1.5, 0);
draw_text_transformed(_camX + _camW/2, _camY + _camH + _gameoverOffset*19, "You were overwhelmed.", 1.5, 1.5, 0);
//"press shoot to restart"
var _restartOffset = 40;
//draw_text_transformed(_camX + _camW/2, _camY + _camH + _gameoverOffset*8, "- Press Shoot to Restart -", 1, 1, 0);
//reset draw settings
//draw_set_halign(fa_left);
//draw_set_valign(fa_top);
draw_set_alpha(1);

//dynamically get width and height of menu
var _new_w = 0;

for(var i = 0; i < op_length; i++)
{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}
width = (_new_w + op_border);
height = op_border*2 + ((string_height(option[0,0])+op_space) * op_length/2);
//height = op_border*2 + ((sprite_get_height(sMainFont)+op_space) * (op_length));

//center menu
x = (camera_get_view_x(view_camera[0])) + (camera_get_view_width(view_camera[0])/2) -width/2;
//x = x + oPlayer.x - camera_get_view_width(view_camera[0])/2;
y = (camera_get_view_y(view_camera[0])) + (camera_get_view_height(view_camera[0])/2) -height/2;
//y = y;


//draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < op_length; i++)
{
	var _c = c_white;
	if pos == i
	{
		_c = c_yellow;
	}
	draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, 1);
}
//width = _new_w + (op_border * 2);
//height = op_border * 2 + string_height(option[0,0]) + (op_length + 1) * op_space;
//height = (op_border * 2) + sprite_get_height(sMainFont) + ((op_length + 1) * op_space);
//settings and quitting the game and stuff
//get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//Get inputs for volume control
left_key = keyboard_check_pressed(vk_left);
right_key = keyboard_check_pressed(vk_right);

//Adjust music volume
if(menu_level == 1 && pos == 0)//Check if in the Settings menu and the first option (music)
{
    if (left_key){
        global.musicvolume = max(0, global.musicvolume - 0.1);//Reduce volume by 10%
		option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
    }
    else if (right_key){
        global.musicvolume = min(1, global.musicvolume + 0.1);//Increase volume by 10%
		option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
    }
}
//Adjust sound effects volume
if(menu_level == 1 && pos == 1)//Check if in the Settings menu and the second option (sfx)
{
    if (left_key){
        global.sfxvolume = max(0, global.sfxvolume - 0.1);//Reduce volume by 10%
		option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
    }
    else if (right_key){
        global.sfxvolume = min(1, global.sfxvolume + 0.1);//Increase volume by 10%
		option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
    }
}

//store number of options in current menu
op_length = array_length(option[menu_level]);

//move through the menu
pos += down_key - up_key;
if pos >= op_length
{
	pos = 0;
}
if pos < 0
{
	pos = op_length-1;
}

//using the options
if accept_key{
	var _sml = menu_level;
	
	switch(menu_level)
	{
		//pause menu
		case 0:
			switch(pos)
			{
				//resume
				case 0:
					room_restart();
					//audio_play_sound(sndBeep, 10, false);
					instance_destroy(oPauseMenu);
					break;
				//settings
				case 1:
					menu_level = 1;
					break;
				//quit game
				case 2:
					//room_instance_clear(rm_Level1)
					//screen_pause();
					//audio_pause_all();
					//while instance_exists(oPlayer){
						instance_deactivate_object(oPlayer);
					//}
					/*
					while instance_exists(oEnemyParent){
						instance_deactivate_object(oEnemyParent);
					}
					while instance_exists(oSpawner){
						instance_deactivate_object(oSpawner);
					}*/
					//instance_deactivate_object();
					TransitionStart(rm_title_screen, sqFadeOut, sqFadeIn);
					//TitleScreenTransition(sqSlideOut, sqSlideIn);
					//RoomTransition(rm_title_screen, sqSlideOut, sqSlideIn);
					//TransitionStart(rm_title_screen, sqSlideOutDiagonal, sqFadeIn);
					//room_goto(rm_title_screen);
					break;
			}
			break;
		//settings
		case 1:
			switch(pos)
			{
				//Music
				case 0:
					option[1, 0] = "Music Volume: " + string_format(global.musicvolume * 100, 2, 0) + "%";
					break;
				//Sound
				case 1:
					option[1, 1] = "Sfx Volume: " + string_format(global.sfxvolume * 100, 2, 0) + "%";
					break;
				//controls
				case 2:
					//controller option
					if global.controllerMode == 0{
						option[1, 2] = "Controls: Controller";
						global.controllerMode = 1;
					}else{
						option[1, 2] = "Controls: Keyboard";
						global.controllerMode = 0;
					}
					break;
				//back
				case 3:
					menu_level = 0;
					break;
			}
			break;
	}
	//set position back
	if _sml != menu_level
	{
		pos = 0;
	}
	//correct option length
	op_length = array_length(option[menu_level]);
}