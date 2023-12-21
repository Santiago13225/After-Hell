///oPlayer Step Event
/*This object represents the player object.*/
//This event is responsible for handling player object behavior.

//Get inputs
#region
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;
swapKeyPressed = global.swapKeyPressed;
startKeyPressed = global.startKeyPressed;

#endregion
/*
if global.rightKeyPressed == true
{
	x += 20;
}*/
/*
hspd = walking_speed*(keys[KEY_RIGHT]-keys[KEY_LEFT]);
x += hspd;
*/
//Pause menu
if startKeyPressed{
	if !instance_exists(oPauseMenu){
		if audio_is_playing(sndTestLevelTheme){
			audio_pause_sound(sndTestLevelTheme);
		}
		if audio_is_playing(sndHouseTheme1){
		//if room == rm_House_Level1 {	
			oSFX.houseSndloop = false;
			//audio_pause_sound(sndHouseTheme1);
		} 
		if audio_is_playing(sndFacilityTheme1){
			audio_pause_sound(sndFacilityTheme1);
		}
		if audio_is_playing(sndTempleTheme1){
			audio_pause_sound(sndTempleTheme1);
		}
		if audio_is_playing(sndOverlookTheme1){
			audio_pause_sound(sndOverlookTheme1);
		}
		if audio_is_playing(sndLabyrinthTheme){
			audio_pause_sound(sndLabyrinthTheme);
		}
		if audio_is_playing(sndCasinoTheme){
			audio_pause_sound(sndCasinoTheme);
		}
		if audio_is_playing(sndGraveyardTheme){
			audio_pause_sound(sndGraveyardTheme);
		}
		if audio_is_playing(sndIslandTheme){
			audio_pause_sound(sndIslandTheme);
		}
		if audio_is_playing(sndWaterStationTheme1){
			audio_pause_sound(sndWaterStationTheme1);
		}
		if audio_is_playing(sndCityBlockTheme){
			audio_pause_sound(sndCityBlockTheme);
		}
		if audio_is_playing(sndYardTheme){
			audio_pause_sound(sndYardTheme);
		}
		if audio_is_playing(sndMuseumTheme){
			audio_pause_sound(sndMuseumTheme);
		}
		//audio_pause_sound(sndTestLevelTheme);
		//audio_pause_sound(global.MUSIC);
		//audio_pause_sound(sndUniversal);
		audio_play_sound(sndBeep, 8, false);
		instance_create_depth(0, 0, 0, oPauseMenu);
	}else {
		audio_play_sound(sndBeep, 8, false);
		//instance_destroy(oPauseMenu);
	}
}

if instance_exists(oInvisibleSpawner2){
	if global.enemyKillCount == oInvisibleSpawner2.maxTotalEnemies {
		//audio_pause_all();
		//audio_pause_sound(sndTestLevelTheme);
		//audio_pause_sound(global.MUSIC);
	
		if audio_is_playing(sndTestLevelTheme){
			audio_pause_sound(sndTestLevelTheme);
		} 
		if audio_is_playing(sndHouseTheme1){
			audio_pause_sound(sndHouseTheme1);
		}
		if audio_is_playing(sndTempleTheme1){
			audio_pause_sound(sndTempleTheme1);
		}
		if audio_is_playing(sndOverlookTheme1){
			audio_pause_sound(sndOverlookTheme1);
		}
		if audio_is_playing(sndLabyrinthTheme){
			audio_pause_sound(sndLabyrinthTheme);
		}
		if audio_is_playing(sndCasinoTheme){
			audio_pause_sound(sndCasinoTheme);
		}
		if audio_is_playing(sndGraveyardTheme){
			audio_pause_sound(sndGraveyardTheme);
		}
		if audio_is_playing(sndIslandTheme){
			audio_pause_sound(sndIslandTheme);
		}
		if audio_is_playing(sndWaterStationTheme1){
			audio_pause_sound(sndWaterStationTheme1);
		}
		if audio_is_playing(sndCityBlockTheme){
			audio_pause_sound(sndCityBlockTheme);
		}
		if audio_is_playing(sndYardTheme){
			audio_pause_sound(sndYardTheme);
		}
		if audio_is_playing(sndMuseumTheme){
			audio_pause_sound(sndMuseumTheme);
		}
		else {
			audio_pause_sound(sndFacilityTheme1);
		}
	
		//audio_play_sound(sndLaugh, 8, false);
		//instance_create_depth(0, 0, 0, oVictoryScreen);
		//audio_play_sound(sndVictory, 8, false);//earrape
		//oSFX.winSnd = true;
	}
}

