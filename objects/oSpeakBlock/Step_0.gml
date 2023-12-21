///oSpeakBlock Step Event
/*This object creates a clickable speakbox that the player can 
interact with in game.*/
//This event is responsible for responding to a mouse click event.

//var _s = id;

if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)//If the mouse is in position and a left-click happens.
{
	create_textbox(text_id);//Creates a textbox with the given textbox id.
}