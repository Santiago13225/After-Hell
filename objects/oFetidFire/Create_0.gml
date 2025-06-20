/// oFireTrap Create Event
/* This object represents a Fire Trap. It lasts for 5 seconds and damages the player on contact. */

event_inherited();//Inherit the parent event.

damage = 8;//How much damage it deals
lifetime = 60 * 5;//5 seconds at 60 FPS
timer = 0;

destroy = false;
playerDestroy = true;//If the trap should disappear on player contact