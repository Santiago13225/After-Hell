//Draw event:
///oHUD Draw Event
/*This object represents a HUD.*/
//This event is responsible for handling HUD drawing.
var _wx = display_get_gui_width();
var _wy = display_get_gui_height();

draw_set_font(fnt8Bit);//Should be 8-bit, see part 10 on the YouTube series?

if(instance_exists(oInvisibleSpawner2)){//If spawner exists...
	var _enemyCountOffset = 24 * 3;
	var _ecHudX = 8 * 3;
	var _ecHudY = (8 * 3) + _enemyCountOffset;
	//Draw the wave
	draw_sprite_ext(sWaveCountHUD, 0, 8 * 3, 8 * 3, 3, 3, 0, c_white, 1);
	var _waveString = "Wave " + string(oInvisibleSpawner2.currentWave);//Set wave string.
	//draw_text(5 + 18, 5 + 2, _waveString);//Print wave string.
	draw_text_transformed((8 * 3) + (18 * 3), (8 * 3) + (2 * 3), _waveString, 3, 3, 0);
	//Draw the enemy kill count
	draw_sprite_ext(sEnemyCountHUD, 0, _ecHudX, _ecHudY, 3, 3, 0, c_white, 1);//Draw the background/box.
	//Draw the text
	//draw_set_halign(fa_left);
	//draw_set_valign(fa_top);
	//draw_set_font(fnt8Bit);
	draw_text_transformed(_ecHudX + (20 * 3), _ecHudY + (2 * 3), string(oInvisibleSpawner2.zombiesKilledThisWave), 3, 3, 0);//Draw number of sombies killed.
	draw_text_transformed(_ecHudX + (44 * 3), _ecHudY + (2 * 3), "/" + string(oInvisibleSpawner2.activeEnemyMax), 3, 3, 0);//Draw number of active enemies.
	draw_set_font(global.fontHUD);
	var _waveString = "Next Wave In: " + string(oInvisibleSpawner2.waveDuration - oInvisibleSpawner2.timeSinceLastWave);//Set string.
	//draw_text_transformed((_wx/2) - ((string_width(_waveString) * 3)/2), 8, _waveString, 3, 3, 0);//Draw string.
	draw_text_transformed((_wx/2) - ((string_width(_waveString)/2) * 3), 8 * 3, _waveString, 3, 3, 0);//Draw string.
	var _countString = "Zombies Left: " + string(oInvisibleSpawner2.maxTotalEnemies - global.enemyKillCount);//Set string.
	draw_text_transformed(8 * 3, (8 * 3) + (48 * 3), _countString, 0.75 * 3, 0.75 * 3, 0);//Draw string.
	var _timeString = "Zombie Spawn Clock: " + string(oInvisibleSpawner2.timer);//Set string.
	draw_text_transformed(8 * 3, (8 * 3) + (64 * 3), _timeString, 0.75 * 3, 0.75 * 3, 0);//Draw string.
	var _actString = "Wave Zombie Limit: " + string(oInvisibleSpawner2.activeEnemyMax);//Set string.
	draw_text_transformed(8 * 3, (8 * 3) + (80 * 3), _actString, 0.75 * 3, 0.75 * 3, 0);//Draw string.
}

draw_set_font(global.fontHUD);

if(instance_exists(oPlayer)){
	//Draw the score pool
	var _scoreString = "$" + string(playerScore);//Set string.
	draw_text_transformed(0 + _wx - (8 * 3) - (string_width(_scoreString) * 3), 0 + (8 * 3), _scoreString, 3, 3, 0);//Draw string.

	//Draw the game title
	draw_sprite_ext(sTitleNew, 0, (8 * 3), (8 * 3) + _wy - (35 * 3), .3 * 3, .3 * 3, 0, c_white, 1);
}


//((global.controllerMode == 1) && gamepad_button_check_pressed(0, gp_face4))
if(room == rm_Mission0) && (global.controllerMode == 1){
	global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1);
	draw_set_font(global.fontHUD);
	//var box_width = 112;
	//var box_height = 96;
	//Draw the semi-transparent black box
	//draw_rectangle_color((8 * 3), (8 * 3) + 8, (8 * 3) + box_width, (8 * 3) + 16 + box_height, c_black, c_black, c_black, c_black, false);//Draw text background.
	draw_text_transformed((8 * 3), (8 * 3) + 8, "Controls:", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed((8 * 3), (8 * 3) + 16, "- Use left analog stick to move the player.", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed((8 * 3), (8 * 3) + 24, "- Use right analog stick to aim your weapon.", 0.6, 0.6, 0);//Draw header.
	draw_text_transformed((8 * 3), (8 * 3) + 32, "- Use right trigger to shoot.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed((8 * 3), (8 * 3) + 40, "- Use left trigger to switch weapons.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed((8 * 3), (8 * 3) + 48, "- Hold any button on the d-pad to highlight a specific item in the inventory.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed((8 * 3), (8 * 3) + 56, "- Hold d-pad + lower face button = use item(*if applicable). Hold d-pad + right face button = drop item(*if applicable).", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed((8 * 3), (8 * 3) + 64, "- Use the start button to pause the game.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed((8 * 3), (8 * 3) + 72, "Hints:", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed((8 * 3), (8 * 3) + 80, "- You can highlight items in the inventory with your d-pad to view their description.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed((8 * 3), (8 * 3) + 88, "- When near a wallbuy, you can purchase an item using the left face button.", 0.6, 0.6, 0);//Draw string.
	draw_text_transformed((8 * 3), (8 * 3) + 96, "- You can use the upper face button to progress through or close text dialog boxes.", 0.6, 0.6, 0);//Draw string.
}
/*
//Create an array of intro objects.
var introObjs = [oIntro, oIntroTM2, oIntroTM3, oIntroTM4, oIntroTM5, oIntroTM6, oIntroTM7, oIntroTM8, oIntroTM9, oIntroTM10, oIntroTM11, oIntroTM12, oIntroTM13];
var found = false;

//Loop through the array and check if any instance exists.
for(var i = 0; i < array_length(introObjs); i++) {
    if(instance_exists(introObjs[i])) {
        found = true;
        break;
    }
}

//if(found) {
//}*/

//Draw the Inventory
if(instance_exists(oPlayer)){//If player object exists...
	draw_sprite_ext(sInventory, 0, 0 + _wx - (132 * 3), 0 + _wy - (88 * 3), 3, 3, 0, c_white, 1);//Draw the inventory background.
	draw_text_transformed(_wx - (99 * 3), _wy - (88 * 3), "Inventory", 3, 3, 0);//Draw string.
}