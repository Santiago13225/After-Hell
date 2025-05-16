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

//Array of different zombie types with corresponding spawn probabilities.
zombieTypes = [
    {type: oZombie, probability: 3},//oZombie with a 3% chance.
	{type: oPurpleEyedZombie, probability: 3},//oPurpleEyedZombie with a 3% chance.
	{type: oRedEyedZombie, probability: 3},//oRedEyedZombie with a 3% chance.
    {type: oBlueEyedZombie, probability: 5},//oBlueEyedZombie with a 5% chance.
	{type: oHellHound, probability: 5},//oHellHound with a 5% chance.
	
	{type: oFetidZombie, probability: 5},//oFetidZombie with a 5% chance.
    {type: oFetidPurpleEyedZombie, probability: 5},//oFetidPurpleEyedZombie with a 5% chance.
	{type: oFetidRedEyedZombie, probability: 5},//oFetidRedEyedZombie with a 5% chance.
    {type: oFetidBlueEyedZombie, probability: 5},//oFetidBlueEyedZombie with a 5% chance.
	{type: oFetidHellHound, probability: 5},//oFetidHellHound with a 5% chance.
	
	{type: oEvolvedZombie, probability: 5},//oEvolvedZombie with a 5% chance.
    {type: oEvolvedPurpleEyedZombie, probability: 5},//oEvolvedPurpleEyedZombie with a 5% chance.
	{type: oEvolvedRedEyedZombie, probability: 5},//EvolvedRedEyedZombie with a 5% chance.
    {type: oEvolvedBlueEyedZombie, probability: 5},//oEvolvedBlueEyedZombie with a 5% chance.
	{type: oEvolvedHellHound, probability: 5},//oEvolvedHellHound with a 5% chance.
	
	{type: oApexZombie, probability: 5},//oApexZombie with a 5% chance.
    {type: oApexPurpleEyedZombie, probability: 5},//oApexPurpleEyedZombie with a 5% chance.
	{type: oApexRedEyedZombie, probability: 5},//oApexRedEyedZombie with a 5% chance.
    {type: oApexBlueEyedZombie, probability: 5},//oApexBlueEyedZombie with a 5% chance.
	{type: oApexHellHound, probability: 5},//oApexHellHound with a 5% chance.
	
	{type: oDarkMinionZombie, probability: 2},//oDarkMinionZombie with a 2% chance.
    {type: oHellHoundElite, probability: 2},//oHellHoundElite with a 2% chance.
	{type: oNightmarishZombie, probability: 2}//oNightmarishZombie with a 2% chance.
	// Add more zombie types with their probabilities here
];

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