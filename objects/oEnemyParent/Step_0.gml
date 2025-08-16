///oEnemyParent Step Event
/*This object represents an enemy parent.*/
//This event is responsible for handling some enemy behavior.

get_damage(oDamageEnemy);//Receive damage.

var waveCompletionMessageShown = false;//Set wave completion to false.
//var waveEndShown = false;

if place_meeting(x, y, oUnstableBullet){//If touching a bullet.
	image_blend = c_red;//Color red.
	//state = 0;
}else{//Else...
	image_blend = c_white;//Color white.
}

//Death
if hp <= 0{//If hp is 0 or less.
	if instance_exists(oHUD2){//If HUD exists...
		if !instance_exists(oScoreEffect){//If score effect not already displayed...
			zombieScoreValue = 100;//Set score to 100.
			var _scoreInst = instance_create_depth(x, y, -3000, oScoreEffect);//Create a score effect and store it in a variable.

			if(_scoreInst){//If score instance exists...
			    _scoreInst.scoreValue = zombieScoreValue;//Assign the zombie's score value.
			    _scoreInst.ShowEffect(zombieScoreValue, x, y);//Call the ShowEffect function.
			}
		}
		oHUD2.playerScore += 100;//Add to player score.
	}
	global.enemyKillCount++;//Add to the total amount of enemies killed.
	oInvisibleSpawner2.zombiesKilledThisWave++;//Notify the spawner.
	if oInvisibleSpawner2.zombiesKilledThisWave == oInvisibleSpawner2.activeEnemyMax && !waveCompletionMessageShown{//If wave completed...
        //Display the wave completion message if zombiesKilledThisWave >= activeEnemyMax
		audio_play_sound(sndRoundEnd1, 10, false);//Play round end sound.
		instance_create_depth(x, y, -8000, oWaveEndScreen);//Show round end notification.
        waveCompletionMessageShown = true;//Set the complete message shown flag to true.
		if waveCompletionMessageShown == true{//If the wave complete message has been shown.
			var _create_end = function(){//Encapsulate the following two lines in a function and store it in a variable.
			    audio_play_sound(sndRoundStart1, 10, false);//Play wave start sound.
				instance_create_depth(x, y, -8000, oWaveStartScreen);//Show wave start message.
			}
			call_later(10, time_source_units_seconds, _create_end);//Play wave start message after 15 seconds.
		}
		//oInvisibleSpawner2.ds_list_clear(oInvisibleSpawner2.activeSpawns);
    }

//Determine how many drop attempts to make
var _dropAttempts;

if(global.luck){
	_dropAttempts = irandom_range(2, 3);
	
	var _chance = irandom(100);//Random variable used to determine if we should drop an item.

	for(var i = 0; i < _dropAttempts; i++){
		//if global.enemyKillCount mod 5 == 0//drop every 5 kills 
		
		var dx = random_range(-4, 4);
		var dy = random_range(-4, 4);
		//instance_create_depth(x + dx, y + dy, depth, oGreenbacks);
		
		if _chance <= 6{//% chance of drop.
			instance_create_depth(x + dx, y + dy, depth, oGreenbacks);//Create greenbacks.
		}
		if _chance > 6 && _chance <= 12{//% chance of drop
			instance_create_depth(x + dx, y + dy, depth, oBluebacks);//Create bluebacks.
		}
		if _chance > 12 && _chance <= 18{//% chance of drop
			instance_create_depth(x + dx, y + dy, depth, oRedbacks);//Create redbacks.
		}
		if _chance > 18 && _chance <= 24{//% chance of drop
			instance_create_depth(x + dx, y + dy, depth, oBronzebacks);//Create bronzebacks.
		}
		if _chance > 24 && _chance <= 30{//% chance of drop
			instance_create_depth(x + dx, y + dy , depth, oSilverbacks);//Create silverbacks.
		}
		if _chance > 30 && _chance <= 36{//% chance of drop
			instance_create_depth(x + dx, y + dy, depth, oGoldbacks);//Create goldbacks.
		}
		if _chance > 36 && _chance <= 42{//% chance of drop
			instance_create_depth(x + dx, y + dy, depth, oBlackbacks);//Create blackbacks.
		}
		if _chance > 42 && _chance <= 49{//% chance of drop
			if(array_contains(global.PlayerWeapons, global.WeaponList.smg) || array_contains(global.PlayerWeapons, global.WeaponList.hsmg) || array_contains(global.PlayerWeapons, global.WeaponList.usmg)){
				instance_create_depth(x + dx, y + dy, depth, oLightAmmo);//Create .
			}
		}
		if _chance > 49 && _chance <= 56{//% chance of drop
			if(array_contains(global.PlayerWeapons, global.WeaponList.shotgun) || array_contains(global.PlayerWeapons, global.WeaponList.hshotgun) || array_contains(global.PlayerWeapons, global.WeaponList.ushotgun)){
				instance_create_depth(x + dx, y + dy, depth, oShellAmmo);//Create .
			}
		}
		if _chance > 56 && _chance <= 63{//% chance of drop
			if(array_contains(global.PlayerWeapons, global.WeaponList.assault) || array_contains(global.PlayerWeapons, global.WeaponList.hassault) || array_contains(global.PlayerWeapons, global.WeaponList.uassault)){
				instance_create_depth(x + dx, y + dy, depth, oRifleAmmo);//Create .
			}
		}
		if _chance > 63 && _chance <= 70{//% chance of drop
			if(array_contains(global.PlayerWeapons, global.WeaponList.sniper) || array_contains(global.PlayerWeapons, global.WeaponList.hsniper) || array_contains(global.PlayerWeapons, global.WeaponList.usniper)){
				instance_create_depth(x + dx, y + dy, depth, oSniperAmmo);//Create .
			}
		}
		if _chance > 70 && _chance <= 77{//% chance of drop
			if(array_contains(global.PlayerWeapons, global.WeaponList.lmg) || array_contains(global.PlayerWeapons, global.WeaponList.hlmg) || array_contains(global.PlayerWeapons, global.WeaponList.ulmg)){
				instance_create_depth(x + dx, y + dy, depth, oHeavyAmmo);//Create .
			}
		}
		if _chance > 77 && _chance <= 84{//% chance of drop
			if(array_contains(global.PlayerWeapons, global.WeaponList.bazooka) || array_contains(global.PlayerWeapons, global.WeaponList.hbazooka) || array_contains(global.PlayerWeapons, global.WeaponList.ubazooka)){
				instance_create_depth(x + dx, y + dy, depth, oRocketAmmo);//Create .
			}
		}
		if _chance > 84 && _chance <= 91{//% chance of drop
			if(array_contains(global.PlayerWeapons, global.WeaponList.raygun) || array_contains(global.PlayerWeapons, global.WeaponList.hraygun) || array_contains(global.PlayerWeapons, global.WeaponList.uraygun)){
				instance_create_depth(x + dx, y + dy, depth, oColdCellAmmo);//Create .
			}
		}
		if _chance > 91 && _chance <= 100{//% chance of drop
			instance_create_depth(x + dx, y + dy, depth, oMedkit);//Create .
		}
	}
}else if(global.badluck){
	//Drop nothing.
}else{
	var _chance = irandom(100);//Random variable used to determine if we should drop an item.

	//if global.enemyKillCount mod 5 == 0//drop every 5 kills 
	if _chance <= 5{//% chance of drop.
		instance_create_depth(x, y, depth, oGreenbacks);//Create greenbacks.
	}
	if _chance > 5 && _chance <= 10{//% chance of drop
		instance_create_depth(x, y, depth, oBluebacks);//Create bluebacks.
	}
	if _chance > 10 && _chance <= 15{//% chance of drop
		instance_create_depth(x, y, depth, oRedbacks);//Create redbacks.
	}
	if _chance > 15 && _chance <= 20{//% chance of drop
		instance_create_depth(x, y, depth, oBronzebacks);//Create bronzebacks.
	}
	if _chance > 20 && _chance <= 25{//% chance of drop
		instance_create_depth(x, y, depth, oSilverbacks);//Create silverbacks.
	}
	if _chance > 25 && _chance <= 30{//% chance of drop
		instance_create_depth(x, y, depth, oGoldbacks);//Create goldbacks.
	}
	if _chance > 30 && _chance <= 35{//% chance of drop
		instance_create_depth(x, y, depth, oBlackbacks);//Create blackbacks.
	}
	if _chance > 35 && _chance <= 40{//% chance of drop
		if(array_contains(global.PlayerWeapons, global.WeaponList.smg) || array_contains(global.PlayerWeapons, global.WeaponList.hsmg) || array_contains(global.PlayerWeapons, global.WeaponList.usmg)){
			instance_create_depth(x, y, depth, oLightAmmo);//Create .
		}
	}
	if _chance > 40 && _chance <= 45{//% chance of drop
		if(array_contains(global.PlayerWeapons, global.WeaponList.shotgun) || array_contains(global.PlayerWeapons, global.WeaponList.hshotgun) || array_contains(global.PlayerWeapons, global.WeaponList.ushotgun)){
			instance_create_depth(x, y, depth, oShellAmmo);//Create .
		}
	}
	if _chance > 45 && _chance <= 50{//% chance of drop
		if(array_contains(global.PlayerWeapons, global.WeaponList.assault) || array_contains(global.PlayerWeapons, global.WeaponList.hassault) || array_contains(global.PlayerWeapons, global.WeaponList.uassault)){
			instance_create_depth(x, y, depth, oRifleAmmo);//Create .
		}
	}
	if _chance > 50 && _chance <= 55{//% chance of drop
		if(array_contains(global.PlayerWeapons, global.WeaponList.sniper) || array_contains(global.PlayerWeapons, global.WeaponList.hsniper) || array_contains(global.PlayerWeapons, global.WeaponList.usniper)){
			instance_create_depth(x, y, depth, oSniperAmmo);//Create .
		}
	}
	if _chance > 55 && _chance <= 60{//% chance of drop
		if(array_contains(global.PlayerWeapons, global.WeaponList.lmg) || array_contains(global.PlayerWeapons, global.WeaponList.hlmg) || array_contains(global.PlayerWeapons, global.WeaponList.ulmg)){
			instance_create_depth(x, y, depth, oHeavyAmmo);//Create .
		}
	}
	if _chance > 60 && _chance <= 65{//% chance of drop
		if(array_contains(global.PlayerWeapons, global.WeaponList.bazooka) || array_contains(global.PlayerWeapons, global.WeaponList.hbazooka) || array_contains(global.PlayerWeapons, global.WeaponList.ubazooka)){
			instance_create_depth(x, y, depth, oRocketAmmo);//Create .
		}
	}
	if _chance > 65 && _chance <= 70{//% chance of drop
		if(array_contains(global.PlayerWeapons, global.WeaponList.raygun) || array_contains(global.PlayerWeapons, global.WeaponList.hraygun) || array_contains(global.PlayerWeapons, global.WeaponList.uraygun)){
			instance_create_depth(x, y, depth, oColdCellAmmo);//Create .
		}
	}
	if _chance > 70 && _chance <= 75{//% chance of drop
		if(global.instakill || global.nomedkit){
			instance_create_depth(x, y, depth, oGreenbacks);//Create .
		}else {
			instance_create_depth(x, y, depth, oMedkit);//Create .
		}
	}
}
	/*
	if _chance > 70{//% chance of drop
		audio_play_sound(sndExplosion, 8, false);//Play explosion sound effect.
		instance_create_depth(x, y, depth, oExplosion);//Create .
	}*/
	
	audio_play_sound(sndSplatter, 8, false);//Play a sound effect.
	
	//Poof vfx
	//instance_create_depth(x, y, depth, oAnimatedVFX);
	create_animated_vfx(sPoof, x, y, depth);//Create visual effect.

	instance_destroy();//Destroy Self.
}

