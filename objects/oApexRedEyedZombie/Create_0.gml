///oApexRedEyedZombie Create Event
/*This object represents an Apex Red Eyed Zombie.*/
//This event is responsible for creating some variables for the zombie specified.

event_inherited();//Inherit the parent event.
damage = 20;//Set the damage to 20.

spd = 0;//Zombie's initial speed.
chaseSpd = .8;//Speed used when chasing a target.
pathspeed = 0.8;
path = path_add();//Initialize a path for the zombie.
alarm[0] = 1;//Set Alarm 0 to true, which triggers it almost immediately.