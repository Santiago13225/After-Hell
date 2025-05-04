///oMouse Step Event
/*This object represents the mouse object.*/
//This event is responsible for handling the mouse object behavior.

if(room == rm_Casino_Level1 || room == rm_CityBlock_Level1 || room == rm_Facility_Level || room == rm_Graveyard_Level || room == rm_House_Level1 || room == rm_Island_Level1 || room == rm_Labyrinth_Level || room == rm_Level1 || room == rm_Mission0 || room == rm_Museum_Level1 || room == rm_Overlook_Level4 || room == rm_Temple_Level1 || room == rm_WaterStation_Level1 || room == rm_Yard_Level1) {
	visible = true;
	cursor_sprite = sUICursor2;
	window_set_cursor(cr_none);
}else if(room == rm_Title_Screen || room == rm_Trademark_Screen || room == rm_Disclaimer_Screen || room == rm_GM_Screen || room == rm_Logo_Screen){
	visible = false;
    window_set_cursor(cr_none);
}else {
	visible = false;
    window_set_cursor(cr_none);
}
/*
if (room_get_name(room) == "rm_Casino_Level1") {
    // Do something for Casino Level 1.
} else {
    // Do something else.
}*/