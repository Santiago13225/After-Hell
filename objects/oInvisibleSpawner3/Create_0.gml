/// oInvisibleSpawner2 Create Event
depth = -bbox_top;
isActive = true;

// Spawner timer values
timer = 0;
spawnTime = 3 * 60; // 3 seconds
waveDuration = 120; // Duration of intermission between waves
timeSinceLastWave = 0;

// Wave tracking
activeEnemyMax = 7; // Starting active enemies
currentWave = 1;
maxActiveEnemyMax = 512;

// Total enemies spawned limit
if(room == rm_Tutorial_Level){
    maxTotalEnemies = 6;
} else {
    maxTotalEnemies = 999999;
}

// Select zombie types
if(room == rm_Tutorial_Level) {
    zombieTypes = [
        {type: oZombie, probability: 100}
    ];
} else {
    if(is_undefined(global.matchPresets)) {
        show_debug_message("Warning: global.matchPresets undefined. Defaulting to standard zombieTypes.");
        zombieTypes = [
            {type: oZombie, probability: 100}
        ];
    } else {
        zombieTypes = global.matchPresets[global.matchPresetIndex];
    }
}

// Weighted random selection function
function chooseZombieType() {
    var totalProbability = 0;
    for(var i = 0; i < array_length_1d(zombieTypes); i++){
        totalProbability += zombieTypes[i].probability;
    }
    
    var randomNumber = irandom_range(1, totalProbability);
    var currentProbability = 0;
    
    for(var j = 0; j < array_length_1d(zombieTypes); j++){
        currentProbability += zombieTypes[j].probability;
        if(randomNumber <= currentProbability){
            return zombieTypes[j].type;
        }
    }
    return oZombie;
}

waveInProgress = false;
zombiesKilledThisWave = 0;