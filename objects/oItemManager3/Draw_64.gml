///oItemManager2 Draw Event
/*This object represents an item manager object.*/
//This event is responsible for handling item manager drawing.
var _wx = display_get_gui_width();
var _wy = display_get_gui_height();

draw_set_font(global.font);

if instance_exists(oPlayer) {
    with (oPlayer) {
        // 1) pickupSprite holds the small, crisp icon for HUD
        var icon = weapon.pickupSprite;    // your create_weapon’s last arg :contentReference[oaicite:3]{index=3}
        
        // 2) compute where to draw (bottom-right corner, 3× scale)
        var pad = 16 * 3;         // reuse your screen_bord, scaled by 3
        var drawX = _wx - (96*3) - pad + 200;//match “96*3” width of inventory icons
        var drawY = _wy - (96*3) - pad + 280;//same for height
        
        // 3) draw crisp 3× icon
        draw_sprite_ext(
            icon, 0,
            drawX, drawY,
            3, 3,                            // scale exactly 3× :contentReference[oaicite:4]{index=4}
            0, c_white, 1
        );

		// 4) draw the ammo count underneath
		var ammo = (global.PlayerAmmo[oPlayer.selectedWeapon]);

		//draw_set_font(global.font);
		draw_set_halign(fa_center);
		//draw_set_valign(fa_middle);
		//draw_set_color(c_white);

		var text_x = drawX + (0 * 3);
		var text_y = drawY + (5 * 3);

		var _color = c_white;
		if(global.PlayerAmmo[oPlayer.selectedWeapon] == 0){
			_color = c_red;
		}else{
			_color = c_white;
		}

		draw_text_transformed_color(text_x, text_y, "Ammo: " + string(ammo), 2.5, 2.5, 0, _color, _color, _color, _color, 1);
		//draw_text_transformed(text_x, text_y, "Ammo: " + string(ammo), 2.5, 2.5, 0);	
    }
}

/*
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
}*/
draw_set_halign(fa_left);