//Update visuals for room warping
if instance_exists(oWarp)
{
	//image_index = 0;//force image index to be 0 if we wanted to
	sprite_index = sprite[face];
	aimDir = face * 90;
	centerY = y + centerYOffset;
}

//Pause self
if screen_pause(){
	exit;
}

//Player movement
#region
//Get the direction
//var _horizKey = rightKey - leftKey;
var _horizKey = global.xaxisLeft;
//var _vertKey = downKey - upKey;
var _vertKey = global.yaxisLeft;
moveDir = point_direction(0, 0, _horizKey, _vertKey);

var_spd = 0;
var _inputLevel = point_distance(0, 0, _horizKey, _vertKey);
_inputLevel = clamp(_inputLevel, 0, 1);
_spd = moveSpd * _inputLevel;

xspd = lengthdir_x(_spd, moveDir);
yspd = lengthdir_y(_spd, moveDir);

//Collision
if place_meeting(x + xspd, y, oWall){
	xspd = 0;
}
if place_meeting(x, y + yspd, oWall){
	yspd = 0;
}

//Move the player
x += xspd;
y += yspd;

//Depth
depth = -bbox_bottom;
#endregion

//Get damage
//get_damage(oDamagePlayer, true);

//or

//Get damage
if get_damage(oDamagePlayer, true){
	if place_meeting(x, y, oEnemyParent){
		//Play a sound effect
		audio_play_sound(sndHit, 8, false);
	} else if place_meeting(x, y, oEnemyBullet){
		//Play a sound effect
		audio_play_sound(sndHit, 8, false);
	}
	//Hit screen
	instance_create_depth(0, 0, 0, oHitScreen);
	
	//Screen pause
	create_screen_pause(25);
	
	//Shake the screen
	screen_shake();
}
/*
//Heal
if place_meeting(x, y, oMedkit){
	//Heal the player
	instance_create_depth(x, y, -10000, oHealEffect);
	//Play a sound effect
	//audio_play_sound(sndPickup, 8, false);
	//oSFX.pickupSnd = true;
	
	//Destroy self
	//instance_destroy();
}*/

//Sprite control
#region
//Player aiming
centerY = y + centerYOffset;//Set in step event
//Aim
//Keyboard and Mouse
if global.controllerMode == 0{
	aimDir = point_direction(x, centerY, mouse_x, mouse_y);
}

//Controller
if global.controllerMode == 1{
	if global.xaxisRight != 0 || global.yaxisRight != 0{
		aimDir = point_direction(0, 0, global.xaxisRight, global.yaxisRight);
	}
}

	//Make sure the player is facing the correct direction
	face = round(aimDir/90);
		if face == 4 {face = 0; };
	
	//Animate
	if xspd == 0 && yspd == 0{
		image_index = 0;
	}
	
	//Set the player sprite
	mask_index = sprite[3];
	sprite_index = sprite[face];
#endregion

//Weapon swapping
#region
//var _playerWeapons = global.PlayerWeapons;

