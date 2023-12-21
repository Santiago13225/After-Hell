///oSettings2 Create Event
/*This object initializes textbox settings and resources and 
 handles the cleanup of the textboxes that will be shown in 
 game as well.*/
//This event is responsible for loading the HUD font from a sprite.

global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1); //Set the global fontHUD to the created sprite.

//The font is used for the heads-up display (HUD) to display scores, messages, etc.
//The font size is set to 32 pixels.
//The font is anti-aliased (true) for smoother text rendering.
//The depth is set to 1 to ensure it's drawn above other objects.