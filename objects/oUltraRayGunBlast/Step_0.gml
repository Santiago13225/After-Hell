///oUltraRayGunBlast Step Event
/*This object represents the ultra raygun blast object.*/
//This event is responsible for handling the ultra raygun blast object behavior.

event_inherited();//Inherit the parent event.

//Collision
if place_meeting(x, y, oSolidWall){
	//instance_destroy();
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oUltraRaygunExplosion);
		with(_boomInst){
			image_xscale = 0.75;
			image_yscale = 0.75;
		}

		//Destroy self
		instance_destroy();
		destroy = true;
} else if place_meeting(x, y, oEnemyParent){
	//instance_destroy();
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oUltraRaygunExplosion);
		with(_boomInst){
			image_xscale = 0.75;
			image_yscale = 0.75;
		}

		//Destroy self
		instance_destroy();
		destroy = true;
}