///oHUD Step Event
/*This object represents a HUD.*/
//This event is responsible for handling HUD behavior.

//Pause self
if screen_pause(){
    exit;
}
/*
if room == rm_Mission0{
	oHUD.playerScore = 1000000;
}*/

//Check if the player is still alive
if instance_exists(oPlayer){
    playerHp = oPlayer.hp;//Set player HP.
    playerMaxHp = oPlayer.maxHp;//Set max player HP.
} else {//Otherwise...
    playerHp = 0;//Set player HP to 0.
}

//Victory Screen
if instance_exists(oInvisibleSpawner2){//If spawner exists...
	if global.enemyKillCount == oInvisibleSpawner2.maxTotalEnemies && playerHp != 0{//If the  player reaches the total number of enemies to kill.
	    audio_pause_sound(global.MUSIC);//Pause the music.
	    instance_deactivate_all(oHUD2);//Deactivates HUD.

	    if !instance_exists(oVictoryScreen2){//If victory screen does not already exist...
	        instance_create_depth(0, 0, 0, oVictoryScreen2);//Create a victory screen.
	    }

	    if !audio_is_playing(sndVictory){//If audio is not playing...
	        audio_play_sound(sndVictory, 8, false);//Play audio.
	    }
	}
}