//Cycle through weapons
if swapKeyPressed{
	//Change the selection and wrap around
	if array_length(_playerWeapons) > 1{
		//Play a sound effect
		audio_play_sound(sndCock, 8, false);
	} else{
		//Play a sound effect
		audio_play_sound(sndBeep, 8, false);
	}
	selectedWeapon++;
	if selectedWeapon >= array_length(_playerWeapons){
		selectedWeapon = 0;	
	}

	//Set the new weapon
	//weapon = _playerWeapons[selectedWeapon];//optimal
}

//Set the new weapon
weapon = _playerWeapons[selectedWeapon];//For manual weapon pickup but less optimal as code is being run more often here

#endregion

//Shoot the weapon
if shootTimer > 0 {
	shootTimer--;
}
if shootKey && shootTimer <= 0{
	//Reset the timer
	//shootTimer = shootCooldown;
	shootTimer = weapon.cooldown;
	//Shooting
	//Create the bullet
	var _xOffset = lengthdir_x(weapon.length + weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weapon.length + weaponOffsetDist, aimDir);
	
	var _spread = weapon.spread;
	var _spreadDiv = _spread / max(weapon.bulletNum-1, 1);
	
	var _weaponTipX = x + _xOffset;
	var _weaponTipY = centerY + _yOffset; 
	
	//Create weapon flash
	create_animated_vfx(sShootFlash, _weaponTipX, _weaponTipY, depth-10, aimDir);
	//Play a sound effect
	//audio_play_sound(snd8BitExplosion1, 8, false);
	if weapon == global.WeaponList.pistol || weapon == global.WeaponList.hpistol || weapon == global.WeaponList.upistol{
		audio_play_sound(sndShot, 6, false);
	} else if weapon == global.WeaponList.raygun || weapon == global.WeaponList.hraygun || weapon == global.WeaponList.uraygun{
		audio_play_sound(sndRGBlast, 6, false);
	} else if weapon == global.WeaponList.shotgun || weapon == global.WeaponList.hshotgun || weapon == global.WeaponList.ushotgun{
		audio_play_sound(sndSGBlast, 6, false);
	} else if weapon == global.WeaponList.sniper || weapon == global.WeaponList.hsniper || weapon == global.WeaponList.usniper{
		audio_play_sound(sndSniperBlast, 6, false);
	} else if weapon == global.WeaponList.assault || weapon == global.WeaponList.hassault || weapon == global.WeaponList.uassault{
		audio_play_sound(sndAssault, 6, false);
	} else if weapon == global.WeaponList.smg || weapon == global.WeaponList.hsmg || weapon == global.WeaponList.usmg{
		audio_play_sound(sndSMG, 6, false);
	} else if weapon == global.WeaponList.lmg || weapon == global.WeaponList.hlmg || weapon == global.WeaponList.ulmg{
		audio_play_sound(sndLMG, 6, false);
	} else if weapon == global.WeaponList.bazooka || weapon == global.WeaponList.hbazooka || weapon == global.WeaponList.ubazooka{
		audio_play_sound(sndRocket, 6, false);
	} else{
		audio_play_sound(sndShot, 6, false);
	}
	//Create the correct number of bullets
	for(var i = 0; i < weapon.bulletNum; i++){
		var _bulletInst = instance_create_depth( _weaponTipX,  _weaponTipY, depth-100, weapon.bulletObj);
	
		//Change the bullet's direction
		with(_bulletInst){
			dir = other.aimDir - _spread/2 + _spreadDiv * i;
			
			//Turn the bullet to the correct direction at creation if necessary
			if dirFix == true{
				image_angle = dir;
			}
		}
	}
	//Screen pause
	//create_screen_pause(2);//use if you want to slow down time when shooting
}

//Check for low health condition (adjust the threshold as needed)
var lowHealthThreshold = 30;//Set the desired low health threshold here
if (hp <= lowHealthThreshold && !lowHealth) {
    lowHealth = true;
	//audio_loop_sound
	audio_play_sound(sndLowHealth, 9, true);
	//audio_play_music(sndLowHealth);
    //audio_loop_sound(sndLowHealth);//Replace sndLowHealth with the sound you want to play
}

