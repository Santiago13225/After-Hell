function item_add(_item){
	var _added = false;
	
	if array_length(oItemManager3.inv) < oItemManager3.inv_max{	
		array_push(oItemManager3.inv, _item);
		_added = true;
	}
	return _added;
}

function removeWeaponFromPlayer(weapon){
    var arrayLength = array_length(global.PlayerWeapons);
    var weaponFound = false;
    var weaponIndex = -1;

    for(var i = 0; i < arrayLength; i++){
        if(global.PlayerWeapons[i] == weapon){
            weaponFound = true;
            weaponIndex = i;
            break;
        }
    }
    if(weaponFound){
        //Remove the weapon from the array
        for(var j = weaponIndex; j < arrayLength - 1; j++){
            global.PlayerWeapons[j] = global.PlayerWeapons[j + 1];
        }
        array_resize(global.PlayerWeapons, arrayLength - 1);
    }
}
