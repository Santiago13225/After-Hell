///oHUD Room End Event
/*This object represents a HUD.*/
//This event is responsible for handling HUD Room End behavior.
//@description reset enemy kill count varibles
global.totalEnemiesSpawned = 0;//Reset number of enemies spawned variable.
global.enemyKillCount = 0;//Reset enemy kill count variable.
audio_pause_all();//Prevents songs from one room playing in another room when you change rooms from the menu.