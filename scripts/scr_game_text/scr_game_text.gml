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
			scr_text("Press [G] to purchase Shotgun/Ammo for 500\nPress [Space] to dismiss this message");
			break;
		
		case "RaygunWallbuy":
			scr_text("Press [G] to purchase Raygun/Ammo for 5000\nPress [Space] to dismiss this message");
			break;
			
		case "SniperWallbuy":
			scr_text("Press [G] to purchase Sniper/Ammo for 1500\nPress [Space] to dismiss this message");
			break;
		
		case "AssaultWallbuy":
			scr_text("Press [G] to purchase AR/Ammo for 1500\nPress [Space] to dismiss this message");
			break;
		
		case "BazookaWallbuy":
			scr_text("Press [G] to purchase Bazooka/Ammo for 6000\nPress [Space] to dismiss this message");
			break;
		
		case "SMGWallbuy":
			scr_text("Press [G] to purchase SMG/Ammo for 1300\nPress [Space] to dismiss this message");
			break;
		
		case "LMGWallbuy":
			scr_text("Press [G] to purchase LMG/Ammo for 2500\nPress [Space] to dismiss this message");
			break;
		
		case "MedkitWallbuy":
			scr_text("Press [G] to purchase Medkit for 500\nPress [Space] to dismiss this message");
			break;
			
		case "Debris":
			scr_text("Press [G] to clear Debris for 500\nPress [Space] to dismiss this message");
			break;
			
		case "Upgrade - Standard":
			scr_text("Press [G] to upgrade weapon for 5000\nPress [Space] to dismiss this message");
			break;
			
		case "ShotgunWallbuyC":
			scr_text("Press left face button to purchase Shotgun/Ammo for 500\nPress upper face button to remove this message");
			break;
			
		case "RaygunWallbuyC":
			scr_text("Press left face button to purchase Raygun/Ammo for 15000\nPress upper face button to remove this message");
			break;
			
		case "SniperWallbuyC":
			scr_text("Press left face button to purchase Sniper/Ammo for 1500\nPress upper face button to remove this message");
			break;

		case "AssaultWallbuyC":
			scr_text("Press left face button to purchase AR/Ammo for 1800\nPress upper face button to remove this message");
			break;
			
		case "BazookaWallbuyC":
			scr_text("Press left face button to purchase Bazooka/Ammo for 18000\nPress upper face button to remove this message");
			break;
			
		case "SMGWallbuyC":
			scr_text("Press left face button to purchase SMG/Ammo for 1500\nPress upper face button to remove this message");
			break;
			
		case "LMGWallbuyC":
			scr_text("Press left face button to purchase LMG/Ammo for 2500\nPress upper face button to remove this message");
			break;
		
		case "MedkitWallbuyC":
			scr_text("Press left face button to purchase Medkit for 500\nPress upper face button to remove this message");
			break;
			
		case "DebrisC":
			scr_text("Press left face button to clear Debris for 500\nPress upper face button to remove this message");
			break;
		
		case "Upgrade - StandardC":
			scr_text("Press left face button to upgrade weapon for 5000\nPress upper face button to remove this message");
			break;
	}
}