///oBlueEyedZombie Create Event
/*This object represents a Blue-Eyed Zombie.*/
//This event is responsible for creating some variables for the zombie specified.

event_inherited();//Inherit the parent event.

pathspeed = 1.0;

//Movement Variables
chaseSpd = 1.0;//Speed used when chasing a target.

trapTimer = 0;
cooldownTime = 60 * 5;//Adjust as needed for how frequently traps are dropped