///oSMGWallbuy Create Event
/*This object represents the smg wallbuy object.*/
//This event is responsible for setting some variables for the smg wallbuy object.
depth = -bbox_bottom;
if(global.controllerMode == 0){
	text_id = "MedkitWallbuy";
}else {
	text_id = "MedkitWallbuyC";
}
//created = false;

//popup_id = instance_create_layer(x, y - 32, layer, oPopup);//Hint
radius = 32;
has_been_interacted = false;//We have not interacted with anything yet
//popup_id.visible = false;//Make popup invisible
/*with(popup_id){////make popup invisble by default
	visible = false;
}*/