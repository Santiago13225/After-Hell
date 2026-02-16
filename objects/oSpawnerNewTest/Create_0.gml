///oSpawnerNewTest Create Event
/*This object represents a spawner.*/
//This event is responsible for initializing some spawner values.

//Wave settings
waveNumber = 1;                    // Current wave number
waveInProgress = false;            // Is a wave active?
waveIntermission = true;           // Start with an intermission
intermissionTime = 5 * room_speed; // Seconds between waves
intermissionTimer = intermissionTime;

//Enemy tracking
activeEnemies = 0;                 // Currently spawned enemies
totalEnemiesThisWave = 0;          // Total enemies spawned in this wave
enemiesKilledThisWave = 0;         // Track kills
waveEnemyTarget = 10;              // Total enemies to kill for this wave
activeCap = 110;                    // Max active enemies at a time

//Spawn points
spawnPoints = [];                  // IDs of spawner objects in the room
with(oSpawnerNewTest) {                // Collect all spawner instances
    array_push(spawnPoints, id);
}

//Enemy spawn control
spawnRate = 1;                      // Optional: enemies per step
spawnTimer = 0;                     

//Preset system
presetIndex = global.matchPresetIndex;//Default preset
presetList = global.matchPresets[presetIndex];

//Flags
waveCompletedFlag = false;