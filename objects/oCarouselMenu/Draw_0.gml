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
repeat(image_number){
	i = ds_priority_delete_min(pr);
	draw_sprite_ext(sprite_index, i, menu_x + lengthdir_x(menu_width / 2,
	(rot - 90) + i * (360 / image_number)), menu_y + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)), 1 + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 1 + lengthdir_y(menu_height / 2,
	(rot - 90) + i * (360 / image_number)) / (menu_height * 2), 0, c_white, 1);
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

draw_text_transformed(menu_x, menu_y + menu_height/2 + 30, text, 1, 1, 0);
draw_text_transformed(menu_x, menu_y + menu_height/2 + 60, "Press [Space] to Select", 1, 1, 0);
draw_text_transformed(menu_x, menu_y + menu_height/2 + 90, "Press [Backspace] to Go Back", 1, 1, 0);
//draw_text(menu_x, menu_y + menu_height/2 + 30, text);

draw_set_valign(fa_top);
draw_set_halign(fa_left);