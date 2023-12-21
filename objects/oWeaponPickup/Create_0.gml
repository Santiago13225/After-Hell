///oWeaponPickup Create Event
/*This object represents the weapon pickup object.*/
//This event is responsible for setting some variables for the weapon pickup object.

depth = -y;

//Floating
floatDir = 0;
floatSpd = 6;

//Set the weapon based on the image index in the room editor
if image_index = 0{
	weapon = global.WeaponList.pistol;
}
if image_index = 1{
	weapon = global.WeaponList.shotgun;
}
if image_index = 2{
	weapon = global.WeaponList.raygun;
}
if image_index = 3{
	weapon = global.WeaponList.sniper;
}
if image_index = 4{
	weapon = global.WeaponList.assault;
}
if image_index = 5{
	weapon = global.WeaponList.smg;
}
if image_index = 6{
	weapon = global.WeaponList.lmg;
}
if image_index = 7{
	weapon = global.WeaponList.bazooka;
}

//Set the correct sprite
sprite_index = weapon.pickupSprite;
image_index = 0;

//Does the player already have one of these?
var _size = array_length(global.PlayerWeapons);
for(var i = 0; i < _size; i++){
	//Check if weapon is alreay in player's weapon list
	if weapon == global.PlayerWeapons[i]{
		//Destroy self
		instance_destroy();
	}
}