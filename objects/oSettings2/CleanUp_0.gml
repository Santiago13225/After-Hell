///oSettings2 Clean Up Event
/*This object initializes textbox settings and resources and 
 handles the cleanup of the textboxes that will be shown in 
 game as well.*/
//This event is responsible for cleaning up resources.

font_delete(global.fontHUD);//Delete the HUD font to free up memory.

//This code deletes the HUD font, which was added to the game in the Create Event.
//It's important to clean up resources when they are no longer needed to prevent memory leaks.