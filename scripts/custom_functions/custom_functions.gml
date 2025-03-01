//Drawing the player's weapon
function draw_my_weapon(){
	/*
	//player aiming
	centerY = y + centerYOffset;//set in step event
	//aim
	//keyboard and mouse
	if global.controllerMode == 0
	{
		aimDir = point_direction(x, centerY, mouse_x, mouse_y);
	}
	*/
	
	//Draw the Weapon
	//Get the weapon off the player's body
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
	
	var endX = x + lengthdir_x(600, aimDir);
	var endY = y + lengthdir_y(600, aimDir);
	
    //Draw the laser line
	//draw_line_width_color(x + _xOffset, centerY + _yOffset, endX, endY, 1, c_red, c_blue);

	//Flip the weapon upright
	var _weaponYscl = 1;
	if aimDir > 90 && aimDir < 270{
		_weaponYscl = -1;	
	}
	//draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, 1);
	draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, image_alpha);
}

//Drawing the player's weapon
function draw_my_laser(){
	//Draw the Weapon
	//Get the weapon off the player's body
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
	
	var endX = x + lengthdir_x(600, aimDir);
	var endY = y + lengthdir_y(600, aimDir);
	
    //Draw the laser line
	draw_line_width_color(x + _xOffset, centerY + _yOffset, endX, endY, 1, c_red, c_blue);
}

//VFX
function screen_pause(){
	//Pause Self
	if instance_exists(oScreenPause){
		image_speed = 0;
		return true;
	} else {
		image_speed = 1;
		return false;
	}
}
	
function create_screen_pause(_time = 3){
	//Screen Pause
	with(instance_create_depth(0, 0, 0, oScreenPauseTimed)){
		timer = _time;
	}
}
	
function screen_shake(_amount = 4){
	with(oCamera){
		xShakeAmount = _amount;
		yShakeAmount = _amount;
	}
}
	
function create_animated_vfx(_sprite, _x, _y, _depth, _rot = 0){
	with(instance_create_depth(_x, _y, _depth, oAnimatedVFX)){
		sprite_index = _sprite;
		image_angle = _rot;
	}
}
	
//Damage Calculation
//Damage Create Event
function get_damage_create(_hp = 10, _iframes = false){
	maxHp = _hp;
	hp = _hp;
			
	//Get the iframes
	if _iframes == true{
		iframeTimer = 0;
		iframeNumber = 90;
	}

	//Create the Damage List
	if _iframes == false{
		damageList = ds_list_create();
	}
}
	
//Damage Clean Up Event
function get_damage_cleanup(){
	//Do not need if we're using iframes!
	ds_list_destroy(damageList);//Delete our damage list data structure to free memory!
}
	
//Damage Step Event
function get_damage(_damageObj, _iframes = false){
	//Special exit for iframe timer
	if _iframes == true && iframeTimer > 0{
		iframeTimer--;
		
		if iframeTimer mod 5 == 0{
			if image_alpha == 1{
				image_alpha = 0;
			}else{
				image_alpha = 1;
			}
		}
		hp = clamp(hp, 0, maxHp);//Clamp HP.
		
		return false;//Exit by returning the function as false.
	}
	
	//Make sure the iframe blinking stops
	if _iframes == true{		
		image_alpha = 1;
	}
	
	//Receive Damage
	var _hitConfirm = false;
	if place_meeting(x, y, _damageObj) || (_damageObj != oDamageParent && place_meeting(x, y, oDamageAll)){
		//Getting a list of the damage instances.
		//Create ds list and copy instances to it.
		var _instList = ds_list_create();
		instance_place_list(x, y, _damageObj, _instList, false);
		if _damageObj != oDamageParent{
			instance_place_list(x, y, oDamageAll, _instList, false);
		}

		var _listSize = ds_list_size(_instList);//Get the size of our list.
	
		//Loop through the list.
		//var _hitConfirm = false;
		for(var i = 0; i < _listSize; i++){
			var _inst = ds_list_find_value(_instList, i);//Get a damage object instance from the list.

			//Check if this instance is already in the damage list.
			if _iframes == true || ds_list_find_index(damageList, _inst) == -1{
				if _iframes == false{
					ds_list_add(damageList, _inst);//Add the new damage instance to the damage list.
				}
				hp -= _inst.damage;//Take damage from specific instance.
				_hitConfirm = true;
				_inst.hitConfirm = true;//Tell the damage instance it has impacted.
				//_inst.destroy = true;
				//Create an impact visual
				if _inst.hitVFX == true{	
					create_animated_vfx(sShootBurst, _inst.x, _inst.y, _inst.depth-50);
				}
			}
		}

		//Set iframes if we were hit
		if _iframes == true && _hitConfirm{
			iframeTimer = iframeNumber;
		}

		ds_list_destroy(_instList);//Free memory by destroying the ds list.
	}
	
	//Clear the damage list of objects that don't exist anymore or aren't touchng anymore
	if _iframes == false{
		var _damageListSize = ds_list_size(damageList);
		for (var i = 0; i < _damageListSize; i++){
			//If not touching the damage instance anymore, remove it form the list and set the loop back one position
			var _inst = ds_list_find_value(damageList, i);
			if !instance_exists(_inst) || !place_meeting(x,y, _inst){
				ds_list_delete(damageList, i);
				i--;
				_damageListSize--;
			}
		}
	}

	hp = clamp(hp, 0, maxHp);//Clamp HP.
	
	return _hitConfirm;//Return hit control variable value.
}

function clear_weapons(){
	if instance_exists(oItemManager3){
		var weaponsToRemove = [global.WeaponList.shotgun, 
		global.WeaponList.raygun, global.WeaponList.sniper, global.WeaponList.assault,
	    global.WeaponList.smg, global.WeaponList.lmg, global.WeaponList.bazooka, 
		global.WeaponList.hshotgun, global.WeaponList.hraygun, global.WeaponList.hsniper,
		global.WeaponList.hassault, global.WeaponList.hsmg, global.WeaponList.hlmg, 
		global.WeaponList.hbazooka, global.WeaponList.ushotgun, global.WeaponList.uraygun,
		global.WeaponList.usniper, global.WeaponList.uassault,global.WeaponList.usmg,
		global.WeaponList.ulmg,global.WeaponList.ubazooka];
		var arrayLength = array_length(weaponsToRemove);
		var playerWeaponsLength = array_length(global.PlayerWeapons);

		for (var i = 0; i < arrayLength; i++){
			for (var j = 0; j < playerWeaponsLength; j++){
				if (global.PlayerWeapons[j] == weaponsToRemove[i]){
					array_delete(global.PlayerWeapons, j, 1);
					j--;//Decrement j to account for the removed element.
					playerWeaponsLength--;//Update the length of the array.
				}
				
				if (global.PlayerWeapons[j] == global.WeaponList.hpistol){
					array_set(global.PlayerWeapons, 0, global.WeaponList.pistol);
					array_set(oItemManager3.inv, 0, global.item_list2.pistol);
				}
				
				if (global.PlayerWeapons[j] == global.WeaponList.upistol){
					array_set(global.PlayerWeapons, 0, global.WeaponList.pistol);
					array_set(oItemManager3.inv, 0, global.item_list2.pistol);
				}
				
			}
		}
		oItemManager3.inv = [global.item_list2.pistol];
		oHUD2.playerScore = 500;
	} else {
		show_debug_message("No item manager exists?");
	}
}