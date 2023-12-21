
#region
/*
//pause self
if screen_pause() 
{
	exit;
}

//spawn an enemy
timer++;

//reset timer when enemy limits have been reached
if instance_number(oEnemyParent) >= global.activeEnemyMax || global.totalEnemiesSpawned >= global.enemyRoomMax
{
	timer = 0;
}

if timer >= spawnTime && !place_meeting(x, y, oZombie)
{
	//create an enemy
	var _inst = instance_create_depth(x, y, depth - 1, oZombie);
	with(_inst)
	{
		//make the zombie invisible at first
		image_alpha = 0;
		state = -1;
	}
	//reset the timer
	timer = 0;
}
*/
#endregion
// Step event
// Pause self
if screen_pause() 
{
    exit;
}

// Spawn an enemy
timer++;

// Reset timer when enemy limits have been reached
if instance_number(oEnemyParent) >= global.activeEnemyMax || global.totalEnemiesSpawned >= global.enemyRoomMax
{
    timer = 0;
}

if timer >= spawnTime && !place_meeting(x, y, oZombie)
{
    // Choose a random zombie type based on probabilities
    var chosenZombieType = chooseZombieType();
    
    // Create an enemy of the chosen type
    var _inst = instance_create_depth(x, y, depth - 1, chosenZombieType);
    with(_inst)
    {
        // Make the zombie invisible at first
        image_alpha = 0;
        state = -1;
    }
    
    // Reset the timer
    timer = 0;
}