///oEnemyParent Create Event
/*This object represents an enemy parent.*/
//This event is responsible for creating the enemy parent.
event_inherited();//Inherit the parent event.
get_damage_create();//Set health to default of 10.

global.totalEnemiesSpawned++;//Increment the total enemies spawned count.

areaID = -1;