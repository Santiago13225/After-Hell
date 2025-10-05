//Count connected controllers each step
var count = 0;

//Check if any controller is connected
for(var i = 0; i < 4; i++) { 
	if(gamepad_is_connected(i)) {
		count++;
	}
}
//controller_count = count;

//Detect changes
if(count > prev_controller_count) {
	//A controller was added
	if(prev_controller_count == 0) {
		//First ever controller connected
		audio_play_sound(sndConnect, 10, false);
		//audio_play_sound(sndFirstConnect, 10, false);
	}else {
		//Additional controllers
		audio_play_sound(sndConnect, 10, false);
	}
}else if(count < prev_controller_count) {
	//A controller was removed
	audio_play_sound(sndDisconnect, 10, false);
	
	if(instance_exists(oPlayer) && (room == rm_Tutorial_Level || room == rm_House_Level1 || room == rm_Facility_Level || room == rm_Temple_Level1 || room == rm_Overlook_Level4 || room == rm_Island_Level1 || room == rm_Casino_Level1 || room == rm_Labyrinth_Level || room == rm_Graveyard_Level || room == rm_Museum_Level1 || room == rm_WaterStation_Level1 || room == rm_CityBlock_Level1 || room == rm_Yard_Level1 || room == rm_Level1 || room == rm_Mission0)) {//replace with your actual gameplay room check
        if(global.controllerMode == 1 && count == 0) {
			if(!instance_exists(oPauseMenu2)) {
	            if(!instance_exists(oScoreboard)) {
					if(!instance_exists(oPauseMenu2)) {
		                global.controllerMode = 0;//Switch back to keyboard/mouse
						global.dialog_active = true;//disable silhouette drawing
						//audio_play_sound(sndBeep, 8, false);
						var _pause = instance_create_depth(0, 0, 0, oPauseMenu2);//Jump straight to Settings tab in pause menu
						with(_pause) {
							menu_level = 1;//jump directly into Settings
							pos = 0;       //optional: highlight first option in Settings
						}
		            }
				}else if(instance_exists(oScoreboard)){
					if(!instance_exists(oPauseMenu2)) {
						instance_destroy(oScoreboard);
						global.controllerMode = 0;//Switch back to keyboard/mouse
						global.dialog_active = true;//disable silhouette drawing
						//audio_play_sound(sndBeep, 8, false);
						var _pause = instance_create_depth(0, 0, 0, oPauseMenu2);//Jump straight to Settings tab in pause menu
						with(_pause) {
							menu_level = 1;//jump directly into Settings
							pos = 0;       //optional: highlight first option in Settings
						}
					}
				}
			}else if(instance_exists(oPauseMenu2)){
				global.controllerMode = 0;//Switch back to keyboard/mouse
				with(oPauseMenu2) {
					menu_level = 1;//jump directly into Settings
					pos = 0;       //optional: highlight first option in Settings
				}
			}
        }
    }	
}

//Update counts
prev_controller_count = controller_count;
controller_count = count;