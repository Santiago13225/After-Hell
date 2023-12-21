///oUnstableBullet Create Event
/*This object represents the unstable bullet object.*/
//This event is responsible for setting some variables for the unstable bullet object.
event_inherited();

//Shoot Burst
//create_animated_vfx(sShootBurst, x, y, depth-50);

hitVFX = true;

dir = 0;
spd = 5;
xspd = 0;
yspd = 0;

//Cleanup
//dirFix = false;
maxDist = 500;
destroy = false;
enemyDestroy = false;