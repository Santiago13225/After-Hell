var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

//draw a black rectangle over the screen
//draw_set_alpha(1);
//draw_rectangle_color(_camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false);

//draw the text
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_set_font(global.font_main);

//"Paused"
//draw_text_transformed(_camX + _camW/2, _camY + _camH/2 - 64, "- Paused -", 1, 1, 0);

//reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Dynamically get width and height of menu
var _new_w = 0;

/*for(var i = 0; i < op_length; i++){//Old code loop
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}*/
for(var i = 0; i < op_length; i++){//new code loop
	var text_to_measure = option[menu_level, i];

	//Lock width for Survival Mode preset option
	if(menu_level == 2 && i == 0){
		text_to_measure = preset_longest_text;
	}
	
	//Lock width for Survival Mode perk option
	if(menu_level == 3 && i == 0){
		text_to_measure = perk_longest_text;
	}

	//Lock width for Settings menu Controls option
	if(menu_level == 6 && i == 2){
		text_to_measure = control_longest_text;
	}

	var _op_w = string_width(text_to_measure);
	_new_w = max(_new_w, _op_w);
}
width = _new_w + (op_border * 2);

//dynamically get width and height of menu
//height = op_border * 2 + ((string_height(option[0,0]) + op_space) * op_length/2);
height = (op_border * 2) + ((string_height(option[0,0]) + (op_space/4)) * (op_length));
//height = op_border*2 + ((sprite_get_height(sMainFont)+op_space) * (op_length));

//Center menu
//x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2) - (width/2);
x = _camX + _camW/2 - (width/2);
//x = _camX + _camW/2 - (width/2) - 0.75;
//x = x + oPlayer.x - camera_get_view_width(view_camera[0])/2;
//y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2) - (height/2);
y = _camY + _camH/2 - (height/2);
//y = y;

//Draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

if(menu_level == 6) {
    //Define bar dimensions (adjust these values as needed)
    var barX = x + op_border;//start
    var barY = y + op_border + op_space * 0;//for Music Volume (first option)
    //var maxBarWidth = 100;//maximum width of the bar
	var maxBarWidth = _new_w;
    var barHeight = string_height(option[6,0]) - 1;//height of the bar
	//var barHeight = string_height(option[menu_level, i]);//height of the bar
	draw_set_alpha(0.5);
    //Draw Music Volume bar
    //Calculate filled width for music volume (global.musicvolume is between 0 and 1)
    var fillWidth = global.musicvolume * maxBarWidth;
    
    //Draw the bar outline
    draw_set_color(c_black);
    draw_rectangle(barX, barY, barX + maxBarWidth, barY + barHeight, false);
    
    //Draw the filled portion(for example, green)
    draw_set_color(c_lime);
    draw_rectangle(barX, barY, barX + fillWidth, barY + barHeight, false);
    
    //Reset color
    draw_set_color(c_white);
    
    //Now for Sfx Volume (second option)
    barY = y + op_border + op_space * 1;//shift down by one option spacing
    fillWidth = global.sfxvolume * maxBarWidth;
    
    //Draw Sfx Volume bar outline
    draw_set_color(c_black);
    draw_rectangle(barX, barY, barX + maxBarWidth, barY + barHeight, false);
    
    //Draw the filled portion (green)
    draw_set_color(c_lime);
    draw_rectangle(barX, barY, barX + fillWidth, barY + barHeight, false);
    
    //Reset color
    draw_set_color(c_white);
}
draw_set_alpha(1);

//Draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < op_length; i++){
	var _c = c_white;
	
	//Make "Controls" gray if locked
    if(menu_level == 6 && i == 2 && oControllerIndicator.controller_count == 0) {
        if(pos == i){
			draw_sprite_ext(sPixel, 0, x, y + op_border + op_space * i, width, string_height(option[menu_level, i]), 0, c_red, 0.5);
		}
		_c = c_gray;//gray
    }else if(pos == i){
		draw_sprite_ext(sPixel, 0, x, y + op_border + op_space * i, width, string_height(option[menu_level, i]), 0, c_red, 0.5);
		_c = c_yellow;
	}
	draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, 1);
}
//width = _new_w + (op_border * 2);
//height = op_border * 2 + string_height(option[0,0]) + (op_length + 1) * op_space;
//height = (op_border * 2) + sprite_get_height(sMainFont) + ((op_length + 1) * op_space);

