///oItemManager2 Create Event
/*This object represents an item manager object.*/
//This event is responsible for setting some variables for the item manager object.

depth = -8000;

//inv = [];

//global.font = font_add_sprite(sMainFont, 32, true, 1);
global.font = font_add_sprite(sHUDFont, 32, true, 1);

//Item constructor
function create_item(_name, _desc, _spr, _candrop, _effect, _droppedItem) constructor{
	name = _name;
	description = _desc;
	sprite = _spr;
	can_drop = _candrop;
	effect = _effect;
	droppedItem = _droppedItem;
}

//Create the items
global.item_list2 = {
/*
	burger : new create_item(
	"Burger",
	"It's a burger! Recovers hp.",
	sBurger,
	true,
	function()
	{
		oPlayer.hp += 5;
		
		//get rid of the item
		array_delete(inv, selected_item, 1);
		
		//array_insert(inv, selected_item, global.item_list2.halfBurger);
	},
	oItemOverworld
	),
	
	halfBurger : new create_item
	(
	"Half-Eaten Burger",
	"It's a half-eaten burger! Recovers HP.",
	sHalfBurger,
	true,
	function()
	{
		oPlayer.hp += 5;//51:22 - Count!
		//get rid of the item
		array_delete(inv, selected_item, 1);
	},
	sHalfBurger
	),
	bomb : new create_item(
	"Bomb",
	"It's a bomb! Kaboom!",
	sBurger,
	true,
	function()
	{
		//oPlayer.hp += 10;
		if oPlayer.bomb_count > 0{
		//get rid of the item
		bomb_count--;
		instance_create_depth(oPlayer.x, oPlayer.y, 0, oBomb);
		//array_delete(inv, selected_item, 1);
		}
	}
	),*/
	/*
	redkey : new create_item(
	"Red Key",
	"It's a red key! Boom!",
	sBurger,
	true,
	function()
	{
		var _used = false;
	
		if instance_exists(oRedDoor){
			with(oRedDoor)
			{
				if distance_to_object(obj_player) < 20
				{
					instance_destroy();
					_used = true;
				}
			}
		}
		//get rid of the item
		if _used == true
		{
			array_delete(inv, selected_item,1);
		}
	}
	),*/
	
	//Create the items
	medkit : new create_item
	(
	"Medkit",
	"It's a medkit! Recovers HP.\nEffects: +40 hp\n",
	sMedkit,
	true,
	function()
	{
		oPlayer.hp += 40;//51:22 - Count!
		instance_create_depth(x, y, -8000, oHealEffect);//Show heal effect.
		//instance_create_depth(x, y, -8000, oHealScreen);
		oSFX.pickupSnd = true;
		array_delete(oItemManager2.inv, selected_item, 1);//Get rid of the item.
	},
	oMedkit
	),

	pistol : new create_item
	(
	"Pistol",
	"Standard.\nDamage: 1\nFire Rate: +++\nPierce: No\nAmmo Type: Light\nPros: Unlimited Ammo\nCons: Low Damage",
	sPistolPickup,
	false,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
		//draw_text_ext(camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 16 + 16 * array_length(inv), "Can't discard the pistol!", 12, 80);
	},
	oPistol
	),

	shotgun : new create_item
	(
	"Shotgun",
	"Standard.\nDamage: 1\nFire Rate: ++\nPierce: No\nAmmo Type: Shotgun Rounds\nPros: Spreadshot\nCons: Low Range",
	sShotgunPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oShotgun
	),
	
	raygun : new create_item
	(
	"Raygun",
	"Standard.\nDamage: 1\nFire Rate: +++\nPierce: Yes\nAmmo Type: Special Rounds\nPros: Splash Damage\nCons: Injurious to Player",
	sRaygunPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oRaygun
	),
	
	sniper : new create_item
	(
	"Sniper Rifle",
	"Standard.\nDamage: 25\nFire Rate: +\nPierce: Yes\nAmmo Type: Sniper Rounds\nPros: Penetration and damage\nCons: Low Rate of Fire",
	sSniperPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oSniper
	),
	
	assault : new create_item
	(
	"Assault Rifle",
	"Standard.\nDamage: 2\nFire Rate: ++++\nPierce: No\nAmmo Type: Rifle Rounds\nPros: High Rate of Fire\nCons: Moderate Damage",
	sAssaultPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oAssault
	),
	
	smg : new create_item
	(
	"SMG",
	"Standard.\nDamage: 1\nFire Rate: +++++\nPierce: No\nAmmo Type: Light\nPros: Very High Rate of Fire\nCons: Low Damage",
	sSMGPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oSMG
	),
	
	lmg : new create_item
	(
	"LMG",
	"Standard.\nDamage: 3\nFire Rate: ++++\nPierce: No\nAmmo Type: Heavy\nPros: High Rate of Fire\nCons: N/A",
	sLMGPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oLMG
	),
	
	bazooka : new create_item
	(
	"Bazooka",
	"Standard.\nDamage: 10\nFire Rate: Full Auto?\nPierce: No\nAmmo Type: Rockets\nPros: Splash Damage\nCons: Injurious to Player\nDon't ask why it is fully automatic. Just accept it.",
	sBazookaPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oBazooka
	),

	hpistol : new create_item
	(
	"Pistol",
	"Hardcore.\nDamage: 2\nFire Rate: +++\nPierce: No\nAmmo Type: Light\nPros: Unlimited Ammo\nCons: Moderate Damage",
	sHardcorePistolPickup,
	false,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oHardcorePistol
	),

	hshotgun : new create_item
	(
	"Shotgun",
	"Hardcore.\nDamage: 1\nFire Rate: ++\nPierce: No\nAmmo Type: Shotgun Rounds\nPros: Spreadshot\nCons: Moderate Range",
	sHardcoreShotgunPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oHardcoreShotgun
	),

	hraygun : new create_item
	(
	"Raygun",
	"Hardcore.\nDamage: 2\nFire Rate: +++\nPierce: Yes\nAmmo Type: Special Rounds\nPros: Splash Damage\nCons: Injurious to Player",
	sHardcoreRaygunPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oHardcoreRaygun
	),

	hsniper : new create_item
	(
	"Sniper Rifle",
	"Hardcore.\nDamage: 50\nFire Rate: +\nPierce: Yes\nAmmo Type: Sniper Rounds\nPros: Penetration and damage\nCons: Low Rate of Fire",
	sHardcoreSniperPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oHardcoreSniper
	),

	hassault : new create_item
	(
	"Assault Rifle",
	"Hardcore.\nDamage: 4\nFire Rate: ++++\nPierce: No\nAmmo Type: Rifle Rounds\nPros: High Rate of Fire\nCons: N/A",
	sHardcoreAssaultPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oHardcoreAssault
	),
	
	hsmg : new create_item
	(
	"SMG",
	"Hardcore.\nDamage: 2\nFire Rate: +++++\nPierce: No\nAmmo Type: Light\nPros: Very High Rate of Fire\nCons: Moderate Damage",
	sHardcoreSMGPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oHardcoreSMG
	),
	
	hlmg : new create_item
	(
	"LMG",
	"Hardcore.\nDamage: 6\nFire Rate: ++++\nPierce: No\nAmmo Type: Heavy\nPros: High Rate of Fire\nCons: N/A",
	sHardcoreLMGPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
		//draw_text_ext(camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 16 + 16 * array_length(inv), "Can't discard the pistol!", 12, 80);
	},
	oHardcoreLMG
	),
	
	hbazooka : new create_item
	(
	"Bazooka",
	"Hardcore.\nDamage: 32\nFire Rate: Full Auto?\nPierce: No\nAmmo Type: Rockets\nPros: Splash Damage\nCons: Injurious to Player\nDon't ask why it is fully automatic. Just accept it.",
	sHardcoreBazookaPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oHardcoreBazooka
	),
	
	upistol : new create_item
	(
	"Pistol",
	"Ultra.\nDamage: 3\nFire Rate: +++\nPierce: No\nAmmo Type: Light\nPros: Unlimited Ammo\nCons: N/A",
	sUltraPistolPickup,
	false,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oUltraPistol
	),
	
	ushotgun : new create_item
	(
	"Shotgun",
	"Ultra.\nDamage: 1\nFire Rate: ++\nPierce: No\nAmmo Type: Shotgun Rounds\nPros: Spreadshot\nCons: Moderate Range",
	sUltraShotgunPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oUltraShotgun
	),
	
	uraygun : new create_item
	(
	"Raygun",
	"Ultra.\nDamage: 3\nFire Rate: +++\nPierce: Yes\nAmmo Type: Special Rounds\nPros: Splash Damage\nCons: Injurious to Player",
	sUltraRaygunPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oUltraRaygun
	),
	
	usniper : new create_item
	(
	"Sniper Rifle",
	"Ultra.\nDamage: 75\nFire Rate: +\nPierce: Yes\nAmmo Type: Sniper Rounds\nPros: Penetration and damage\nCons: Low Rate of Fire",
	sUltraSniperPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oUltraSniper
	),
	
	uassault : new create_item
	(
	"Assault Rifle",
	"Ultra.\nDamage: 6\nFire Rate: ++++\nPierce: No\nAmmo Type: Rifle Rounds\nPros: High Rate of Fire\nCons: N/A",
	sUltraAssaultPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oUltraAssault
	),
	
	usmg : new create_item
	(
	"SMG",
	"Ultra.\nDamage: 3\nFire Rate: +++++\nPierce: No\nAmmo Type: Light\nPros: Very High Rate of Fire\nCons: N/A",
	sUltraSMGPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oUltraSMG
	),
	
	ulmg : new create_item
	(
	"LMG",
	"Ultra.\nDamage: 9\nFire Rate: ++++\nPierce: No\nAmmo Type: Heavy\nPros: High Rate of Fire\nCons: N/A",
	sUltraLMGPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oUltraLMG
	),
	
	ubazooka : new create_item
	(
	"Bazooka",
	"Ultra.\nDamage: 64\nFire Rate: Full Auto?\nPierce: No\nAmmo Type: Rockets\nPros: Splash Damage\nCons: Injurious to Player\nDon't ask why it is fully automatic. Just accept it.",
	sUltraBazookaPickup,
	true,
	function()
	{
		audio_play_sound(sndBeep, 8, false);
	},
	oUltraBazooka
	),
	
}

//Create the inventory
inv = array_create(0);

inv_max = 4;
selected_item = -1;
selected_item_controller = -1;

//array_push(inv, global.item_list2.pistol);
//array_push(inv, global.item_list2.medkit);
//array_push(inv, global.item_list2.medkit);
//array_push(inv, global.item_list2.medkit);
//array_push(inv, global.item_list.);

//For drawing and mouse positions
sep = 16;
screen_bord = 16;