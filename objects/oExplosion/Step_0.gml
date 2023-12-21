///oExplosion Step Event
/*This object represents an explosion.*/
//This event is responsible for setting explosion behavior.

//Pause Self
if screen_pause(){
	exit;
}

//Create Damage Objects
if createdDamageObjects == false{//If created damage objects is false...
	damageInst = instance_create_depth(x, y, 0, oDamageAll);//Create an object to damage enemies.
	with(damageInst){
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}

	createdDamageObjects = true;//Set created variable to true so we don't make a million damage objects.
}

//Get rid of the damage objects once they are done.
if image_index >= 2{
	if instance_exists(damageInst){//If damage instance exists...
		instance_destroy(damageInst);//Destroy it.
	}
}