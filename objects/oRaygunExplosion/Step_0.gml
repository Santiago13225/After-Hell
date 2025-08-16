///oRaygunExplosion Step Event
/*This object represents the raygun explosion object.*/
//This event is responsible for handling the raygun explosion object behavior.

//Pause Self
if screen_pause(){
	exit;
}

//Create damage objects
if createdDamageObjects == false{

	if(global.flakjacket){
		damageInst = instance_create_depth(x, y, 0, oDamageEnemy);//Create an object to damage enemies
	}else {
		damageInst = instance_create_depth(x, y, 0, oDamageAll);//Create an object to damage enemies
	}
	
	with(damageInst){
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	
	//Set created variable to true so we don't make a million damage objects
	createdDamageObjects = true;
}

//Get rid of the damage objects once they are done
if image_index >= 2{
	//Destroy
	if instance_exists(damageInst){
		instance_destroy(damageInst);
	}
}