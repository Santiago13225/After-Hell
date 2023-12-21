///oItemManager2 Draw Event
/*This object represents an item manager object.*/
//This event is responsible for handling item manager drawing.

draw_set_font(global.font);

for (var i = 0; i < array_length(inv); i++){
	var _sep = sep;
	//var _xx = screen_bord;
	var _stx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]); 
	//var _xx = screen_bord + camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
	var _xxw = screen_bord + camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 96;
	//var _yy = screen_bord + camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
	//var _yy = screen_bord + camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + (_sep * i) -56;
	var _sty = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
	var _yy = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + (_sep * i) -64;
	//var _sep = sep;
	var _col = c_white;
	
	//Icon
	draw_sprite(inv[i].sprite, 0, _stx - 96, _yy + 8);
	//draw_sprite(global.item_list.burger.sprite, 0 , 16, 16);
	
	//Get "selected" color
	if selected_item == i{
		_col = c_yellow;

		//Calculate the box dimensions
		var box_width = 120;
		var box_height = 106;

		//Draw the semi-transparent black box
		draw_set_alpha(1);//Set the transparency.
		draw_set_color(c_black);//Set the color to black.
		draw_rectangle_color(_stx - 130, _sty -196, _stx - 128 + box_width, _sty -196 + box_height, c_black, c_black, c_black, c_black, false);
	}
	draw_set_color(_col);
	
	//Name
	draw_text(_xxw + 16, _yy, inv[i].name);
	
	//Description
	if selected_item == i{
		draw_text_ext(_stx - 128, _sty -196, inv[i].description, 12, 120);
	}

	draw_set_color(c_white);//Reset color to white.
}