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
			
		//case "ShotgunWallbuy":
			//scr_text("Press [G] to purchase Shotgun/Ammo for 500\nPress [Space] to dismiss this message");
			//break;
			
		case "ShotgunWallbuy":
			scr_text("Shotgun [Cost: 500] \nAmmo [Cost: 250] \n[G] to Purchase \n[Space] to Dismiss");
			break;
		
		//case "RaygunWallbuy":
			//scr_text("Press [G] to purchase Raygun/Ammo for 5000\nPress [Space] to dismiss this message");
			//break;
			
		case "RaygunWallbuy":
			scr_text("Raygun [Cost: 5000] \nAmmo [Cost: 2500] \n[G] to Purchase \n[Space] to Dismiss");
			break;
			
		//case "SniperWallbuy":
			//scr_text("Press [G] to purchase Sniper/Ammo for 1500\nPress [Space] to dismiss this message");
			//break;
			
		case "SniperWallbuy":
			scr_text("Sniper [Cost: 1500] \nAmmo [Cost: 750] \n[G] to Purchase \n[Space] to Dismiss");
			break;
		
		//case "AssaultWallbuy":
			//scr_text("Press [G] to purchase AR/Ammo for 1500\nPress [Space] to dismiss this message");
			//break;
		
		case "AssaultWallbuy":
			scr_text("AR [Cost: 1500] \nAmmo [Cost: 750] \n[G] to Purchase \n[Space] to Dismiss");
			break;
		
		//case "BazookaWallbuy":
			//scr_text("Press [G] to purchase Bazooka/Ammo for 6000\nPress [Space] to dismiss this message");
			//break;
			
		case "BazookaWallbuy":
			scr_text("Bazooka [Cost: 6000] \nAmmo [Cost: 3000] \n[G] to Purchase \n[Space] to Dismiss");
			break;
		
		//case "SMGWallbuy":
			//scr_text("Press [G] to purchase SMG/Ammo for 1300\nPress [Space] to dismiss this message");
			//break;
			
		case "SMGWallbuy":
			scr_text("SMG [Cost: 1300] \nAmmo [Cost: 650] \n[G] to Purchase \n[Space] to Dismiss");
			break;
		
		//case "LMGWallbuy":
			//scr_text("Press [G] to purchase LMG/Ammo for 2500\nPress [Space] to dismiss this message");
			//break;
			
		case "LMGWallbuy":
			scr_text("LMG [Cost: 2500] \nAmmo [Cost: 1250] \n[G] to Purchase \n[Space] to Dismiss");
			break;
		
		//case "MedkitWallbuy":
			//scr_text("Press [G] to purchase Medkit for 500\nPress [Space] to dismiss this message");
			//break;
			
		case "MedkitWallbuy":
			scr_text("Medkit [Cost: 500] \n[G] to Purchase \n[Space] to Dismiss");
			break;
			
		//case "Debris":
			//scr_text("Press [G] to clear Debris for 500\nPress [Space] to dismiss this message");
			//break;
			
		case "Debris":
			scr_text("Debris [Cost: 500] \n[G] to Remove \n[Space] to Dismiss");
			break;
			
		//case "Upgrade - Standard":
			//scr_text("Press [G] to upgrade weapon for 5000\nPress [Space] to dismiss this message");
			//break;
			
		case "Upgrade - Standard":
			scr_text("Upgrade [Cost: 5000] \n[G] to Purchase \n[Space] to Dismiss");
			break;
			
		case "ShotgunWallbuyC":
			scr_text("Shotgun [Cost: 500] \nAmmo [Cost: 250] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;
			
		case "RaygunWallbuyC":
			scr_text("Raygun [Cost: 5000] \nAmmo [Cost: 2500] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;
			
		case "SniperWallbuyC":
			scr_text("Sniper [Cost: 1500] \nAmmo [Cost: 750] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;

		case "AssaultWallbuyC":
			scr_text("AR [Cost: 1500] \nAmmo [Cost: 750] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;
			
		case "BazookaWallbuyC":
			scr_text("Bazooka [Cost: 6000] \nAmmo [Cost: 3000] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;
			
		case "SMGWallbuyC":
			scr_text("SMG [Cost: 1300] \nAmmo [Cost: 650] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;
			
		case "LMGWallbuyC":
			scr_text("LMG [Cost: 2500] \nAmmo [Cost: 1250] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;
		
		case "MedkitWallbuyC":
			scr_text("Medkit [Cost: 500] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;
			
		case "DebrisC":
			scr_text("Debris [Cost: 500] \n[Left Face Button] to Remove \n[Upper Face Button] to Dismiss");
			break;
		
		case "Upgrade - StandardC":
			scr_text("Upgrade [Cost: 5000] \n[Left Face Button] to Purchase \n[Upper Face Button] to Dismiss");
			break;
	}
}