if(controller_count > 0) {//if there is more than one conttroller
	if(room == rm_Title_Screen){//if we are in the title screen
		var spr = sController;//your controller icon sprite
		var xPos = display_get_gui_width() - (28 * 3);
		var yPos = display_get_gui_height() - (26 * 3);

		//Draw controller icon
		//draw_sprite(spr, 0, xPos, yPos);
		draw_sprite_ext(spr, 0, xPos, yPos, 3, 3, 0, c_white, 1);

		//Draw count number
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		//draw_text(xPos, yPos, string(controller_count));
		draw_text_transformed(xPos, yPos, string(controller_count), 3, 3, 0);
		draw_set_valign(fa_top);
		if(global.controllerMode == 0){//If control mode set to keyboard and mouse
			draw_text_transformed_color(display_get_gui_width()/2, yPos - (4 * 3), "Controller Detected\nCurrent Input Device: Keyboard and Mouse", 3, 3, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		}else if(global.controllerMode == 1){//else if control mode set to bluetooth controlle
			draw_text_transformed_color(display_get_gui_width()/2, yPos - (4 * 3), "Controller Detected\nCurrent Input Device: Controller", 3, 3, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		}
	}
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);