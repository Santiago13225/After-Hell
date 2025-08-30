///oPlayer Clean Up Event
/*This object represents the player object.*/
//This event is responsible for handling player object clean up.
if (font_exists(global.font2)){
    font_delete(global.font2);
}

global.playerSurvivalTime = current_time - spawnTime;