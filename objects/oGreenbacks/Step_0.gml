///oGreenbacks Step Event
/*This object represents a greenback.*/
//This event is responsible for handling greenback behavior.

fade_start_time = 60 * 5;//last 5 seconds

if screen_pause(){//Pause self
	exit;
}

//Lifetime countdown
timer++;
if(timer >= lifetime){
	destroy = true;
}

var time_left = lifetime - timer;

if(time_left <= fade_start_time){
    image_alpha = time_left / fade_start_time;
	
	//Optional flicker
	if(time_left < 60 * 2){//last 2 seconds
		image_alpha *= 0.5 + random(0.5);
	}
}else{
    image_alpha = 1;
}

//Float in Place
//floatDir += floatSpd;
//y = ystart + lengthdir_y(2, floatDir);
//y = ystart + dsin(floatDir)*2;//alternative to line above

if(destroy){
	create_animated_vfx(sPoof, x, y, depth);
	instance_destroy();
}

var _radius = 256;
if(global.magnet) {
	if(instance_exists(oPlayer)) {
		var _dist = point_distance(x, y, oPlayer.x, oPlayer.y);

		if(_dist < _radius) {
			//calculate direction to player
			var _dir = point_direction(x, y, oPlayer.x, oPlayer.y);
			//var _spd = 1;
			//calculate speed (faster when closer)
			var _spd = lerp(0, 3, 1 - (_dist / _radius));//Faster when closer
			//update x and y positions based on the direction and speed
			x += lengthdir_x(_spd, _dir);
			y += lengthdir_y(_spd, _dir);
		}
	}
}

//sprite_index = item.sprite;
if place_meeting(x, y, oPlayer){//If money touches player...
	audio_play_sound(sndMoney, 8, false);//Play money sound.

	if instance_exists(oHUD2){//If HUD exists...
		if !instance_exists(oScoreEffect){//If score effect not shown...
			moneyScoreValue = 1;//Money value is 1.
			var _scoreInst = instance_create_depth(x, y, -3000, oScoreEffect);//Create instance of score effect.
			if(_scoreInst){
			    _scoreInst.scoreValue = moneyScoreValue;//Assign the score value.
			    _scoreInst.ShowEffect(moneyScoreValue, x, y);//Call the ShowEffect function.
			}
		}
		oHUD2.playerScore += 1;//Add to player's score.
		oHUD2.playerTotalScore += 1;//Add to player's total score.
	}
	instance_destroy();//Destroy instance.
}