///oHeavyAmmo Step Event
/*This object represents heavy ammo.*/
//This event is responsible for handling heavy ammo behavior.

if screen_pause(){//Pause self
	exit;
}

//Float in Place
floatDir += floatSpd;
y = ystart + lengthdir_y(2, floatDir);
//y = ystart + dsin(floatDir)*2;//alternative to line above

#region
/*
//get collected by the player
if place_meeting(x, y, oPlayer)
{
	//heal the player
	oPlayer.hp += heal;
	instance_create_depth(x, y, -8000, oHealEffect);
	instance_create_depth(x, y, -8000, oHealScreen);
	//play a sound effect
	//audio_play_sound(sndPickup, 8, false);
	oSFX.pickupSnd = true;
	
	//destroy self
	instance_destroy();
}*/
#endregion

#region
/*
if place_meeting(x, y, oPlayer){//If it touches the player...
	//1)Check inventory for assault rifle
    var hasAssault = false;
    var pos = -1;
    for(var i = 0; i < array_length(global.PlayerWeapons); i++){
        if(global.PlayerWeapons[i] == global.WeaponList.assault){
            hasAssault = true;
            pos = i;
            break;//exit loop early once found
        }
    }
	
	//2)If found, add ammo, play SFX, destroy
    if(hasAssault){
		oSFX.pickupSnd = true;//Play the pickup sound effect.
		global.PlayerAmmo[pos] += ammoAdd;//add ammo to assault rifle
		instance_destroy();//Destroy the ammo box.
	}
}*/
#endregion

if place_meeting(x, y, oPlayer) {
    //1)Scan the inventory
    var hasLMG = false;
    var pos = -1;
    var len = array_length(global.PlayerWeapons);//get array length :contentReference[oaicite:0]{index=0}
    for(var i = 0; i < len; i++){
        var w = global.PlayerWeapons[i];
        //Check for normal, hardcore or ultra lmg
        if(w == global.WeaponList.lmg || w == global.WeaponList.hlmg || w == global.WeaponList.ulmg){
            hasLMG = true;
            pos = i;
            break;//exit loop early :contentReference[oaicite:1]{index=1}
        }
    }

    //2)If found, give ammo and destroy
    if(hasLMG){
		audio_play_sound(sndAmmo, 8, false);//Play sound effect.
        global.PlayerAmmo[pos] += ammoAdd;
        instance_destroy();
    }
}