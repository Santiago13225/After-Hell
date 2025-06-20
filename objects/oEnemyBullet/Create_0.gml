///oEnemyBullet Create Event
/*This object represents a Bullet.*/
//This event is responsible for creating some variables for the bullet object.

event_inherited();//Inherit the parent event.

damage = 4;//Damage dealt.

dir = 0;//Direction.
spd = 2;//Speed.
xspd = 0;//X-speed.
yspd = 0;//Y-speed.

//State Control
state = 0;//State variable.
//0 = not moving, aim for the player and wait for the enemy to shoot.
//1 = shoot towards the player.

//Cleanup
destroy = false;
playerDestroy = true;

//New: Lifetime control
lifetime = 60 * 30; //30 seconds
timer = 0;
