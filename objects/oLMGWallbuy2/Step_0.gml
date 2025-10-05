///oSMGWallbuy Step Event
/*This object represents the smg wallbuy object.*/
//This event is responsible for handling smg wallbuy behavior.
if(!has_been_interacted){//If we have not interacted with anything yet
	if(collision_circle(x, y, radius, oPlayer, false, true)){//If player is inside circle
		has_been_interacted = true;
		//image_blend = c_yellow;
		if(!audio_is_playing(sndLMG2500)){
			audio_play_sound(sndLMG2500, 10, false);
		}
		if(!instance_exists(oTextbox2)){
			if(global.controllerMode == 0){
				create_textbox("LMGWallbuy");
			}else {
				create_textbox("LMGWallbuyC");
			}
			//create_textbox(text_id);
		}
		//popup_id.visible = true;//Make popup visible
	}
}

if(!collision_circle(x, y, radius, oPlayer, false, true)){//if player outside of circle
	has_been_interacted = false;//reset
	//instance_destroy(oTextbox2);//Destroy the textbox.
	//popup_id.visible = false;//Make popup invisible
}