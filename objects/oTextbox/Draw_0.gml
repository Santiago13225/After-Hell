///oTextbox Draw Event
/*This object creates a textbox on the bottom of the screen that the player
can interact with in game.*/
//This event is responsible for handling the drawing of the textbox object.
if(global.controllerMode == 0){
	accept_key = keyboard_check_pressed(vk_space);//Store the space key as a variable.
}
if(global.controllerMode == 1){
	accept_key = gamepad_button_check_pressed(0, gp_face4);
}

textbox_x = camera_get_view_x(view_camera[0]) + 180;//X-position of the textbox.
//textbox_x = (camera_get_view_x(view_camera[0])/2) + (camera_get_view_width(view_camera[0])/2) -textbox_width/4;
textbox_y = camera_get_view_y(view_camera[0]) + 296;//Y-position of the textbox.

//Setup
if setup == false
{
	setup = true;
	draw_set_font(global.font_main);//Set the font for drawing.
	draw_set_valign(fa_top);//Set vertical alignment.
	draw_set_halign(fa_left);//Set horizontal alignment.
	
	//Loop Through the Pages
	for(var p = 0; p < page_number; p++)
	{//For each page...
		text_length[p] = string_length(text[p]);//Find how many characters are on each page and store that number in the "text_length" array.
		text_x_offset[p] = 44;//Get the x-position for the textbox.
		//no character(center the textbox)
	}
}
	
//Typing the Text
if draw_char < text_length[page]
{//If the current character index value is less than the "length" of the text.
	draw_char += text_spd;//Typing animation at stored speed.
	draw_char = clamp(draw_char, 0, text_length[page]);//Clamp the typing position.
}

//Flip Through Pages
if accept_key
{//If the accept key has been pressed.
	if draw_char == text_length[page]
	{//If the typing is done.
		if page < page_number - 1{//If the page is less than the page number.
			page++;//Go to the next page.
			draw_char = 0;//Reset draw_char index.
		}else {//Destroy Textbox
			//Link text for options
			if option_number > 0 {//If there are options.
				create_textbox(option_link_id[option_pos]);//Create a textbox for that specific option.
			}
			instance_destroy();//Destroy the textbox.
		}
	}else {//If not done typing.
		draw_char = text_length[page];//Set the draw_char variable again for safety.
	}
}

//Draw the textbox
var _txtb_x = textbox_x + text_x_offset[page];//X-position of the textbox.
var _txtb_y = textbox_y;//Y-position of the textbox.

txtb_img += txtb_img_spd;//Animation speed for the textbox.
txtb_spr_w = sprite_get_width(txtb_spr);//Width of the sprite for the textbox.
txtb_spr_h = sprite_get_height(txtb_spr);//Width of the sprite for the textbox.

draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);//Back of the textbox.

//Options
if draw_char == text_length[page] && page == page_number - 1
{//If we are at the point where the last text has been printed and the last page has been printed.
	//Option Selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);//Select options.
	option_pos = clamp(option_pos, 0, option_number-1);//Clamp select option.
	
	//Draw the Options
	var _op_space = 15;//Spacing between options.
	var _op_bord = 4;//Border for the options.
	for(var op = 0; op < option_number; op++)
	{//For each option...
		//Draw the option box.
		var _o_w = string_width(option[op]) + _op_bord*2;//Set the width of the option box.
		draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + 16, _txtb_y - _op_space*option_number + _op_space*op, _o_w/txtb_spr_w, (_op_space-1)/txtb_spr_h, 0, c_white, 1);//Draw the option box.
	
		//Arrow
		if option_pos == op
		{//Wherever the position is...
			draw_sprite(sArrow, 0, _txtb_x,  _txtb_y - _op_space*option_number + _op_space*op);//Draw the arrow for the selected option.
		}
		//The Option Text
		draw_text(_txtb_x + 16 + _op_bord, _txtb_y - _op_space*option_number + _op_space*op + 1, option[op]);//Draw the option text.
	}
}

//Draw the Text
var _drawtext = string_copy(text[page], 1, draw_char);//Prepare the text to be drawn.
draw_text_ext(_txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width);//Draw the text.