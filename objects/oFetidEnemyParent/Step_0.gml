//receive damage
get_damage(oDamageEnemy);

var waveCompletionMessageShown = false;
//var waveEndShown = false;

if place_meeting(x, y, oUnstableBullet) //&& !place_meeting(x, y, oEnemyParent)
{
	image_blend = c_red;
	//state = 0;
} else {
	image_blend = c_white;
}

//death
if hp <= 0{
	if instance_exists(oHUD2){
		if !instance_exists(oScoreEffect){
			/*
			var _scoreInst = instance_create_depth(x, y, -3000, oScoreEffect);

			if (_scoreInst) {
			    _scoreInst.scoreValue = 100; // Assign the zombie's score value
			    _scoreInst.ShowEffect(100, x, y); // Call the ShowEffect function
			}*/
			zombieScoreValue = 100;
			var _scoreInst = instance_create_depth(x, y, -3000, oScoreEffect);

			if (_scoreInst) {
			    _scoreInst.scoreValue = zombieScoreValue; // Assign the zombie's score value
			    _scoreInst.ShowEffect(zombieScoreValue, x, y); // Call the ShowEffect function
			}
			
		}
		oHUD2.playerScore += 100;
	}
	//add to the total amount of enemies killed
	global.enemyKillCount++;
	oInvisibleSpawner2.zombiesKilledThisWave++;
	if oInvisibleSpawner2.zombiesKilledThisWave == oInvisibleSpawner2.activeEnemyMax && !waveCompletionMessageShown
    {
        // Display the wave completion message if zombiesKilledThisWave >= activeEnemyMax
		audio_play_sound(sndRoundEnd1, 10, false);
		instance_create_depth(x, y, -8000, oWaveEndScreen);
        waveCompletionMessageShown = true; // Set the flag to true
		if waveCompletionMessageShown == true{
			var _create_end = function(){
			    audio_play_sound(sndRoundStart1, 10, false);
				instance_create_depth(x, y, -8000, oWaveStartScreen);
			}
			call_later(15, time_source_units_seconds, _create_end);
		}
		//oInvisibleSpawner2.ds_list_clear(oInvisibleSpawner2.activeSpawns);
    }
	//determine if we should drop an item
	var _chance = irandom(100);
	
	//if global.enemyKillCount mod 5 == 0//drop every 5 kills 
	if _chance < 25//% chance of drop
	{
		//create thingy
		instance_create_depth(x, y, depth, oMedkit);
	}
	
	if _chance > 25 && _chance < 75//% chance of drop
	{
		//create thingy
		instance_create_depth(x, y, depth, oRedbacks);
	}
	if _chance > 75//% chance of drop
	{
		//create thingy
		instance_create_depth(x, y, depth, oBronzebacks);
	}
	
	//play a sound effect
	audio_play_sound(sndSplatter, 8, false);
	
	//poof vfx
	//instance_create_depth(x, y, depth, oAnimatedVFX);
	create_animated_vfx(sPoof, x, y, depth);
	
	//destroy self
	instance_destroy();	
}