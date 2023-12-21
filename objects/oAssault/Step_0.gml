///oAssault Step Event
/*This object represents the assault object.*/
//This event is responsible for handling assault object behavior.
//Pause self
if screen_pause(){
	exit;
}

//Float in place
floatDir += floatSpd;
y = ystart + lengthdir_y(2, floatDir);
//y = ystart + dsin(floatDir)*2;//Alternative to line above.

sprite_index = item.sprite;

//Assign item to weapon
//Add weapon to player's list
if place_meeting(x, y, oPlayer){
	//array_push(global.PlayerWeapons, weapon);
    if item_add(item) == true{
        //Add the weapon to global.PlayerWeapons
        //array_push(global.PlayerWeapons, weapon);
		array_push(global.PlayerWeapons,  global.WeaponList.assault);
        //Set as the player's weapon
        audio_play_sound(sndReload, 8, false);
        oPlayer.selectedWeapon = array_length(global.PlayerWeapons) - 1;
        instance_destroy();//Destroy the object.
    }
}