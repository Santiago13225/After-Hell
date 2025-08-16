//pause self
if screen_pause() {
	exit;
}

//Create Damage Objects
if createdDamageObjects == false{

	if(global.flakjacket){
		damageInst = instance_create_depth(x, y, 0, oDamageEnemy);//Create an object to damage enemies
	}else	{
		damageInst = instance_create_depth(x, y, 0, oDamageAll);//Create an object to damage enemies
	}

	with(damageInst){
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	
	//set created variable to true so we don't make a million damage objects
	createdDamageObjects = true;
}

//get rid of the damage objects once they are done
if image_index >= 2{
	//destroy
	if instance_exists(damageInst){
		instance_destroy(damageInst);
	}
}