///oPlayer Draw Event
/*This object represents the player object.*/
//This event is responsible for handling player object drawing.

draw_set_font(fnt8Bit);//Should be 8-bit, see part 10 on YouTube series.
//draw_set_font(global.font2);
//Draw HP
var _healthPercent = oPlayer.hp / oPlayer.maxHp;
var _hpImage = _healthPercent * (sprite_get_number(sPlayerHealth) - 1);
draw_sprite_ext(sPlayerHealth, _hpImage, x, y - sprite_height - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_set_halign(fa_center);
draw_text_transformed(x, y - sprite_height - 12, string(hp), .6, .6, 0);
draw_set_halign(fa_left);
//Draw the weapon behind the player
if aimDir >= 0 && aimDir < 180{
	draw_my_weapon();
}

global.MUSIC = sndTestLevelTheme;

//Draw the player
draw_self();

//Draw the weapon
if aimDir >= 180 && aimDir < 360{
	draw_my_weapon();
}

//Draw HP as a number
//draw_text(x - 6, y - sprite_height - 16, string(hp));
//draw_set_color(c_blue);
//draw_text_transformed(x - 7, y - sprite_height - 12, "HP:" + string(hp), .6, .6, 0);