/// @function				scr_game_text(_text_id);
/// @param {string} text_id	The string of the textbox case to use for the game.
/// @description			Creates dialog based on the switch case used.
function scr_game_text(_text_id){
	switch(_text_id){
		case "npc 1":
			scr_text("Hi.");
			scr_text("My name is Hannah Lopez.");
			scr_text("And you are?");
				scr_option("Akeeya", "npc 1 - Keke");
				scr_option("Gabby", "npc 1 - Gabs");
			break;
			case "npc 1 - Keke":
				scr_text("You can't control what you can't control. Can you Keke?");
				break;
			case "npc 1 - Gabs":
				scr_text("Never good enough. It was always that way.");
				break;
		case "npc 2":
			scr_text("Hi.");
			scr_text("My name is Hannah Sanchez.");
			scr_text("And you are?");
			break;

		case "ShotgunWallbuy":
			scr_text("Shotgun [Cost: 500] \nAmmo [Cost: 250] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
		case "RaygunWallbuy":
			scr_text("Raygun [Cost: 5000] \nAmmo [Cost: 2500] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
		case "SniperWallbuy":
			scr_text("Sniper [Cost: 1500] \nAmmo [Cost: 750] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
		case "AssaultWallbuy":
			scr_text("AR [Cost: 1500] \nAmmo [Cost: 750] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
		case "BazookaWallbuy":
			scr_text("Bazooka [Cost: 6000] \nAmmo [Cost: 3000] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
		case "SMGWallbuy":
			scr_text("SMG [Cost: 1300] \nAmmo [Cost: 650] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
		case "LMGWallbuy":
			scr_text("LMG [Cost: 2500] \nAmmo [Cost: 1250] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
		case "MedkitWallbuy":
			scr_text("Medkit [Cost: 500] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
		case "Debris":
			scr_text("Debris [Cost: 500] \n[Space] to Remove \n[E] to Dismiss", true);
			break;
		case "Upgrade - Standard":
			scr_text("Upgrade [Cost: 5000] \n[Space] to Purchase \n[E] to Dismiss", true);
			break;
			
		case "ShotgunWallbuyC":
			scr_text("Shotgun [Cost: 500] \nAmmo [Cost: 250] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
		case "RaygunWallbuyC":
			scr_text("Raygun [Cost: 5000] \nAmmo [Cost: 2500] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
		case "SniperWallbuyC":
			scr_text("Sniper [Cost: 1500] \nAmmo [Cost: 750] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
		case "AssaultWallbuyC":
			scr_text("AR [Cost: 1500] \nAmmo [Cost: 750] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
		case "BazookaWallbuyC":
			scr_text("Bazooka [Cost: 6000] \nAmmo [Cost: 3000] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
		case "SMGWallbuyC":
			scr_text("SMG [Cost: 1300] \nAmmo [Cost: 650] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
		case "LMGWallbuyC":
			scr_text("LMG [Cost: 2500] \nAmmo [Cost: 1250] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
		case "MedkitWallbuyC":
			scr_text("Medkit [Cost: 500] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
		case "DebrisC":
			scr_text("Debris [Cost: 500] \n[^] to Remove \n[#] to Dismiss", true);
			break;
		case "Upgrade - StandardC":
			scr_text("Upgrade [Cost: 5000] \n[^] to Purchase \n[#] to Dismiss", true);
			break;
	}
}