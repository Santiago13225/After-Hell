///oMedkit Step Event
/*This object represents a medkit.*/
//This event is responsible for handling medkit behavior.

if screen_pause(){//Pause self
	exit;
}

//Float in Place
floatDir += floatSpd;
y = ystart + lengthdir_y(2, floatDir);
//y = ystart + dsin(floatDir)*2;//alternative to line above
var hpVar;
#region
if(global.juggernaut){
	hpVar = 200;
}else {
	hpVar = 100;
}
//get collected by the player
if place_meeting(x, y, oPlayer){
	//heal the player
	//if(oPlayer.hp < 100){
	if(oPlayer.hp < hpVar){
		oPlayer.hp += heal;
		instance_create_depth(x, y, -8000, oHealEffect);
		//instance_create_depth(x, y, -8000, oHealScreen);
		//play a sound effect
		//audio_play_sound(sndPickup, 8, false);
		oSFX.pickupSnd = true;

		instance_destroy();//destroy self
	}
}
#endregion

//sprite_index = item.sprite;
/*
if place_meeting(x, y, oPlayer){//If it touches the player...
	if item_add(item) == true {//If it can be added to the inventory...
		oSFX.pickupSnd = true;//Play the pickup sound effect.
		//item_add(global.item_list2.medkit);
		//item = global.item_list.medkit;
		instance_destroy();//Destroy the medkit.
	}
}*/