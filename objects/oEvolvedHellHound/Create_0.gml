///oEvolvedHellHound Create Event
/*This object represents a Evolved Hell Hound.*/
//This event is responsible for creating some variables for the zombie specified.

event_inherited();//Inherit the parent event.

pathspeed = 1.8;

//Movement Variables
chaseSpd = 1.8;//Speed used when chasing a target.

trapTimer = 0;
cooldownTime = 60 * 5;//Adjust as needed for how frequently traps are dropped