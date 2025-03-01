///oItemManager2 Draw Event
/*This object represents an item manager object.*/
//This event is responsible for handling item manager drawing.
var _wx = display_get_gui_width();
var _wy = display_get_gui_height();

draw_set_font(global.font);
if(instance_exists(oPlayer)){
	for(var i = 0; i < array_length(inv); i++){
		var _sep = (sep * 3);
		//var _xx = screen_bord;
		var _stx = 0 + _wx; 
		//var _xx = screen_bord + camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
		var _xxw = (screen_bord * 3) + 0 + _wx - (96 * 3);
		//var _yy = screen_bord + camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
		//var _yy = screen_bord + camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + (_sep * i) -56;
		var _sty = 0 + _wy;
		var _yy = 0 + _wy + (_sep * i) - (64 * 3);
		//var _sep = sep;
		var _col = c_white;
	
		//Icon
		//draw_sprite(inv[i].sprite, 0, _stx - 96, _yy + 8);
		draw_sprite_ext(inv[i].sprite, 0, _stx - (96 * 3), _yy + (8 * 3), 3, 3, 0, c_white, 1);
		//draw_sprite(global.item_list.burger.sprite, 0 , 16, 16);
	
		//Get "selected" color
		if selected_item == i{
			_col = c_yellow;

			//Calculate the box dimensions
			var box_width = 120 * 3;
			var box_height = 106 * 3;

			//Draw the semi-transparent black box
			draw_set_alpha(1);//Set the transparency.
			draw_set_color(c_black);//Set the color to black.
			draw_rectangle_color(_stx - (130 * 3), _sty - (196 * 3), _stx - (128 * 3) + box_width, _sty - (196 * 3) + box_height, c_black, c_black, c_black, c_black, false);
		}
		draw_set_color(_col);
	
		//Name
		//draw_text(_xxw + 16, _yy, inv[i].name);
		draw_text_transformed(_xxw + 16, _yy, inv[i].name, 3, 3, 0);//Good enough
	
		//Description
		if selected_item == i{
			//draw_text_ext(_stx - (128 * 3), _sty - (196 * 3), inv[i].description, (12 * 3), (120 * 3));
			draw_text_ext_transformed(_stx - (128 * 3), _sty - (196 * 3), inv[i].description, 12, 180, 2, 2, 0);
		}

		draw_set_color(c_white);//Reset color to white.
	}
}