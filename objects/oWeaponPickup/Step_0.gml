///oWeaponPickup Step Event
/*This object represents the weapon pickup object.*/
//This event is responsible for handling the weapon pickup object behavior.

//Pause Self
if screen_pause(){
	exit;
}

//Float in place
floatDir += floatSpd;
y = ystart + dsin(floatDir)*1;

//Does the player already have one of these?
var _size = array_length(global.PlayerWeapons);
for(var i = 0; i < _size; i++){
	//Check if weapon is alreay in player's weapon list
	if weapon == global.PlayerWeapons[i]{
		//Destroy self
		instance_destroy();
		exit;
	}
}

//Add weapon to player's list
if place_meeting(x, y, oPlayer){
	//Add the weapon
	array_push(global.PlayerWeapons, weapon);

	//Set as the player's weapon
	//Play a sound effect
	audio_play_sound(sndReload, 8, false);
	oPlayer.selectedWeapon = array_length(global.PlayerWeapons) - 1;

	//Destroy
	instance_destroy();
}