#region
/*
//Track zombie’s current area
if(instance_exists(oAreaMarker)){
	if(place_meeting(x, y, oAreaMarker)) {
	    var inst = instance_place(x, y, oAreaMarker);
	    if(instance_exists(inst)) {
	        areaID = inst.areaID;
	    }
	}

	if(areaID != global.playerAreaID) {
	    var closestSpawn = noone;
	    var shortestDist = 999999;

	    //Loop through all spawn points
	    with(oZombieAreaSpawn) {
	        if(areaID == global.playerAreaID) {
	            var distToPlayer = point_distance(x, y, oPlayer.x, oPlayer.y);
	            if(distToPlayer < shortestDist) {
	                closestSpawn = id;
	                shortestDist = distToPlayer;
	            }
	        }
	    }

	    //Warp zombie to the closest spawn
	    if(instance_exists(closestSpawn)) {
	        x = closestSpawn.x;
	        y = closestSpawn.y;
	        areaID = global.playerAreaID;
	    }
	}
}*/
#endregion

//Track zombie’s current area
if(instance_exists(oAreaMarker)) {
    if(place_meeting(x, y, oAreaMarker)) {
        var inst = instance_place(x, y, oAreaMarker);
        if(instance_exists(inst)) {
            areaID = inst.areaID;
        }
    }

    //If zombie is in a different area than the player
    if(areaID != global.playerAreaID) {
        var spawnList = [];

        //Collect all spawn points in the player's area
        with(oZombieAreaSpawn) {
            if(areaID == global.playerAreaID) {
                array_push(spawnList, id);
            }
        }

        //Pick a random one and teleport the zombie
        if(array_length(spawnList) > 0) {
            var randomSpawn = spawnList[irandom(array_length(spawnList) - 1)];

            //Warp to the new location
            x = randomSpawn.x;
            y = randomSpawn.y;
            areaID = global.playerAreaID;
			create_animated_vfx(sPoof, x, y, depth - 50);
        }
    }
}