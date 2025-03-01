///oHUD Draw Event
/*This object represents a HUD.*/
//This event is responsible for handling HUD drawing.

var _camX = 0;//Get camera x coordinate.
var _camY = 0;//Get camera y coordinate.

//Central HUD coordinates
var _border = 8;
var _hudX = _camX + _border;
var _hudY = _camY + _border;
var _wx = 640;

//Draw the background/box
//draw_sprite(sWaveCountHUD, 0, _hudX, _hudY);

draw_set_font(fnt8Bit);//Should be 8-bit, see part 10 on the YouTube series?

if(instance_exists(oInvisibleSpawner2)){//If spawner exists...
	//Draw the background/box
	draw_sprite(sWaveCountHUD, 0, _hudX, _hudY);
	var _waveString = "Wave " + string(oInvisibleSpawner2.currentWave);//Set wave string.
	draw_text(_hudX + 18, _hudY + 2, _waveString);//Print wave string.
	//var box_width = 112;
	//var box_height = 80;

	//Draw the semi-transparent black box
	/*
	draw_rectangle_color(_hudX, _hudY + 48, _hudX + box_width, _hudY + 48 + box_height, c_black, c_black, c_black, c_black, false);//Draw text background.
	draw_text_transformed(_hudX, _hudY + 48, "Info Panel:", 0.75, 0.75, 0);//Draw header.
	var _countString = "Zombies Left: " + string(oInvisibleSpawner2.maxTotalEnemies - global.enemyKillCount);//Set string.
	draw_text_transformed(_hudX, _hudY + 64, _countString, 0.75, 0.75, 0);//Draw string.
	var _timeString = "Zombie Spawn Clock: " + string(oInvisibleSpawner2.timer);//Set string.
	draw_text_transformed(_hudX, _hudY + 80, _timeString, 0.75, 0.75, 0);//Draw string.
	var _actString = "Wave Zombie Limit: " + string(oInvisibleSpawner2.activeEnemyMax);//Set string.
	draw_text_transformed(_hudX, _hudY + 96, _actString, 0.75, 0.75, 0);//Draw string.*/
	//var _wavString = "Next Wave In: " + string(oInvisibleSpawner2.waveDuration - oInvisibleSpawner2.timeSinceLastWave);//Set string.
	//draw_text_transformed(_hudX, _hudY + 112, _wavString, 0.75, 0.75, 0);//Draw string.	
	//draw_text(_hudX, _hudY + 128, "Players: " + string(ds_list_size(sockets)));
}

if(instance_exists(oInvisibleSpawner2)){
	//global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1);
	draw_set_font(global.fontHUD);
	//var _scoreString = "Score: 500" + string(oInvisibleSpawner2.maxTotalEnemies - global.enemyKillCount);
	var _waveString = "Next Wave In: " + string(oInvisibleSpawner2.waveDuration - oInvisibleSpawner2.timeSinceLastWave);//Set string.
	draw_text_transformed(_camX + (_wx/2) - (string_width(_waveString)/2), _camY + 8, _waveString, 1, 1, 0);//Draw string.
	//draw_text_transformed(_camX + (_wx/2), _camY + 8, _waveString, 1, 1, 0);//Draw string.
	string_width(_waveString)
}

if(instance_exists(oInvisibleSpawner2)){
	//global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1);
	draw_set_font(global.fontHUD);
	//draw_rectangle_color(_hudX, _hudY + 48, _hudX + box_width, _hudY + 48 + box_height, c_black, c_black, c_black, c_black, false);//Draw text background.
	//draw_text_transformed(_hudX, _hudY + 48, "Info Panel:", 0.75, 0.75, 0);//Draw header.
	var _countString = "Zombies Left: " + string(oInvisibleSpawner2.maxTotalEnemies - global.enemyKillCount);//Set string.
	draw_text_transformed(_hudX, _hudY + 48, _countString, 0.75, 0.75, 0);//Draw string.
	var _timeString = "Zombie Spawn Clock: " + string(oInvisibleSpawner2.timer);//Set string.
	draw_text_transformed(_hudX, _hudY + 64, _timeString, 0.75, 0.75, 0);//Draw string.
	var _actString = "Wave Zombie Limit: " + string(oInvisibleSpawner2.activeEnemyMax);//Set string.
	draw_text_transformed(_hudX, _hudY + 80, _actString, 0.75, 0.75, 0);//Draw string.
}

