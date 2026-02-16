/// oInvisibleSpawner2 Step Event

if(screen_pause()) exit;

// Active spawns list
var activeSpawns = ds_list_create();
timer++;

// Check if spawn limit reached
if(instance_number(oEnemyParent) >= activeEnemyMax || global.totalEnemiesSpawned >= maxTotalEnemies){
    timer = 0;
}

// Spawn logic
if(timer >= spawnTime){
    ds_list_clear(activeSpawns);
    with(oInvisibleSpawner2){
        if(isActive){
            ds_list_add(activeSpawns, id);
        }
    }
    
    var numActiveSpawns = ds_list_size(activeSpawns);
    if(numActiveSpawns > 0){
        var chosenSpawn = activeSpawns[| irandom(numActiveSpawns - 1)];
        var chosenZombieType = chooseZombieType();
        instance_create_depth(chosenSpawn.x, chosenSpawn.y, chosenSpawn.depth - 1, chosenZombieType);
        timer = 0;
    }
}

// Wave intermission
if(waveInProgress){
    timeSinceLastWave++;
    
    if(timeSinceLastWave >= waveDuration){
        waveInProgress = false;
        currentWave++;
        
        // Increase active enemies for next wave
        activeEnemyMax *= 2;
        if(activeEnemyMax > maxActiveEnemyMax) activeEnemyMax = maxActiveEnemyMax;
        
        timeSinceLastWave = 0;
        zombiesKilledThisWave = 0;
    }
}

ds_list_destroy(activeSpawns);

// Store stats
if(instance_exists(oInvisibleSpawner2)){
    global.finalWave = oInvisibleSpawner2.currentWave;
}