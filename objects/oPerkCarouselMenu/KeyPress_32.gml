//Save selected perk and go to map selection
global.perkIndex = item;
instance_destroy();
instance_create_layer(0, 0, "Instances", oCarouselMenu);

switch(global.perkIndex) {
    case 0: break;//None
    case 1: global.firerate = true; break;
	case 2: global.energyshield = true; break;
	case 3: global.juggernaut = true; break;
	case 4: global.speed = true; break;
	case 5: global.luck = true; break;
	case 6: global.magnet = true; break;
	case 7: global.flakjacket = true; break;
    //future cases: global.perkShield = true, etc.
}
