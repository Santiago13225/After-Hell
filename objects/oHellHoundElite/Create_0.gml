///oHellHoundElite Create Event
/*This object represents a Hellhound ELite.*/
//This event is responsible for creating some variables for the zombie specified.

event_inherited();//Inherit the parent event.

//Movement Variables
spd = 0;//Zombie's initial speed.
chaseSpd = 2.0;//Speed used when chasing a target.
dir = 0;//Direction the zombie is facing.
xspd = 0;//Horizontal speed.
yspd = 0;//Vertical speed.

pathspeed = 2.0;

face = 1;//Default facing direction (1 for right).

//State Machine
state = 0;//Zombie's current state.
//^Spawn from mausoleum state(*might be deprecated).
//Note: State values represent different states like spawning or shooting.
fadeSpd = 1/15;//Speed at which the zombie fades in.
emergeSpd = .25;//Speed at which the zombie emerges.

path = path_add();//Initialize a path for the zombie.

if instance_exists(oPlayer){//If the player exists.
	target_x = oPlayer.x;//Set the target x-coordinate to the player's x-coordinate.
	target_y = oPlayer.y;//Set the target y-coordinate to the player's y-coordinate.
}

alarm[0] = 1;//Set Alarm 0 to true, which triggers it almost immediately.

trapTimer = 0;
cooldownTime = 60 * 5;//Adjust as needed for how frequently traps are dropped