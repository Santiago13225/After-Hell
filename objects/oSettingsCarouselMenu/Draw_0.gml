var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

var pr = ds_priority_create();
var i = 0;

repeat(image_number) {
	ds_priority_add(pr, i, lengthdir_y(1, (rot - 90) + i * (360 / image_number)));
    i += 1;
}

var normSelected = -selected mod image_number;
if(normSelected < 0) {
    normSelected += image_number;
}

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

//Draw match setting label
var text;
switch(item) {
    case 0: text = "Standard Threat"; break;
    case 1: text = "Elite Invasion"; break;
    case 2: text = "Deadlier Forces"; break;
	case 3: text = "Final Hour"; break;
    case 4: text = "Hell Unleashed"; break;
    case 5: text = "Wailing Shadows"; break;
	case 6: text = "Bloodthirst"; break;
    case 7: text = "Projectile Storm"; break;
    case 8: text = "Masters of the Dead"; break;
	case 9: text = "Hounds of Horror"; break;
    case 10: text = "Rapid Terror"; break;
    case 11: text = "Plague of the Dead"; break;
	case 12: text = "Rattle and Bone"; break;
    case 13: text = "Bare Bones"; break;
    case 14: text = "Dulled Danger"; break;
	case 15: text = "Beginner's Curse"; break;
    default: text = "???"; break;
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_text_transformed(menu_x, menu_y + menu_height / 2 + 45, text, 1, 1, 0);
draw_text_transformed(menu_x, menu_y + menu_height / 2 + 60, "Press [Space] to Select", 1, 1, 0);
draw_text_transformed(menu_x, menu_y + menu_height / 2 + 75, "Press [Backspace] to Go Back", 1, 1, 0);

//Draw arrows
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
