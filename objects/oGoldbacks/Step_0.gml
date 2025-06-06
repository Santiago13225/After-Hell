///oGoldbacks Step Event
/*This object represents a goldback.*/
//This event is responsible for handling goldback behavior.

if screen_pause(){//Pause self
	exit;
}

//Float in Place
floatDir += floatSpd;
y = ystart + lengthdir_y(2, floatDir);
//y = ystart + dsin(floatDir)*2;//alternative to line above

//sprite_index = item.sprite;

if place_meeting(x, y, oPlayer){//If money touches player...
	audio_play_sound(sndMoney, 8, false);//Play mmoney sound.

	if instance_exists(oHUD2){//If HUD exists...
		if !instance_exists(oScoreEffect){//If score effect not shown...
			moneyScoreValue = 50;//Money value is 50.
			var _scoreInst = instance_create_depth(x, y, -3000, oScoreEffect);//Create instance of score effect.
			if(_scoreInst){
			    _scoreInst.scoreValue = moneyScoreValue;//Assign the score value.
			    _scoreInst.ShowEffect(moneyScoreValue, x, y);//Call the ShowEffect function.
			}
		}
		oHUD2.playerScore += 50;//Add to player's score.
	}
	instance_destroy();//Destroy instance.
}