//Check if the player recovered health and stop the effects
if (hp > lowHealthThreshold && lowHealth) {
    lowHealth = false;
    audio_stop_sound(sndLowHealth);//Stop the looped sound
    draw_set_alpha(1);//Reset the screen color when health is not low
}

//Call the screen flashing effect when the player's health is low
if (lowHealth) {
	//scr_flash
	image_blend = c_red;
	scr_flash_screen();
    //scr_flash_screen(5);//Adjust the interval as needed
}else{
	image_blend = c_white;
}

//var _bought = false;
if instance_exists(oShotgunWallbuy){
	with(oShotgunWallbuy){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 500;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
					//_bought = true;
					//oShotgunWallbuy.bought = true;
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oShotgun);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}
			    }
			}
		}
	}
}

if instance_exists(oRaygunWallbuy){
	with(oRaygunWallbuy){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 15000;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oRaygun);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}
			    }
			}
		}
	}
}

if instance_exists(oSniperWallbuy){
	with(oSniperWallbuy){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 1500;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oSniper);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}
			    }
			}
		}
	}
}

if instance_exists(oAssaultWallbuy){
	with(oAssaultWallbuy){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 1800;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oAssault);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}
			    }
			}
		}
	}
}

if instance_exists(oBazookaWallbuy){
	with(oBazookaWallbuy){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 18000;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oBazooka);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}
			    }
			}
		}
	}
}

if instance_exists(oSMGWallbuy){
	with(oSMGWallbuy){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 1500;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oSMG);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}
			    }
			}
		}
	}
}

if instance_exists(oLMGWallbuy){
	with(oLMGWallbuy){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 2500;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oLMG);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}
			    }
			}
		}
	}
}

if instance_exists(oMedkitWallbuy){
	with(oMedkitWallbuy){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 500;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oMedkit);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}	
			    }
			}
		}
	}
}

if instance_exists(oDebris){
	with(oDebris){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 500;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					instance_destroy();
					instance_create_depth(oPlayer.x, oPlayer.y, -y, oMedkit);
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}	
			    }
			}
		}
	}
}

