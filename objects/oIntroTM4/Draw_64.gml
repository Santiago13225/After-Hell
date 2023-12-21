///oIntroTM2 Draw GUI Event
/*This object represents an introTM2 object.*/
//This event is responsible for handling introTM2 object draw GUI behavior.
draw_sprite_ext(sPixel, 0, 0, 0, 5000, 240, 0, c_black, 1);
draw_sprite_ext(sPixel, 0, 0, 840, 5000, 240, 0, c_black, 1);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fnt8Bit);

//draw_text(960, 840, print);
draw_text_transformed(960, 840, print, 2.5, 2.5, 0);

if(holdspace > 0) {
	if (global.controllerMode == 0){
		draw_text_transformed(960, 1040, "Hold space to skip.", 2.5, 2.5, 0);
	}else {
		draw_text_transformed(960, 1040, "Hold left face button to skip.", 2.5, 2.5, 0);
	}
	draw_set_alpha(1);
}

draw_sprite_ext(sPixel, 0, 0, 0, 5000, 5000, 0, c_black, a);