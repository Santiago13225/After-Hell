//draw_set_font(global.fontHUD);

scroll = [	"Controls:",
			"Use WASD to move the player.",
			"Use the mouse to aim your weapon.",
			"Left-click to shoot.",
			"Right-click to switch weapons.",
			"Left-click an item in the inventory to use it (*If applicable).",
			"Right-click an item in the inventory to drop it (*If applicable).",
			"Use the enter key to pause the game.",
			"Hints:",
			"You can highlight items in the inventory with your mouse to view their description.",
			"When near a wallbuy, you can purchase an item using the 'g' key.",
			"You can use the space bar to progress through or close text dialog boxes."
	]

arraylength = array_length(scroll);

scrollX = 640;
scrollY = 15;

counter = 0;
line = 0;