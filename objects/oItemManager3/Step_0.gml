///oItemManager2 Step Event
/*This object represents an item manager object.*/
//This event is responsible for handling item manager behavior.

//Get the selected item
selected_item = -1;
/*
if(global.controllerMode == 0) {

for (var i = 0; i < array_length(inv); i++){
	//var _xx = screen_bord;
	var _stx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
	var _xx = screen_bord + camera_get_view_x(view_camera[0]);
	var _xxw = screen_bord + camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 96;
	//var _yy = screen_bord + sep * i;
	var _sty = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
	var _yy = screen_bord + camera_get_view_y(view_camera[0]) + sep * i;
	//var _yy = screen_bord + camera_get_view_y(view_camera[0]);
	var _sep = sep;
	
	if mouse_x > _xxw - 60 && mouse_x < _stx && mouse_y > _sty + _sep * i - 64 && mouse_y < _sty + _sep * i{
		selected_item = i;
	}
}
if room != rm_Title_Screen && !instance_exists(oPauseMenu2) && !instance_exists(oTitleMenu2) && !instance_exists(oGameOverScreen2) && !instance_exists(oVictoryScreen2){
	if selected_item != -1{
		//Use an item
		if mouse_check_button_pressed(mb_left){
			inv[selected_item].effect();
		}
		/*
		//drop the item
		if mouse_check_button_pressed(mb_right) && inv[selected_item].can_drop == true
		{
			//get rid of the item
			array_delete(inv, selected_item, 1);
		}*/
