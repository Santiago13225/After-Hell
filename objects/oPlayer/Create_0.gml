///oPlayer Create Event
/*This object represents the player object.*/
//This event is responsible for setting some variables for the player object.

if room == rm_Mission0{
	oHUD2.playerScore = 10000000;
}

item = global.item_list2.pistol;

//Damage setup
//get_damage_create(10, true);//Sets player to 10 hp.
if(global.juggernaut){
	get_damage_create(200, true);//Sets player to 100 hp.
}else if(global.instakill){
	get_damage_create(1, true);
}else if(global.weakness){
	get_damage_create(50, true);
}else{
	get_damage_create(100, true);//Sets player to 100 hp.
}
//get_damage_create(100, true);//Sets player to 100 hp.

//Energy Shield
/*
shieldMax = 100;//Maximum shield HP
shield = shieldMax;//Current shield HP
shieldRegenRate = 0.25;//Regen per frame (15 = full regen in 4 seconds at 60fps)
shieldRegenCooldown = 180;//Time to wait before regen starts (3 seconds)
shieldRegenTimer = 0;//Countdown until regen starts*/

//Energy Shield Variables
/*
shield = 0;
maxShield = 0;
shieldRegenTimer = 0;
shieldRegenDelay = 180;//Frames to wait before regen starts (e.g., 3 seconds)
shieldRegenRate = 0.25;//Shield regen per frame (adjust as needed)
*/
if(global.energyshield) {
    maxShield = 50;//Or however much you want
    shield = maxShield;
}

lowHealth = false;

//global.font2 = font_add_sprite(sMainFont, 32, true, 1);
global.font2 = font_add_sprite(sHUDFont, 32, true, 1);

//Variables for movement
moveDir = 0;
moveSpd = 2;
xSpd = 0;
ySpd = 0;

//Sprite control

centerYOffset = -5;
centerY = y + centerYOffset;//Set in step event.

weaponOffsetDist = 4;
aimDir = 0;

face = 3;
sprite[0] = sPlayerRightNew;
sprite[1] = sPlayerUpNew;
sprite[2] = sPlayerLeftNew;
sprite[3] = sPlayerDownNew;

//sprite_index = sprite[face];
//weapon info
shootTimer = 0;
//shootCooldown = 9;

/*
//Add weapons to player inventory
if !array_contains(global.PlayerWeapons, global.WeaponList.pistol){
	array_push(global.PlayerWeapons,  global.WeaponList.pistol);
}*/

//Add weapons to player inventory
if !array_contains(global.PlayerWeapons, global.WeaponList.pistol){
    if item_add(item) == true{
        //Add the weapon to global.PlayerWeapons
		array_push(global.PlayerWeapons, global.WeaponList.pistol);
		array_push(global.PlayerAmmo, 999);
    }	
}

//array_push(global.PlayerWeapons,  global.WeaponList.pistol);
_playerWeapons = global.PlayerWeapons;
selectedWeapon = 0;
weapon = global.PlayerWeapons[selectedWeapon];