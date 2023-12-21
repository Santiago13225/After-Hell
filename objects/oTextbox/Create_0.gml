///oTextbox Create Event
/*This object creates a textbox on the bottom of the screen that the player
can interact with in game.*/
//This event is responsible for setting up parameters needed for the textbox object.

depth = -9999;//Sets the drawing depth for this textbox object.

//Textbox Parameters
textbox_width = 200;//Width of the textbox.
textbox_height = 64;//Height of the textbox.
border = 8;//Border size around the text.
line_sep = 12;//Line separation within the textbox.
line_width = textbox_width - border*2;//Calculating the width available for text.
txtb_spr = sMenu;//The sprite to be used for the textbox appearance.
txtb_img = 0;//The current image index for animation.
txtb_img_spd = 6/60;//Animation speed for changing textbox images.

//Text Parameters
page = 0;//Current page of text being displayed.
page_number = 0;//Total number of pages.
text[0] = "";//Initialize text on the first page.
text_length[0] = string_length(text[0]);//Store the length of the text.
draw_char = 0;//Current character being drawn.
text_spd = 1;//Text drawing speed.

//Options
option[0] = "";//Initialize the first option text.
option_link_id[0] = -1;//Initialize the linked action ID.
option_pos = 0;//Position of the selected option.
option_number = 0;//Total number of options.

setup = false;//Flag to indicate if the textbox is set up.