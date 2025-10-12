/// scr_HandleWallbuy(cost, ammoAdd, baseVar, hardcoreVar, ultraVar, createObj)
/// @arg0 cost          – point cost to buy weapon
/// @arg1 ammoAdd       – ammo to add when already owned
/// @arg2 baseVar       – global.WeaponList.<weapon>
/// @arg3 hardcoreVar   – global.WeaponList.h<weapon>
/// @arg4 ultraVar      – global.WeaponList.u<weapon>
/// @arg5 createObj     – object to instance_create (oShotgun, oRaygun, etc.)

var cost        = argument0;
var ammoAdd     = argument1;
var baseVar     = argument2;
var hardcoreVar = argument3;
var ultraVar    = argument4;
var createObj   = argument5;

//Only interact when in range and the textbox exists
if distance_to_object(oPlayer) < 32 && instance_exists(oTextbox2) {
	//if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)) {
	if keyboard_check_pressed(vk_space) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)) {
		//1)If player can afford AND doesn’t own any variant → buy
		var ownsBase     = false;
		var ownsHardcore = false;
		var ownsUltra    = false;
		var slot         = -1;
		var cnt          = array_length(global.PlayerWeapons);//get inventory size :contentReference[oaicite:0]{index=0}

		for(var i = 0; i < cnt; i++) {//manual loop to detect each variant 
			var w = global.PlayerWeapons[i];
			if(w == baseVar) {
				ownsBase = true; slot = i; break;
			}
			if(w == hardcoreVar) {
				ownsHardcore = true; slot = i; break;
			}
			if(w == ultraVar) {
				ownsUltra = true; slot = i; break;
			}
		}

		if(!ownsBase && !ownsHardcore && !ownsUltra) {//If none owned → purchase new
			if(oHUD2.playerScore >= cost) {
				oHUD2.playerScore -= cost;
				audio_play_sound(sndBuy, 8, false);
				instance_create_depth(oPlayer.x, oPlayer.y, -y, createObj);
				instance_destroy(oTextbox2);
			}else {
				audio_play_sound(sndNoMoney, 8, false);
				if(!audio_is_playing(sndBroke)) audio_play_sound(sndBroke, 10, false);
			}
		}else {//Already own one variant → top up ammo
			var ammoCost = ceil(cost * 0.5);//half price for refills
			if(oHUD2.playerScore >= ammoCost) {
				oHUD2.playerScore -= ammoCost;
				audio_play_sound(sndBuy, 8, false);
				global.PlayerAmmo[slot] += ammoAdd;
			}else{
				audio_play_sound(sndNoMoney, 8, false);
				if(!audio_is_playing(sndBroke)) audio_play_sound(sndBroke, 10, false);
			}	
			instance_destroy(oTextbox2);
		}
	}
}
