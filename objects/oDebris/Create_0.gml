///oDebris Create Event
/*This object represents debris.*/
//This event is responsible for setting debris variables for interaction.
depth = -y;
if(global.controllerMode == 0){
	text_id = "Debris";//Textbox dialogue.
}else {
	text_id = "DebrisC";
}

radius = 32;
has_been_interacted = false;//We have not interacted with anything yet

created = false;//Variable used for textbox creation.