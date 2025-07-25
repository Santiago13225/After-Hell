///oInvisibleSpawner2 Create Event
/*This object represents a spawner.*/
//This event is responsible for initializing some spawner values.

depth = -bbox_top;
isActive = true;

//Spawner Stuff
timer = 0;//Set timer to 0.
spawnTime = 3 * 60;//60 is equal to 1 second.
//waveDuration = 2700;//Adjust this value to control the duration of each wave intermission.
waveDuration = 120;//Adjust this value to control the duration of each wave intermission.
//timeBetweenWaves = 60;//Adjust this value to control the time between waves.
timeSinceLastWave = 0;//Keep track of the time passed since the last wave.
//waveIncrementTime = 600;//Adjust this value to control the time between each wave increment.
//waveIncrementTimer = 0;//Keep track of the time passed since the last wave increment.
//maxTotalEnemies = 999999;//Set your desired maximum total enemies here.
if(room == rm_Tutorial_Level){
	maxTotalEnemies = 6;
}else{
	maxTotalEnemies = 999999;
}
//maxTotalEnemies = 1;//Set your desired maximum total enemies here.
activeEnemyMax = 7;//Starting value for the maximum active enemies.
currentWave = 1;//Starting wave number.

maxActiveEnemyMax = 512;//Set your desired maximum value here.

if(room == rm_Tutorial_Level) {
	zombieTypes = [
	    {type: oZombie, probability: 100}
	];
}else {
	//Use the preset selected in the match settings carousel
	if(is_undefined(global.matchPresets)) {
		show_debug_message("Warning: global.matchPresets undefined. Defaulting to standard zombieTypes.");
		zombieTypes = [
			{type: oZombie, probability: 100}
			// Add more defaults or fallback here if needed...
		];
	}else {
		zombieTypes = global.matchPresets[global.matchPresetIndex];
	}
}

//Function to perform weighted random selection based on probabilities.
function chooseZombieType() {// Returns the chosen zombie type.
    var totalProbability = 0;
    
    //Calculate the total probability sum.
    for (var i = 0; i < array_length_1d(zombieTypes); i++) {
        totalProbability += zombieTypes[i].probability;
    }
    
    //Randomly choose a number within the total probability range.
    var randomNumber = irandom_range(1, totalProbability);
    var currentProbability = 0;
    
    //Iterate over zombie types and find the chosen one based on probabilities.
    for (var j = 0; j < array_length_1d(zombieTypes); j++) {
        currentProbability += zombieTypes[j].probability;
        if (randomNumber <= currentProbability) {
            return zombieTypes[j].type;
        }
    }
    return oZombie;//Return a default type in case of any issues.
}

waveInProgress = false;//Wave system variables.
zombiesKilledThisWave = 0;//Add a new variable to track zombies killed in the current wave.
//global.waveStartMessageShown = false;