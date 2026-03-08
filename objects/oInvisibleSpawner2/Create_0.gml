///oInvisibleSpawner2 Create Event
/*This object represents a spawner.*/
//This event is responsible for initializing some spawner values.

depth = -bbox_top;
isActive = true;

countdownInitialized = false;//Set countdown initialized to false.
global.zombiesSpawnedThisWave = 0;

//Spawner Stuff
timer = 0;//Set timer to 0.
spawnTime = 3 * 60;//60 is equal to 1 second.
//timer = irandom(spawnTime * 2);
//waveDuration = 2700;//Adjust this value to control the duration of each wave intermission.
waveDuration = 120;//Adjust this value to control the duration of each wave intermission.
//timeBetweenWaves = 60;//Adjust this value to control the time between waves.
//global.zombiesKilledThisWave = 0;
if(!variable_global_exists("waveInProgress")){
	global.waveInProgress = false;//Wave system variables.
	global.activeEnemyMax = 7;//Starting value for the maximum active enemies.
	global.currentWave = 1;//Starting wave number.
	global.timeSinceLastWave = 0;//Keep track of the time passed since the last wave.
	global.zombiesKilledThisWave = 0;
	global.zombiesSpawnedThisWave = 0;
	global.maxActiveEnemies = 112;//HARD ACTIVE ENEMY CAP
}
//waveIncrementTime = 600;//Adjust this value to control the time between each wave increment.
//waveIncrementTimer = 0;//Keep track of the time passed since the last wave increment.
//maxTotalEnemies = 999999;//Set your desired maximum total enemies here.
if(room == rm_Tutorial_Level){
	maxTotalEnemies = 6;
}else{
	maxTotalEnemies = 999999;
}
//maxTotalEnemies = 1;//Set your desired maximum total enemies here.

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
		//Cache preset reference
		presetData = global.matchPresets[global.matchPresetIndex];

		//Detect whether this preset uses tiers
		usesTierSystem = false;

		for(var i = 0; i < array_length(presetData); i++) {
		    if(variable_struct_exists(presetData[i], "tier")) {
				usesTierSystem = true;
				break;
		    }
		}
		
		//Cache highest tier in this preset
		maxPresetTier = 0;

		if(usesTierSystem) {
		    for(var i = 0; i < array_length(presetData); i++) {
		        if(presetData[i].tier > maxPresetTier) {
		            maxPresetTier = presetData[i].tier;
		        }
		    }
		}
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
    for(var j = 0; j < array_length_1d(zombieTypes); j++) {
        currentProbability += zombieTypes[j].probability;
        if (randomNumber <= currentProbability) {
            return zombieTypes[j].type;
        }
    }
    return oZombie;//Return a default type in case of any issues.
}
//zombiesKilledThisWave = 0;//Add a new variable to track zombies killed in the current wave.
//global.waveStartMessageShown = false;
function getMaxTierForWave(_wave) {
    if (_wave <= 2) return 1;
    if (_wave <= 4) return 2;
    if (_wave <= 6) return 3;
    if (_wave <= 8) return 4;
    return 5;
}
/*
function getMinTierForWave(_wave) {
    //Only remove weak tiers if preset has 4 or more tiers
    if(maxPresetTier < 4) {
        return 1;
    }
    //After all tiers are introduced, begin phasing out weaker tiers
    if(_wave >= 7) return 3;//Remove tier 1 and 2
    if(_wave >= 6) return 2;//Remove tier 1
    return 1;
}*/