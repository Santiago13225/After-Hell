///oSpawnerNewTest Step Event
/*This object represents a spawner.*/
//This event is responsible for handling spawner behavior.

// ---- Intermission handling ----
if(waveIntermission) {
    intermissionTimer -= 1;
    if(intermissionTimer <= 0) {
        //Start wave
        waveInProgress = true;
        waveIntermission = false;
        totalEnemiesThisWave = 0;
        enemiesKilledThisWave = 0;
        waveCompletedFlag = false;
        
        //Determine enemies for this wave
        waveEnemyTarget = 10 + (waveNumber - 1) * 5; // Example growth
        activeCap = min(128, 20 + waveNumber * 5);   // Cap grows, max 128
    }
    exit;
}

// ---- Wave in progress ----
if(waveInProgress) {
    //Spawn enemies if below active cap and below wave total
    if(activeEnemies < activeCap && totalEnemiesThisWave < waveEnemyTarget) {
        spawnTimer += 1;
        if(spawnTimer >= spawnRate) {
            spawnTimer = 0;
            
            //Pick a random spawn point
            var sp = spawnPoints[irandom(array_length(spawnPoints)-1)];
            
            //Pick a random enemy from preset
            var totalProbability = 0;
            for(var i = 0; i < array_length(presetList); i++) totalProbability += presetList[i].probability;
            var r = irandom(totalProbability-1);
            var chosenEnemy;
            var cumulative = 0;
            for(var i = 0; i < array_length(presetList); i++) {
                cumulative += presetList[i].probability;
                if(r < cumulative) {
                    chosenEnemy = presetList[i].type;
                    break;
                }
            }
            
            //Create enemy
            if(instance_exists(sp) && chosenEnemy != undefined) {
                instance_create_depth(sp.x, sp.y, 0, chosenEnemy);
                activeEnemies += 1;
                totalEnemiesThisWave += 1;
            }
        }
    }
    
    //Check wave completion
    if(enemiesKilledThisWave >= waveEnemyTarget && !waveCompletedFlag) {
        waveCompletedFlag = true;
        waveInProgress = false;
        waveIntermission = true;
        intermissionTimer = intermissionTime;
        
        //Show intermission message
        instance_create_depth(0, 0, -8000, oWaveEndScreen);
        audio_play_sound(sndRoundEnd1, 10, false);
        
        //Prepare next wave
        waveNumber += 1;
        presetIndex = global.matchPresetIndex; // Optionally update preset each wave
        presetList = global.matchPresets[presetIndex];
    }
}