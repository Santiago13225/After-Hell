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
	if instance_exists(oHUD){//If HUD exists...
		if !instance_exists(oScoreEffect){//If score effect not already displayed...
			zombieScoreValue = 100;//Set score to 100.
			var _scoreInst = instance_create_depth(x, y, -3000, oScoreEffect);//Create a score effect and store it in a variable.

			if(_scoreInst){//If score instance exists...
			    _scoreInst.scoreValue = zombieScoreValue;//Assign the zombie's score value.
			    _scoreInst.ShowEffect(zombieScoreValue, x, y);//Call the ShowEffect function.
			}
		}
		oHUD.playerScore += 100;//Add to player score.
	}
	global.enemyKillCount++;//Add to the total amount of enemies killed.
	oInvisibleSpawner2.zombiesKilledThisWave++;//Notify the spawner.
	if oInvisibleSpawner2.zombiesKilledThisWave == oInvisibleSpawner2.activeEnemyMax && !waveCompletionMessageShown
    {//If wave completed...
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

	var _chance = irandom(100);//Random variable used to determine if we should drop an item.
	
	//if global.enemyKillCount mod 5 == 0//drop every 5 kills 
	if _chance < 20{//% chance of drop.
		instance_create_depth(x, y, depth, oMedkit);//Create medkit.
	}
	if _chance > 20 && _chance < 40{//% chance of drop
		instance_create_depth(x, y, depth, oGreenbacks);//Create greenbacks.
	}
	if _chance > 40 && _chance < 50{//% chance of drop
		instance_create_depth(x, y, depth, oBluebacks);//Create bluebacks.
	}
	if _chance > 50 && _chance < 60{//% chance of drop
		instance_create_depth(x, y, depth, oRedbacks);//Create redbacks.
	}
	if _chance > 60 && _chance < 70{//% chance of drop
		instance_create_depth(x, y, depth, oBronzebacks);//Create bronzebacks.
	}
	if _chance > 70 && _chance < 80{//% chance of drop
		instance_create_depth(x, y, depth, oSilverbacks);//Create silverbacks.
	}
	if _chance > 80 && _chance < 90{//% chance of drop
		instance_create_depth(x, y, depth, oGoldbacks);//Create goldbacks.
	}
	if _chance > 90{//% chance of drop
		instance_create_depth(x, y, depth, oBlackbacks);//Create blackbacks.
	}
	
	audio_play_sound(sndSplatter, 8, false);//Play a sound effect.
	
	//Poof vfx
	//instance_create_depth(x, y, depth, oAnimatedVFX);
	create_animated_vfx(sPoof, x, y, depth);//Create visual effect.

	instance_destroy();//Destroy Self.
}