//Draw preset arrows
if(menu_level == 2){
	var arrowY = y + 14;
	var leftX = x + 12;
	var rightX = x + width - 12;

	var leftScale = 0.5 + arrowLeftAnim * 0.3;
	var rightScale = 0.5 + arrowRightAnim * 0.3;

	draw_sprite_ext(sLeftArrow, 0, leftX, arrowY, leftScale, leftScale, 0,
		merge_color(c_white, c_yellow, arrowLeftAnim), 1);

	draw_sprite_ext(sRightArrow, 0, rightX, arrowY, rightScale, rightScale, 0,
		merge_color(c_white, c_yellow, arrowRightAnim), 1);
}

if(menu_level == 2 && pos == 0){
	var description;

	switch(preset_index){
		case 0: description = "No adjustments made. All enemies spawn as normal."; break;
		case 1: description = "Weaker enemies removed. No skeletons and zombies will spawn."; break;
		case 2: description = "No skeletons, zombies, and wraiths will spawn."; break;
		case 3: description = "Only elite enemies spawn."; break;
		case 4: description = "Only demons spawn."; break;
		case 5: description = "Only wraiths spawn."; break;
		case 6: description = "Only enemies that deal extra damage spawn."; break;
		case 7: description = "Only projectile-shooting enemies spawn."; break;
		case 8: description = "Only necromancers spawn."; break;
		case 9: description = "Only dogs spawn."; break;
		case 10: description = "Only fast enemies spawn."; break;
		case 11: description = "Only zombies spawn."; break;
		case 12: description = "Only skeletons spawn."; break;
		case 13: description = "Only basic skeletons spawn."; break;
		case 14: description = "No wraiths, demons, and elites will spawn."; break;
		case 15: description = "Stronger enemies removed. No demons and elites will spawn."; break;
	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(x + width/2, y + height + 20, "Game Mode Description:\n" + description);
	draw_set_halign(fa_left);
}

if(menu_level == 3){
	var arrowY = y + 14;
	var leftX = x + 12;
	var rightX = x + width - 12;

	var leftScale = 0.5 + arrowLeftAnim * 0.3;
	var rightScale = 0.5 + arrowRightAnim * 0.3;

	draw_sprite_ext(sLeftArrow, 0, leftX, arrowY, leftScale, leftScale, 0,
		merge_color(c_white, c_yellow, arrowLeftAnim), 1);

	draw_sprite_ext(sRightArrow, 0, rightX, arrowY, rightScale, rightScale, 0,
		merge_color(c_white, c_yellow, arrowRightAnim), 1);
}

if(menu_level == 3 && pos == 0){
    var description;

    switch(perk_index){
        case 0: description = "No modifiers applied."; break;
        case 1: description = "Applies a 25% fire rate boost to all weapons."; break;
        case 2: description = "Gives the player a second health bar that can regenerate over time."; break;
        case 3: description = "Doubles player health and boosts medkit healing effects."; break;
        case 4: description = "Increases player movement speed by 25%."; break;
        case 5: description = "Improves enemy loot drops."; break;
        case 6: description = "Allows the player to attract nearby loot drops."; break;
        case 7: description = "Gives the player complete immunity to explosive damage."; break;
        case 8: description = "Gives the player all beneficial modifiers."; break;
        case 9: description = "Gives the player all detrimental modifiers."; break;
        case 10: description = "Player HP set to 1. One hit and it's game over."; break;
        case 11: description = "No loot drops from enemies."; break;
        case 12: description = "Reduces player movement speed by 25%."; break;
        case 13: description = "Halves player health and weakens medkit healing effects."; break;
        case 14: description = "Disables medkits. No health regeneration allowed."; break;
        case 15: description = "Applies a 25% fire rate reduction to all weapons."; break;
    }
    draw_set_halign(fa_center);
	draw_set_valign(fa_top);
    draw_text(x + width/2, y + height + 20, "Modifier Description:\n" + description);
    draw_set_halign(fa_left);
}