/*		
		if mouse_check_button_pressed(mb_right) && inv[selected_item].can_drop == true{
			//remove from inventory
		    var droppedItem = instance_create_depth(oPlayer.x - 1, oPlayer.y + 16, -y, inv[selected_item].droppedItem);
		    droppedItem.item = inv[selected_item];
		    array_delete(inv, selected_item, 1);

		    //Remove the pistol from the player's weapon array
		    if (droppedItem.item == global.item_list2.pistol){
		        removeWeaponFromPlayer(global.WeaponList.pistol);
		    } else if (droppedItem.item == global.item_list2.shotgun){
		        removeWeaponFromPlayer(global.WeaponList.shotgun);
		    } else if (droppedItem.item == global.item_list2.raygun){
				removeWeaponFromPlayer(global.WeaponList.raygun);
			} else if (droppedItem.item == global.item_list2.sniper){
				removeWeaponFromPlayer(global.WeaponList.sniper);
			} else if (droppedItem.item == global.item_list2.assault){
				removeWeaponFromPlayer(global.WeaponList.assault);
			} else if (droppedItem.item == global.item_list2.smg){
				removeWeaponFromPlayer(global.WeaponList.smg);
			} else if (droppedItem.item == global.item_list2.lmg){
				removeWeaponFromPlayer(global.WeaponList.lmg);
			} else if (droppedItem.item == global.item_list2.bazooka){
				removeWeaponFromPlayer(global.WeaponList.bazooka);
			} else if (droppedItem.item == global.item_list2.hshotgun){
		        removeWeaponFromPlayer(global.WeaponList.hshotgun);
		    } else if (droppedItem.item == global.item_list2.hraygun){
				removeWeaponFromPlayer(global.WeaponList.hraygun);
			} else if (droppedItem.item == global.item_list2.hsniper){
				removeWeaponFromPlayer(global.WeaponList.hsniper);
			} else if (droppedItem.item == global.item_list2.hassault){
				removeWeaponFromPlayer(global.WeaponList.hassault);
			} else if (droppedItem.item == global.item_list2.hsmg){
				removeWeaponFromPlayer(global.WeaponList.hsmg);
			} else if (droppedItem.item == global.item_list2.hlmg){
				removeWeaponFromPlayer(global.WeaponList.hlmg);
			} else if (droppedItem.item == global.item_list2.hbazooka){
				removeWeaponFromPlayer(global.WeaponList.hbazooka);
			} else if (droppedItem.item == global.item_list2.ushotgun){
		        removeWeaponFromPlayer(global.WeaponList.ushotgun);
		    } else if (droppedItem.item == global.item_list2.uraygun){
				removeWeaponFromPlayer(global.WeaponList.uraygun);
			} else if (droppedItem.item == global.item_list2.usniper){
				removeWeaponFromPlayer(global.WeaponList.usniper);
			} else if (droppedItem.item == global.item_list2.uassault){
				removeWeaponFromPlayer(global.WeaponList.uassault);
			} else if (droppedItem.item == global.item_list2.usmg){
				removeWeaponFromPlayer(global.WeaponList.usmg);
			} else if (droppedItem.item == global.item_list2.ulmg){
				removeWeaponFromPlayer(global.WeaponList.ulmg);
			} else if (droppedItem.item == global.item_list2.ubazooka){
				removeWeaponFromPlayer(global.WeaponList.ubazooka);
			}
		}
	}
}
}

var gamepadIndex = 0; // Replace with the appropriate gamepad index if using multiple controllers
var selected_item_controller = -1;

if(global.controllerMode == 1) && !instance_exists(oPauseMenu2) && !instance_exists(oTitleMenu2) && !instance_exists(oGameOverScreen2) && !instance_exists(oVictoryScreen2) {
// Controller support
// Check controller input to highlight items
if (gamepad_button_check(gamepadIndex, gp_padl)) {
    selected_item_controller = 0; // Highlight the first item with dpad left
}
if (gamepad_button_check(gamepadIndex, gp_padu)) {
    selected_item_controller = 1; // Highlight the second item with dpad up
}
if (gamepad_button_check(gamepadIndex, gp_padr)) {
    selected_item_controller = 2; // Highlight the third item with dpad right
}
if (gamepad_button_check(gamepadIndex, gp_padd)) {
    selected_item_controller = 3; // Highlight the fourth item with dpad down
}
selected_item = selected_item_controller;
//selected_item = (selected_item_controller != -1) ? selected_item_controller : selected_item_controller;
	if((selected_item != -1) && gamepad_button_check_pressed(gamepadIndex, gp_face1) && (selected_item <= array_length(inv) - 1))
	{
		inv[selected_item].effect();
	} else {
	        // Play the beeping sound when an empty slot is selected
	        if (gamepad_button_check_pressed(gamepadIndex, gp_padl) || gamepad_button_check_pressed(gamepadIndex, gp_padr) ||
	            gamepad_button_check_pressed(gamepadIndex, gp_padu) || gamepad_button_check_pressed(gamepadIndex, gp_padd)) {
	            //audio_play_sound(sndBeep, 8, false);
	            oSFX.beepSnd = true;
	        }
	}
	if((selected_item != -1) && gamepad_button_check_pressed(gamepadIndex, gp_face2) && (selected_item <= array_length(inv) - 1) && inv[selected_item].can_drop == true)
	{
		//remove from inventory
		//instance_create_depth(oPlayer.x - 1, oPlayer.y + 16, -y, inv[selected_item].droppedItem);
		var droppedItem = instance_create_depth(oPlayer.x - 1, oPlayer.y + 16, -y, inv[selected_item].droppedItem);
		droppedItem.item = inv[selected_item];
		array_delete(inv, selected_item, 1);
		
		if (droppedItem.item == global.item_list2.pistol){
		        removeWeaponFromPlayer(global.WeaponList.pistol);
		    } else if (droppedItem.item == global.item_list2.shotgun){
		        if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
		    } else if (droppedItem.item == global.item_list2.raygun){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.sniper){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.assault){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.smg){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.lmg){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.bazooka){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.hshotgun){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
		    } else if (droppedItem.item == global.item_list2.hraygun){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.hsniper){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.hassault){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.hsmg){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.hlmg){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.hbazooka){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.ushotgun){
		        if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
		    } else if (droppedItem.item == global.item_list2.uraygun){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.usniper){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.uassault){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.usmg){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.ulmg){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			} else if (droppedItem.item == global.item_list2.ubazooka){
				if(instance_exists(oPlayer)) {
				    oPlayer.selectedWeapon = 0;//Set the index to 0 to quickly equip the pistol
				    oPlayer.weapon = oPlayer._playerWeapons[oPlayer.selectedWeapon];//Optionally, update the weapon immediately
				}
				array_delete(global.PlayerWeapons, selected_item_controller, 1);
			}
	} else {
	        // Play the beeping sound when an empty slot is selected
	        if (gamepad_button_check_pressed(gamepadIndex, gp_padl) || gamepad_button_check_pressed(gamepadIndex, gp_padr) ||
	            gamepad_button_check_pressed(gamepadIndex, gp_padu) || gamepad_button_check_pressed(gamepadIndex, gp_padd)) {
	            //audio_play_sound(sndBeep, 8, false);
	            oSFX.beepSnd = true;
	        }
	}
}*/