if(room == rm_Mission0) && (global.controllerMode == 0){
	//global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1);
	draw_set_font(global.fontHUD);
	//var box_width = 112;
	//var box_height = 96;
	//Draw the semi-transparent black box
	//draw_rectangle_color(_hudX, _hudY + 8, _hudX + box_width, _hudY + 16 + box_height, c_black, c_black, c_black, c_black, false);//Draw text background.
	draw_text_transformed(_hudX, _hudY + 8, "Controls:", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed(_hudX, _hudY + 16, "- Use WASD to move the player.", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed(_hudX, _hudY + 24, "- Use the mouse to aim your weapon.", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed(_hudX, _hudY + 32, "- Left-click to shoot.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 40, "- Right-click to switch weapons.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 48, "- Left-click an item in the inventory to use it (*If applicable).", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 56, "- Right-click an item in the inventory to drop it (*If applicable).", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 64, "- Use the enter key to pause the game.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 72, "Hints:", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 80, "- You can highlight items in the inventory with your mouse to view their description.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 88, "- When near a wallbuy, you can purchase an item using the 'g' key.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 96, "- You can use the space bar to progress through or close text dialog boxes.", 0.6, 0.6, 0);//Draw string.
}

//((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face4))
if(room == rm_Mission0) && (global.controllerMode == 1){
	//global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1);
	draw_set_font(global.fontHUD);
	//var box_width = 112;
	//var box_height = 96;
	//Draw the semi-transparent black box
	//draw_rectangle_color(_hudX, _hudY + 8, _hudX + box_width, _hudY + 16 + box_height, c_black, c_black, c_black, c_black, false);//Draw text background.
	draw_text_transformed(_hudX, _hudY + 8, "Controls:", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed(_hudX, _hudY + 16, "- Use left analog stick to move the player.", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed(_hudX, _hudY + 24, "- Use right analog stick to aim your weapon.", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed(_hudX, _hudY + 32, "- Use right trigger to shoot.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 40, "- Use left trigger to switch weapons.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 48, "- Hold any button on the d-pad to highlight a specific item in the inventory.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 56, "- Hold d-pad + lower face button = use item(*if applicable). Hold d-pad + right face button = drop item(*if applicable).", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 64, "- Use the start button to pause the game.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 72, "Hints:", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 80, "- You can highlight items in the inventory with your d-pad to view their description.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 88, "- When near a wallbuy, you can purchase an item using the left face button.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed(_hudX, _hudY + 96, "- You can use the upper face button to progress through or close text dialog boxes.", 0.6, 0.6, 0);//Draw string.
}
//Draw the player's HP
#region
/*
if instance_exists(oPlayer)
{
	//var _border = 8;
	draw_sprite(sHealthBar, 0, _hudX, _hudY);
	for(var i = 0; i < playerMaxHp; i++){
		//show current hp
		var _img = 1;
		if i+1 <= playerHp{
		_img = 2;	
		}
	
		var _sep = 3;
		draw_sprite(sHealthBar, _img, _hudX + _sep*i, _hudY);
	}

	//var _hpString = "HP:" + string(playerHp) + "/" + string(playerMaxHp);
	//draw_text(_camX, _camY, _hpString);
}*/
#endregion

//Draw the enemy kill count
#region
//var _enemyCountStr = "Kill Count:" + string(global.enemyKillCount) + "/" + string(global.enemyRoomMax);
//draw_text(_camX, _camY+32, _enemyCountStr);
if instance_exists(oInvisibleSpawner2){
	var _enemyCountOffset = 24;
	var _ecHudX = _hudX;
	var _ecHudY = _hudY + _enemyCountOffset;

	draw_sprite(sEnemyCountHUD, 0, _ecHudX, _ecHudY);//Draw the background/box.

	//Draw the text
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
//draw_set_font(fnt8Bit);//should be 8-bit, see part 10?
//the current enemy kill count
//draw_text(_ecHudX + 20, _ecHudY + 2, string(global.enemyKillCount));//??
//draw_text(_ecHudX + 20, _ecHudY + 2, string(oInvisibleSpawner2.zombiesKilledThisWave));//??

if instance_exists(oInvisibleSpawner2){//If spawner exists...
	//global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1);
	//draw_set_font(global.fontHUD);
	draw_set_font(fnt8Bit);
	draw_text(_ecHudX + 20, _ecHudY + 2, string(oInvisibleSpawner2.zombiesKilledThisWave));//Draw number of sombies killed.
	//total enemies in level count
	//draw_text(_ecHudX + 44, _ecHudY + 2, "/" + string(oInvisibleSpawner2.maxTotalEnemies));
	draw_text(_ecHudX + 44, _ecHudY + 2, "/" + string(oInvisibleSpawner2.activeEnemyMax));//Draw number of active enemies.
}
#endregion

//Draw the player count
/*
if instance_exists(oServer){
	draw_text_transformed(_hudX, _hudY + 128, "Players: " + string(ds_list_size(sockets)), 0.75, 0.75, 0);
}*/

//Draw the game title
#region
//Draw the text
//draw_sprite(sTitleNew, 0, _hudX, _hudY);
//draw_sprite_ext(sTitleNew, 0, _hudX, _hudY + camera_get_view_height(view_camera[0]) - 40, .3, .3, 0, c_white, 1);
draw_sprite_ext(sTitleNew, 0, _hudX, _hudY + camera_get_view_height(view_camera[0]) - 35, .3, .3, 0, c_white, 1);
//Draw the zombie head
//draw_sprite_ext(sZombieHead, 0, _hudX + 11, _hudY + camera_get_view_height(view_camera[0]) - 16, .8, .8, 0, c_white, 1);
#endregion

//Draw the Inventory
#region
if instance_exists(oPlayer){//If player object exists...
	draw_sprite_ext(sInventory, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 132, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 88, 1, 1, 0, c_white, 1);//Draw the inventory background.
}
#endregion

//Draw the score pool
#region
//global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1);
draw_set_font(global.fontHUD);
//var _scoreString = "Score: 500" + string(oInvisibleSpawner2.maxTotalEnemies - global.enemyKillCount);
var _scoreString = "$" + string(playerScore);//Set string.
draw_text_transformed(_camX + _wx - 8 - string_width(_scoreString), _camY + 8, _scoreString, 1, 1, 0);//Draw string.
string_width(_scoreString)
#endregion