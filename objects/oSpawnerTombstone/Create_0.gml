/*
//
depth = -bbox_top;

//spawner stuff
timer = 0;
spawnTime = 6*60;
*/
/*
// Create event
depth = -bbox_top;

// Spawner stuff
timer = 0;
spawnTime = 6 * 60;

// Array of different zombie types with corresponding spawn probabilities
zombieTypes = [
    {type: oZombie, probability: 50}, // oZombie with a 60% chance
    {type: oPurpleEyedZombie, probability: 20}, // oPurpleEyedZombie with a 0% chance
	{type: oRedEyedZombie, probability: 10}, // oRedEyedZombie with a 20% chance
    {type: oBlueEyedZombie, probability: 10}, // oBlueEyedZombie with a 20% chance
	{type: oHellHound, probability: 10} // oHellHound with a 20% chance
	// Add more zombie types with their probabilities here
];

// Function to perform weighted random selection based on probabilities
/// Returns the chosen zombie type
function chooseZombieType() {
    var totalProbability = 0;
    
    // Calculate the total probability sum
    for (var i = 0; i < array_length_1d(zombieTypes); i++) {
        totalProbability += zombieTypes[i].probability;
    }
    
    // Randomly choose a number within the total probability range
    var randomNumber = irandom_range(1, totalProbability);
    var currentProbability = 0;
    
    // Iterate over zombie types and find the chosen one based on probabilities
    for (var j = 0; j < array_length_1d(zombieTypes); j++) {
        currentProbability += zombieTypes[j].probability;
        if (randomNumber <= currentProbability) {
            return zombieTypes[j].type;
        }
    }
    
    // Return a default type in case of any issues
    return oZombie;
}*/