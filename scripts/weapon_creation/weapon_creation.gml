//constructor template for weapons
//function create_weapon(_sprite = sPistol, _weaponLength = 0, _bulletObj = oBullet, _cooldown = 9, _bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup) constructor{
function create_weapon(_name = "Unknown", _sprite = sPistol, _weaponLength = 0, _bulletObj = oBullet, _cooldown = 9, _bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup, _ammo = 0) constructor{
	name = _name;//<-- add this
	sprite = _sprite;
	length = _weaponLength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
	ammo = _ammo;//new!
}

//the player's weapon inventory
global.PlayerWeapons = array_create(0);
global.PlayerAmmo = array_create(0);

//the weapons
global.WeaponList = {
	pistol : new create_weapon(
		"Pistol - MK.I",//<- name
		sPistol,
		sprite_get_bbox_right(sPistol) - sprite_get_xoffset(sPistol),
		oBullet,
		9,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sPistolPickup
	),
	raygun : new create_weapon(
		"Raygun - MK.I",//<- name
		sRaygun,
		sprite_get_bbox_right(sRaygun) - sprite_get_xoffset(sRaygun),
		oRayGunBlast,
		9,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sRaygunPickup
	),
	sniper : new create_weapon(
		"Sniper - MK.I",//<- name
		sSniper,
		sprite_get_bbox_right(sSniper) - sprite_get_xoffset(sSniper),
		oSniperBullet,
		80,//weapon shot delay
		25,//10 shots for 10 damage
		0,//bullet spread angle
		sSniperPickup
	),
	shotgun : new create_weapon(
		"Shotgun - MK.I",//<- name
		sShotgun,
		sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),
		oShotGunBullet,
		30,//weapon shot delay
		7,//7 shots
		45,//bullet spread angle
		sShotgunPickup
	),
	assault : new create_weapon(
		"AR - MK.I",//<- name
		sAssault,
		sprite_get_bbox_right(sAssault) - sprite_get_xoffset(sAssault),
		oBullet,
		7,//weapon shot delay
		2,//1 shot
		0,//bullet spread angle
		sAssaultPickup
	),
	smg : new create_weapon(
		"SMG - MK.I",//<- name
		sSMG,
		sprite_get_bbox_right(sSMG) - sprite_get_xoffset(sSMG),
		oBullet,
		5,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sSMGPickup
	),
	lmg : new create_weapon(
		"LMG - MK.I",//<- name
		sLMG,
		sprite_get_bbox_right(sLMG) - sprite_get_xoffset(sLMG),
		oBullet,
		7,//weapon shot delay
		3,//1 shot
		0,//bullet spread angle
		sLMGPickup
	),
	bazooka : new create_weapon(
		"Bazooka - MK.I",//<- name
		sBazooka,
		sprite_get_bbox_right(sBazooka) - sprite_get_xoffset(sBazooka),
		oRocket,
		12,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sBazookaPickup
	),
	hpistol : new create_weapon(
		"Pistol - MK.II",//<- name
		sHardcorePistol,
		sprite_get_bbox_right(sHardcorePistol) - sprite_get_xoffset(sHardcorePistol),
		oHardcoreBullet,
		9,//weapon shot delay
		2,//1 shot
		0,//bullet spread angle
		sHardcorePistolPickup
	),
	hraygun : new create_weapon(
		"Raygun - MK.II",//<- name
		sHardcoreRaygun,
		sprite_get_bbox_right(sHardcoreRaygun) - sprite_get_xoffset(sHardcoreRaygun),
		oHardcoreRayGunBlast,
		9,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcoreRaygunPickup
	),
	hsniper : new create_weapon(
		"Sniper - MK.II",//<- name
		sHardcoreSniper,
		sprite_get_bbox_right(sHardcoreSniper) - sprite_get_xoffset(sHardcoreSniper),
		oHardcoreSniperBullet,
		80,//weapon shot delay
		50,//10 shots for 10 damage
		0,//bullet spread angle
		sHardcoreSniperPickup
	),
	hshotgun : new create_weapon(
		"Shotgun - MK.II",//<- name
		sHardcoreShotgun,
		sprite_get_bbox_right(sHardcoreShotgun) - sprite_get_xoffset(sHardcoreShotgun),
		oHardcoreShotGunBullet,
		30,//weapon shot delay
		14,//14 shots
		45,//bullet spread angle
		sHardcoreShotgunPickup
	),
	hassault : new create_weapon(
		"AR - MK.II",//<- name
		sHardcoreAssault,
		sprite_get_bbox_right(sHardcoreAssault) - sprite_get_xoffset(sHardcoreAssault),
		oHardcoreBullet,
		7,//weapon shot delay
		4,//1 shot
		0,//bullet spread angle
		sHardcoreAssaultPickup
	),
	hsmg : new create_weapon(
		"SMG - MK.II",//<- name
		sHardcoreSMG,
		sprite_get_bbox_right(sHardcoreSMG) - sprite_get_xoffset(sHardcoreSMG),
		oHardcoreBullet,
		5,//weapon shot delay
		2,//1 shot
		0,//bullet spread angle
		sHardcoreSMGPickup
	),
	hlmg : new create_weapon(
		"LMG - MK.II",//<- name
		sHardcoreLMG,
		sprite_get_bbox_right(sHardcoreLMG) - sprite_get_xoffset(sHardcoreLMG),
		oHardcoreBullet,
		7,//weapon shot delay
		6,//1 shot
		0,//bullet spread angle
		sHardcoreLMGPickup
	),
	hbazooka : new create_weapon(
		"Bazooka - MK.II",//<- name
		sHardcoreBazooka,
		sprite_get_bbox_right(sHardcoreBazooka) - sprite_get_xoffset(sHardcoreBazooka),
		oHardcoreRocket,
		12,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sHardcoreBazookaPickup
	),
	upistol : new create_weapon(
		"Pistol - MK.III",//<- name
		sUltraPistol,
		sprite_get_bbox_right(sUltraPistol) - sprite_get_xoffset(sUltraPistol),
		oUltraBullet,
		7,//weapon shot delay
		3,//1 shot
		0,//bullet spread angle
		sUltraPistolPickup
	),
	uraygun : new create_weapon(
		"Raygun - MK.III",//<- name
		sUltraRaygun,
		sprite_get_bbox_right(sUltraRaygun) - sprite_get_xoffset(sUltraRaygun),
		oUltraRayGunBlast,
		7,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraRaygunPickup
	),
	usniper : new create_weapon(
		"Sniper - MK.III",//<- name
		sUltraSniper,
		sprite_get_bbox_right(sUltraSniper) - sprite_get_xoffset(sUltraSniper),
		oUltraSniperBullet,
		50,//weapon shot delay
		75,//75 shots for 75 damage
		0,//bullet spread angle
		sUltraSniperPickup
	),
	ushotgun : new create_weapon(
		"Shotgun - MK.III",//<- name
		sUltraShotgun,
		sprite_get_bbox_right(sUltraShotgun) - sprite_get_xoffset(sUltraShotgun),
		oUltraShotGunBullet,
		20,//weapon shot delay
		21,//14 shots
		45,//bullet spread angle
		sUltraShotgunPickup
	),
	uassault : new create_weapon(
		"AR - MK.III",//<- name
		sUltraAssault,
		sprite_get_bbox_right(sUltraAssault) - sprite_get_xoffset(sUltraAssault),
		oUltraBullet,
		5,//weapon shot delay
		6,//1 shot
		0,//bullet spread angle
		sUltraAssaultPickup
	),
	usmg : new create_weapon(
		"SMG - MK.III",//<- name
		sUltraSMG,
		sprite_get_bbox_right(sUltraSMG) - sprite_get_xoffset(sUltraSMG),
		oUltraBullet,
		3,//weapon shot delay
		3,//1 shot
		0,//bullet spread angle
		sUltraSMGPickup
	),
	ulmg : new create_weapon(
		"LMG - MK.III",//<- name
		sUltraLMG,
		sprite_get_bbox_right(sUltraLMG) - sprite_get_xoffset(sUltraLMG),
		oUltraBullet,
		5,//weapon shot delay
		9,//1 shot
		0,//bullet spread angle
		sUltraLMGPickup
	),
	ubazooka : new create_weapon(
		"Bazooka - MK.III",//<- name
		sUltraBazooka,
		sprite_get_bbox_right(sUltraBazooka) - sprite_get_xoffset(sUltraBazooka),
		oUltraRocket,
		12,//weapon shot delay
		1,//1 shot
		0,//bullet spread angle
		sUltraBazookaPickup
	),
}