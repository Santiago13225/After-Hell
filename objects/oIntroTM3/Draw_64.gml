///oIntro Draw GUI Event
/*This object represents an intro object.*/
//This event is responsible for handling intro object draw GUI behavior.
draw_sprite_ext(sPixel, 0, 0, 0, 5000, 240, 0, c_black, 1);
draw_sprite_ext(sPixel, 0, 0, 840, 5000, 240, 0, c_black, 1);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
//draw_set_font(fnt8Bit);
draw_set_font(global.font_main);

//draw_text(960, 840, print);
draw_text_transformed(960, 840, print, 2.5, 2.5, 0);

if(holdspace > 0){
	if(global.controllerMode == 0){
		draw_set_font(global.font_main);
		draw_text_transformed(960, 1040, "Hold [Space] to Skip", 2.5, 2.5, 0);
	}else {
		draw_set_font(global.fontController);
		draw_text_transformed(960, 1040, "Hold [@] to Skip", 2.5, 2.5, 0);
	}
	draw_set_alpha(1);
}

//Calculate seconds remaining (using ceil to round up)
var seconds_left = ceil(skipTimer / 60);

//Draw the countdown text at the bottom of the screen (adjust x, y as needed)
draw_text_transformed(960, 200, "Match Starts In: " + string(seconds_left) + "s", 2.5, 2.5, 0);

draw_sprite_ext(sPixel, 0, 0, 0, 5000, 5000, 0, c_black, a);