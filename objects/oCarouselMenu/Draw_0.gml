var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//set some vars
var pr, i;
i = 0;

pr = ds_priority_create();

//add menu items to the priority queue
repeat(image_number){
	ds_priority_add(pr, i, lengthdir_y(1, (rot - 90) + i * (360 / image_number)));
	i += 1;
}

//draw the menu
/*
repeat(image_number){
	i = ds_priority_delete_min(pr);
	draw_sprite_ext(sprite_index, i, menu_x + lengthdir_x(menu_width / 2,
	(rot - 90) + i * (360 / image_number)), menu_y + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)), 1 + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 1 + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 0, c_white, 1);
}*/

//Normalize the selection index to a positive value between 0 and (image_number - 1)
var normSelected = -selected mod image_number;
if (normSelected < 0) {
    normSelected += image_number;
}

repeat(image_number){
	i = ds_priority_delete_min(pr);
	draw_sprite_ext(sprite_index, i, menu_x + lengthdir_x(menu_width / 2,
	(rot - 90) + i * (360 / image_number)), menu_y + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)), 1 + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 1 + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 0, 
	(i == normSelected) ? c_white : merge_color(c_black, c_white, 0.05),
	1);
}

//remove ds_priority
ds_priority_destroy(pr);

//draw text based on what item you have selected
var text;

switch(item){
	case 0: text = "House" break;
	case 1: text = "Facility" break;
	case 2: text = "Temple" break;
	case 3: text = "Overlook" break;
	case 4: text = "Island" break;
	case 5: text = "Casino" break;
	case 6: text = "Labyrinth" break;
	case 7: text = "Graveyard" break;
	case 8: text = "Museum" break;
	case 9: text = "Water Station" break;
	case 10: text = "City Block" break;
	case 11: text = "The Yard" break;
	case 12: text = "Test_Level" break;
	default: text = "Help!" break;
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_text_transformed(menu_x, menu_y + menu_height/2 + 45, text, 1, 1, 0);
draw_text_transformed(menu_x, menu_y + menu_height/2 + 60, "Press [Space] to Select", 1, 1, 0);
draw_text_transformed(menu_x, menu_y + menu_height/2 + 75, "Press [Backspace] to Go Back", 1, 1, 0);
//draw_text(menu_x, menu_y + menu_height/2 + 30, text);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

//Choose positions for the arrows relative to your menu
//Adjust these values to match your carousel layout.
/*
var leftX = menu_x - 50;//50 pixels to the left of the menu
var leftY = menu_y + (menu_height / 2);
var rightX = menu_x + 50;//50 pixels to the right of the menu
var rightY = menu_y + (menu_height / 2);*/

var leftX = menu_x - 110;//50 pixels to the left of the menu
var leftY = menu_y + (menu_height / 2) + 60;
var rightX = menu_x + 110;//50 pixels to the right of the menu
var rightY = menu_y + (menu_height / 2) + 60;

//Option 1: Animate using scale
var leftScale = 1 + arrowLeftAnim * 0.3;//30% scale bump at full animation
var rightScale = 1 + arrowRightAnim * 0.3;//30% scale bump at full animation

//draw_sprite_ext(sLeftArrow, 0, leftX, leftY, leftScale, leftScale, 0, c_white, 1);
//draw_sprite_ext(sRightArrow, 0, rightX, rightY, rightScale, rightScale, 0, c_white, 1);
draw_sprite_ext(sLeftArrow, 0, leftX, leftY, leftScale, leftScale, 0, merge_color(c_white, c_yellow, arrowLeftAnim), 1);
draw_sprite_ext(sRightArrow, 0, rightX, rightY, rightScale, rightScale, 0, merge_color(c_white, c_yellow, arrowRightAnim), 1);

//Option 2: Animate using transparency (if you prefer)
//var leftAlpha = 0.5 + arrowLeftAnim * 0.5;   // from 0.5 to 1.0
//var rightAlpha = 0.5 + arrowRightAnim * 0.5;   // from 0.5 to 1.0
//draw_sprite_ext(sLeftArrow, 0, leftX, leftY, 1, 1, 0, c_white, leftAlpha);
//draw_sprite_ext(sRightArrow, 0, rightX, rightY, 1, 1, 0, c_white, rightAlpha);