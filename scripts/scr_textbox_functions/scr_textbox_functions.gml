/// @function				scr_text(_text);
/// @param {string} text	The string that will be shown in the textbox.
/// @description            Show a text message in a textbox whenever the function is called.
function scr_text(_text){
	//scr_set_defaults_for_text();
	text[page_number] = _text;//Store the text for display.
	page_number++;//Increment the page number for the next text.
}

/// @function				scr_option(_option, _link_id);
/// @param {string} option	The string used to describe dialog options in selection.			
/// @param {int} link_id	The identifier for the linked action when this option is chosen.
/// @description			Create dialog based on the option that the player chooses.	
function scr_option(_option, _link_id){
	option[option_number] = _option;//Store the option's text.
	option_link_id[option_number] = _link_id;//Store the link identifier.
	option_number++;//Increment the option number for the next option.
}

/// @function				create_textbox(_text_id);
/// @param {string} text_id	The string used to identify which dialog to print out.
/// description				Create the textbox to be shown in game.
function create_textbox(_text_id){
	with(instance_create_depth(0, 0, -9999, oTextbox2)){//Create textbox instance at a certain depth.
		scr_game_text(_text_id);//Call the scr_game_text function.
	}
}