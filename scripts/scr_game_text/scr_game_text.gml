/// @function				scr_game_text(_text_id);
/// @param {string} text_id	The string of the textbox case to use for the game.
/// @description			Creates dialog based on the switch case used.
function scr_game_text(_text_id){
	switch(_text_id)
	{
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
		
		case "Tutorial":
			scr_text("Press [space] to move through the dialog when ready.");
			scr_text("Welcome to After Hell! A game brought to you by Santiago Alvarez Bermudez.");
			scr_text("There is a lot to go over today. This game is a top-down shooter, where you will have to survive various waves of zombies.");
			scr_text("The controls are simple. Use the WASD keys to move the player anywhere.");
			scr_text("Use the mouse to aim your weapon. Left-click anywhere on screen to shoot. Right-click to switch weapons.");
			scr_text("Use the enter key to pause the game. You can pause to adjust settings, go back to the main menu, or just catch a break.");
			scr_text("On the upper-left of the screen will be a wave and enemy counter. These will let you know what wave you are on and how many enemies are left in the wave.");
			scr_text("On the upper-right of the screen will be a score pool. This will let you know how many points you have for spending power.");
			scr_text("On the lower-right of the screen is the player's inventory. You can only carry four items at a time and you cannot unequip the pistol.");
			scr_text("If applicable, you can left-click an item on the inventory to use its effects. You can also right-click to drop an item from the inventory if applicable.");
			scr_text("You can also drag your mouse over any item in the inventory to highlight it and view its description.");
			scr_text("Throughout the levels, you will either find wallbuys or strongboxes from which you can buy weapons.");
			scr_text("When you get close to a wallbuy, strongbox, or any other purchasable object, it will be highlighted in a different color.");
			scr_text("A textbox will also appear from the lower-middle of the screen to tell you the cost of said item.");
			scr_text("Throughout the levels, you will also find an armory augmentor. You can use this to upgrade your weapons.");
			scr_text("In some levels, there will be warp blocks that can be used to navigate to a different area of the map.");
			scr_text("As the waves progress, more and more zombies will start to spawn. There are many different types of zombies.");
			scr_text("There are standard zombies, fetid zombies, evolved zombies, apex zombies, and elite zombies.");
			scr_text("Different types of zombies will have varying levels of health, speed, and damage. Zombies will also have different eye colors.");
			scr_text("Black-eyed zombies are considered normal, blue-eyed zombies are faster than normal, ...");
			scr_text("... red-eyed zombies deal extra damage, and purple-eyed zombies will throw projectiles at you.");
			scr_text("The zombies will also drop medkits and cash at random. The currencies will also vary in value based on their color.");
			scr_text("They increase in value according to the following order: green, blue, red, bronze, silver, gold, and black.");
			scr_text("The point of this game is to use the skills and tools you have at your disposal to survive for as long as possible.");
			scr_text("Keep in mind that this game is still in development and that what you see now is not considered a finished product. Many things are subject to change.");
			scr_text("Please note that this is only a tutorial. You are free to roam around and explore as much as you like.");
			scr_text("When you are ready to leave, you may use the enter key to open the pause menu and exit the tutorial.");
			scr_text("I hope that you find yourself enjoying this game as much as I did creating it. Good luck out there!");
			break;
			
		case "ShotgunWallbuy":
			scr_text("Press [G] to purchase Shotgun/Ammo for 500\nPress [Space] to dismiss this message");
			break;
		
		case "RaygunWallbuy":
			scr_text("Press [G] to purchase Raygun/Ammo for 15000\nPress [Space] to dismiss this message");
			break;
			
		case "SniperWallbuy":
			scr_text("Press [G] to purchase Sniper/Ammo for 1500\nPress [Space] to dismiss this message");
			break;
		
		case "AssaultWallbuy":
			scr_text("Press [G] to purchase AR/Ammo for 1800\nPress [Space] to dismiss this message");
			break;
		
		case "BazookaWallbuy":
			scr_text("Press [G] to purchase Bazooka/Ammo for 18000\nPress [Space] to dismiss this message");
			break;
		
		case "SMGWallbuy":
			scr_text("Press [G] to purchase SMG/Ammo for 1500\nPress [Space] to dismiss this message");
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
			scr_text("Press left face button to purchase Shotgun/Ammo for 500\nPress upper face button to remove this message.");
			break;
			
		case "RaygunWallbuyC":
			scr_text("Press left face button to purchase Raygun/Ammo for 15000\nPress upper face button to remove this message.");
			break;
			
		case "SniperWallbuyC":
			scr_text("Press left face button to purchase Sniper/Ammo for 1500\nPress upper face button to remove this message.");
			break;

		case "AssaultWallbuyC":
			scr_text("Press left face button to purchase AR/Ammo for 1800\nPress upper face button to remove this message.");
			break;
			
		case "BazookaWallbuyC":
			scr_text("Press left face button to purchase Bazooka/Ammo for 18000\nPress upper face button to remove this message.");
			break;
			
		case "SMGWallbuyC":
			scr_text("Press left face button to purchase SMG/Ammo for 1500\nPress upper face button to remove this message.");
			break;
			
		case "LMGWallbuyC":
			scr_text("Press left face button to purchase LMG/Ammo for 2500\nPress upper face button to remove this message.");
			break;
		
		case "MedkitWallbuyC":
			scr_text("Press left face button to purchase Medkit for 500\nPress upper face button to remove this message.");
			break;
			
		case "DebrisC":
			scr_text("Press left face button to clear Debris for 500\nPress upper face button to remove this message.");
			break;
		
		case "Upgrade - StandardC":
			scr_text("Press left face button to upgrade weapon for 5000\nPress upper face button to remove this message.");
			break;
	}

}