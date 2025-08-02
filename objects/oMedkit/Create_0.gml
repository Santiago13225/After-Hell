///oMedkit Create Event
/*This object represents a medkit.*/
//This event is responsible for initializing medkit values.

depth = -y;//Set depth to its negative y position.

//item = global.item_list2.medkit;//Add medkit to inventory.
if(global.juggernaut){
	heal = 80;
}else {
	heal = 40;//Set amount to heal player by.
}

//Floating
floatDir = 0;
floatSpd = 6;