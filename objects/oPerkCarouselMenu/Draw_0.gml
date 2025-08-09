var pr = ds_priority_create();
var i = 0;

repeat(image_number) {
    ds_priority_add(pr, i, lengthdir_y(1, (rot - 90) + i * (360 / image_number)));
    i += 1;
}

var normSelected = -selected mod image_number;
if (normSelected < 0) normSelected += image_number;

repeat(image_number) {
	i = ds_priority_delete_min(pr);
	draw_sprite_ext(sprite_index, i, menu_x + lengthdir_x(menu_width / 2, 
	(rot - 90) + i * (360 / image_number)), menu_y + lengthdir_y(menu_height / 2, 
	(rot - 90) + i * (360 / image_number)), 1 + lengthdir_y(menu_height / 2, 
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 1 + lengthdir_y(menu_height / 2, 
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 0,
	(i == normSelected) ? c_white : merge_color(c_black, c_white, 0.05),
	1);
}
ds_priority_destroy(pr);

//Perk name text
var text;
switch(item) {
	case 0: text = "None"; break;
	case 1: text = "Rapid Fire"; break;
	case 2: text = "Energy Shield"; break;
	case 3: text = "Toughness"; break;
	case 4: text = "Lightweight"; break;
	case 5: text = "Extra Luck"; break;
	case 6: text = "Flak Jacket"; break;
	default: text = "???"; break;
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed(menu_x, menu_y + menu_height / 2 + 45, text, 1, 1, 0);
draw_text_transformed(menu_x, menu_y + menu_height / 2 + 60, "Press [Space] to Select", 1, 1, 0);
draw_text_transformed(menu_x, menu_y + menu_height / 2 + 75, "Press [Backspace] to Go Back", 1, 1, 0);

//Draw animated arrows
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var leftX = menu_x - 110;
var leftY = menu_y + (menu_height / 2) + 60;
var rightX = menu_x + 110;
var rightY = menu_y + (menu_height / 2) + 60;

var leftScale = 1 + arrowLeftAnim * 0.3;
var rightScale = 1 + arrowRightAnim * 0.3;

draw_sprite_ext(sLeftArrow, 0, leftX, leftY, leftScale, leftScale, 0, merge_color(c_white, c_yellow, arrowLeftAnim), 1);
draw_sprite_ext(sRightArrow, 0, rightX, rightY, rightScale, rightScale, 0, merge_color(c_white, c_yellow, arrowRightAnim), 1);