if instance_exists(oArmoryAugmentor){
	with(oArmoryAugmentor){
		if distance_to_object(oPlayer) < 32{
			if keyboard_check_pressed(ord("G")) xor ((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face3)){
				wallbuyCost = 5000;
				//Check if the player has enough points to buy the weapon
			    if (oHUD.playerScore >= wallbuyCost) {
			        //Deduct the cost from the player's score
			        oHUD.playerScore -= wallbuyCost;
					audio_play_sound(sndBuy, 8, false);
					//instance_destroy();
					
					//var droppedItem = instance_create_depth(oPlayer.x - 1, oPlayer.y + 16, -y, inv[selected_item].droppedItem);
					//droppedItem.item = oItemManager2.inv[selected_item];
					//array_delete(inv, selected_item, 1);
					/*
					// Iterate through the inv array
					for (var i = 0; i < array_length(oItemManager2.inv); i++) {
					    var currentItem = oItemManager2.inv[i];
					    // Check if the player's equipped weapon matches the current item
						
						if (currentItem == oPlayer.weapon) {
					        // Remove the item from the array
					        instance_destroy(currentItem);
							//array_delete(oItemManager2.inv, i, 1);
					        break; // Exit the loop once the item is removed
					    }
					}*/
					
					if oPlayer.weapon == global.WeaponList.pistol {
						array_set(global.PlayerWeapons, 0, global.WeaponList.hpistol);
						array_set(oItemManager2.inv, 0, global.item_list2.hpistol);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcorePistol);
					} else if oPlayer.weapon == global.WeaponList.hpistol {
						array_set(global.PlayerWeapons, 0, global.WeaponList.upistol);
						array_set(oItemManager2.inv, 0, global.item_list2.upistol);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcorePistol);
					} else if oPlayer.weapon == global.WeaponList.raygun {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.raygun;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.hraygun);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.raygun;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.hraygun);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreRaygun);
					} else if oPlayer.weapon == global.WeaponList.sniper {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.sniper;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.hsniper);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.sniper;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.hsniper);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreSniper);
					} else if oPlayer.weapon == global.WeaponList.shotgun {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.shotgun;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.hshotgun);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.shotgun;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.hshotgun);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreShotgun);
					} else if oPlayer.weapon == global.WeaponList.assault {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.assault;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.hassault);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.assault;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.hassault);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreAssault);
					} else if oPlayer.weapon == global.WeaponList.smg {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.smg;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.hsmg);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.smg;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.hsmg);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreSMG);
					} else if oPlayer.weapon == global.WeaponList.lmg {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.lmg;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.hlmg);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.lmg;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.hlmg);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreLMG);
					} else if oPlayer.weapon == global.WeaponList.bazooka {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.bazooka;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.hbazooka);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.bazooka;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.hbazooka);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreBazooka);
					} else if oPlayer.weapon == global.WeaponList.hraygun {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.hraygun;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.uraygun);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.hraygun;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.uraygun);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreRaygun);
					} else if oPlayer.weapon == global.WeaponList.hsniper {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.hsniper;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.usniper);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.hsniper;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.usniper);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreSniper);
					} else if oPlayer.weapon == global.WeaponList.hshotgun {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.hshotgun;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.ushotgun);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.hshotgun;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.ushotgun);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreShotgun);
					} else if oPlayer.weapon == global.WeaponList.hassault {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.hassault;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.uassault);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.hassault;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.uassault);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreAssault);
					} else if oPlayer.weapon == global.WeaponList.hsmg {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.hsmg;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.usmg);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.hsmg;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.usmg);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreSMG);
					} else if oPlayer.weapon == global.WeaponList.hlmg {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.hlmg;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.ulmg);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.hlmg;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.ulmg);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreLMG);
					} else if oPlayer.weapon == global.WeaponList.hbazooka {
						
						var _array1 = global.PlayerWeapons;
						var _predicate1 = function(_val, _index){
						    return _val == global.WeaponList.hbazooka;
						}
						var _ar_id1 = array_find_index(_array1, _predicate1);
						array_set(global.PlayerWeapons, _ar_id1, global.WeaponList.ubazooka);
						
						var _array2 = oItemManager2.inv;
						var _predicate2 = function(_val, _index){
						    return _val == global.item_list2.hbazooka;
						}
						var _ar_id2 = array_find_index(_array2, _predicate2);
						array_set(oItemManager2.inv, _ar_id2, global.item_list2.ubazooka);
						//instance_create_depth(oPlayer.x, oPlayer.y, -y, oHardcoreBazooka);
					} else {
						oHUD.playerScore += wallbuyCost;
						if !audio_is_playing(sndMax){
							audio_play_sound(sndMax, 10, false);
						}
					}
			    } else {
			        //Play a sound or show a message indicating insufficient points
			        //Add your insufficient points logic here
					audio_play_sound(sndNoMoney, 8, false);
					if !audio_is_playing(sndBroke){
						audio_play_sound(sndBroke, 10, false);
					}	
			    }
			}
		}
	}
}

//Death / Game Over
if hp <= 0{	
	audio_pause_all();
	//Play a sound effect
	audio_play_sound(sndGameOver, 8, false);
	//Create the game over object
	instance_create_depth(0, 0, -10000, oGameOverScreen);
	
	//Poof
	//instance_create_depth(x, y, depth, oAnimatedVFX);
	create_animated_vfx(sPoof, x, y, depth);
	oHUD.playerScore = 500;
	clear_weapons();
	instance_destroy();//Destroy Ourself.
	//clear_weapons();
}