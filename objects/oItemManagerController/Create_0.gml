///oItemManagerController Create Event
/*This object represents an item manager controller.*/
//This event is responsible for setting some variables for the item manager controller.

var gamepadIndex = 0;//Replace with the appropriate gamepad index if using multiple controllers.
var selected_item_controller = -1;

//Check if a gamepad is connected and then handle the controller input.
if (gamepad_is_connected(gamepadIndex)){
    //Check controller input to highlight items
    if (gamepad_button_check(gamepadIndex, gp_padl)) {
        selected_item_controller = 0;//Highlight the first item with dpad left.
    }
    if (gamepad_button_check(gamepadIndex, gp_padu)) {
        selected_item_controller = 1;//Highlight the second item with dpad up.
    }
    if (gamepad_button_check(gamepadIndex, gp_padr)) {
        selected_item_controller = 2;//Highlight the third item with dpad right.
    }
    if (gamepad_button_check(gamepadIndex, gp_padd)) {
        selected_item_controller = 3;//Highlight the fourth item with dpad down.
    }

    if (selected_item_controller != -1 && gamepad_button_check_pressed(gamepadIndex, gp_face1)){
            inv[selected_item_controller].effect();
    }

    //Drop the item with the controller's selected item.
    if (gamepad_button_check_pressed(gamepadIndex, gp_face2) && selected_item_controller != -1 && inv[selected_item_controller].can_drop) {
        var droppedItem = instance_create_depth(oPlayer.x - 1, oPlayer.y + 16, -y, inv[selected_item_controller].droppedItem);
        droppedItem.item = inv[selected_item_controller];
        array_delete(inv, selected_item_controller, 1);

        //Remove the pistol from the player's weapon array
        //... (your existing code to remove the weapon from the player's array)
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
		}	
    } else {
        //Play the beeping sound when an empty slot is selected
        if (gamepad_button_check_pressed(gamepadIndex, gp_padl) || gamepad_button_check_pressed(gamepadIndex, gp_padr) ||
            gamepad_button_check_pressed(gamepadIndex, gp_padu) || gamepad_button_check_pressed(gamepadIndex, gp_padd)) {
            oSFX.beepSnd = true;
        }
    }
}