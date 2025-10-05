var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//draw a black rectangle over the screen
draw_set_alpha(0.75);
draw_rectangle_color(_camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false);

//draw the text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_set_font(global.font_main);

//"Paused"
draw_text_transformed(_camX + _camW/2 + 0.25, _camY + _camH/2 - 64, "- Paused -", 1, 1, 0);

//reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Dynamically get width and height of menu
var _new_w = 0;

for(var i = 0; i < op_length; i++){
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}
width = _new_w + (op_border * 2);

//dynamically get width and height of menu
//height = op_border * 2 + ((string_height(option[0,0]) + op_space) * op_length/2);
height = (op_border * 2) + ((string_height(option[0,0]) + (op_space/4)) * (op_length));
//height = op_border*2 + ((sprite_get_height(sMainFont)+op_space) * (op_length));

//Center menu
//x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2) - (width/2);
x = _camX + _camW/2 - (width/2);
//x = _camX + _camW/2 - (width/2) - 0.75;
//x = x + oPlayer.x - camera_get_view_width(view_camera[0])/2;
//y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2) - (height/2);
y = _camY + _camH/2 - (height/2);
//y = y;

//Draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

if(menu_level == 1) {
    //Define bar dimensions (adjust these values as needed)
    var barX = x + op_border;//start
    var barY = y + op_border + op_space * 0;//for Music Volume (first option)
    //var maxBarWidth = 100;//maximum width of the bar
	var maxBarWidth = _new_w;
    var barHeight = string_height(option[1,0]) - 1;//height of the bar
	//var barHeight = string_height(option[menu_level, i]);//height of the bar
	draw_set_alpha(0.5);
    //Draw Music Volume bar
    //Calculate filled width for music volume (global.musicvolume is between 0 and 1)
    var fillWidth = global.musicvolume * maxBarWidth;
    
    //Draw the bar outline
    draw_set_color(c_black);
    draw_rectangle(barX, barY, barX + maxBarWidth, barY + barHeight, false);
    
    //Draw the filled portion(for example, green)
    draw_set_color(c_lime);
    draw_rectangle(barX, barY, barX + fillWidth, barY + barHeight, false);
    
    //Reset color
    draw_set_color(c_white);
    
    //Now for Sfx Volume (second option)
    barY = y + op_border + op_space * 1;//shift down by one option spacing
    fillWidth = global.sfxvolume * maxBarWidth;
    
    //Draw Sfx Volume bar outline
    draw_set_color(c_black);
    draw_rectangle(barX, barY, barX + maxBarWidth, barY + barHeight, false);
    
    //Draw the filled portion (green)
    draw_set_color(c_lime);
    draw_rectangle(barX, barY, barX + fillWidth, barY + barHeight, false);
    
    //Reset color
    draw_set_color(c_white);
}
draw_set_alpha(1);

//Draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < op_length; i++){
	var _c = c_white;
	//Make "Controls" gray if locked
	if(menu_level == 1 && i == 2 && oControllerIndicator.controller_count == 0) {
		if(pos == i){
			draw_sprite_ext(sPixel, 0, x, y + op_border + op_space * i, width, string_height(option[menu_level, i]), 0, c_red, 0.5);
		}
		_c = c_gray;//gray
	}else if(pos == i){
		draw_sprite_ext(sPixel, 0, x, y + op_border + op_space * i, width, string_height(option[menu_level, i]), 0, c_red, 0.5);
		_c = c_yellow;
	}
	draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, 1);
}
//width = _new_w + (op_border * 2);
//height = op_border * 2 + string_height(option[0,0]) + (op_length + 1) * op_space;
//height = (op_border * 2) + sprite_get_height(sMainFont) + ((op_length + 1) * op_space);