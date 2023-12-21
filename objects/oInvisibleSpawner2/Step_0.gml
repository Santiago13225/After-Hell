///oInvisibleSpawner2 Step Event
/*This object represents a spawner.*/
//This event is responsible for handling spawner behavior.

#region

var countdownInitialized = false;//Set countdown initialized to false.
if screen_pause(){//Pause self
    exit;
}

var activeSpawns = ds_list_create();//Declare activeSpawns as a list.

timer++;//Spawn an enemy.

if instance_number(oEnemyParent) >= activeEnemyMax || global.totalEnemiesSpawned >= maxTotalEnemies{//Reset timer when enemy limits have been reached.
    timer = 0;
}

if timer >= spawnTime{
    //Find all active oSpawn objects and add them to the activeSpawns list.
    //if(waveBufferTimer <= 0 && zombiesSpawnedThisWave < activeEnemyMax) {
	ds_list_clear(activeSpawns);
    with(oInvisibleSpawner2){
        if isActive{
            ds_list_add(activeSpawns, id);
        }
    }
    
    var numActiveSpawns = ds_list_size(activeSpawns);
    if numActiveSpawns > 0{
        var chosenSpawn = activeSpawns[|irandom(numActiveSpawns - 1)];
        
        //Spawn a zombie at the chosen oSpawn object.
        var chosenZombieType = chooseZombieType();
        instance_create_depth(chosenSpawn.x, chosenSpawn.y, chosenSpawn.depth - 1, chosenZombieType);

        timer = 0;//Reset the timer.

		if (zombiesKilledThisWave >= activeEnemyMax){//If there are still zombies to kill...
			waveInProgress = true;//Make sure waveInProgress is set to true to prevent spawning multiple waves at once.
			timeSinceLastWave = 0;//Set the time for the next wave change.
		}
    }
}

//Check if the wave duration has passed and allow starting a new wave.
if waveInProgress{
    timeSinceLastWave++;
    // Display a message for wave completion
    //show_message("Wave " + string(currentWave) + " completed!");
	//if instance_exists(oEnemyParent){
	//timer = 0;
		//instance_destroy(oEnemyParent);
	//}
	// Check if the countdown has been initialized for the current wave
    if(!countdownInitialized){
        countdownInitialized = true;//Initialize the countdown once.
        //show_message("Get ready for Wave " + string(currentWave + 1) + "!");
    }
	
    if (timeSinceLastWave >= waveDuration){
        waveInProgress = false;
        currentWave++;//Increment the current wave.
		//waveStartMessageShown = true;
		//Increase activeEnemyMax based on your desired logic.
        activeEnemyMax += 2;//Increase activeEnemyMax by 2.
		
		if(activeEnemyMax > maxActiveEnemyMax){
			activeEnemyMax = maxActiveEnemyMax;
		}
		/*
		if(activeEnemyMax >= maxTotalEnemies){
            activeEnemyMax = maxTotalEnemies;
        }*/
		
		/*
        // Increase activeEnemyMax if it's below the maxTotalEnemies limit
        if (activeEnemyMax < maxTotalEnemies)
        {
            activeEnemyMax += 2; // You can adjust the rate of increase here (e.g., += 10 for a faster increase)
            if (activeEnemyMax >= maxTotalEnemies)
            {
                activeEnemyMax = maxTotalEnemies; // Cap activeEnemyMax at maxTotalEnemies
            }
        }*/

        timeSinceLastWave = 0;//Reset the timer for the next wave.
		
		//Display a message for wave completion and the next wave
		//show_message("Wave " + string(currentWave) + " completed!");
        //show_message("Get ready for Wave " + string(currentWave + 1) + "!");
        zombiesKilledThisWave = 0;//Reset zombiesKilledThisWave to 0 for the next wave.
        countdownInitialized = false;//Reset the countdown initialization for the next wave.
    }
}

ds_list_destroy(activeSpawns);//Clear the activeSpawns list.

#endregion