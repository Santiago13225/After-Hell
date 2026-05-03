///oCrate Step Event
/*This object represents a crate.*/
//This event is responsible for setting the crate's behavior.
get_damage(oDamageParent);//Set damage behavior.

//Show Damage
var _healthPercentage = 1 - (hp/maxHp);
image_index = _healthPercentage * image_number;

if hp <= 0{//If HP is less than or equal to 0...
	//Poof
	//instance_create_depth(x + 8, y + 16, depth, oAnimatedVFX);
	create_animated_vfx(sPoof, x+8, y+16, depth);//Create poof effect.

	//Find the setup object safely
	var _setup = instance_find(oSetupPathway, 0);

	if(_setup != noone) {
		var _grid = _setup.grid;

		var cx = x div 16;
		var cy = y div 16;

		mp_grid_clear_cell(_grid, cx, cy);
	}

	//Destroy
	instance_destroy();
}