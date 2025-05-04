///oUltraSniper Step Event
/*This object represents the ultra sniper.*/
//This event is responsible for handling ultra sniper object behavior.

//Pause Self
if screen_pause(){
	exit;
}

//Float in place
floatDir += floatSpd;
y = ystart + lengthdir_y(2, floatDir);
//y = ystart + dsin(floatDir)*2;//alternative to line above

var _playerHas = false;
var _weaponPos = 0;

sprite_index = item.sprite;

var _size = array_length(global.PlayerWeapons);
for(var i = 0; i < _size; i++){
	//check if the weapon is already in the player's weapon list
	if(global.PlayerWeapons[i] == global.WeaponList.usniper){
		_weaponPos = i;
		_playerHas = true;
		i += 99;
		//exit;
	}
}

//Add weapon to player's list
if place_meeting(x, y, oPlayer){
	//array_push(global.PlayerWeapons, weapon);
    if item_add(item) == true{
        //Add the weapon to global.PlayerWeapons
        //array_push(global.PlayerWeapons, weapon);
		if(!_playerHas){
			array_push(global.PlayerWeapons,  global.WeaponList.usniper);
			array_push(global.PlayerAmmo, 0);
		}
		
		global.PlayerAmmo[array_length(global.PlayerAmmo) - 1] += ammoAdd;
		
		//Set as the player's weapon
        audio_play_sound(sndReload, 8, false);
        oPlayer.selectedWeapon = array_length(global.PlayerWeapons) - 1;
        instance_destroy();//Destroy the object.
    }
}