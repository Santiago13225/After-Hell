///oRayGunBlast Step Event
/*This object represents the raygun blast object.*/
//This event is responsible for handling the raygun blast object behavior.

event_inherited();//Inherit the parent event.

//Collision
if place_meeting(x, y, oSolidWall){
	//instance_destroy();
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oRaygunExplosion);
		with(_boomInst){
			image_xscale = 0.5;
			image_yscale = 0.5;
		}

		//Destroy self
		instance_destroy();
		destroy = true;
} else if place_meeting(x, y, oEnemyParent){
	//instance_destroy();
	var _boomInst = instance_create_depth(x + 8, y + 8, -3000, oRaygunExplosion);
		with(_boomInst){
			image_xscale = 0.5;
			image_yscale = 0.5;
		}

		//Destroy self
		instance_destroy();
		destroy = true;
}