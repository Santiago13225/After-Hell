var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height(view_camera[0]);

var camCenterX = camX + (camW * 0.5);
var camCenterY = camY + (camH * 0.5);

var dx = x - camCenterX;
var dy = y - camCenterY;

if!(instance_exists(oPauseMenu2) || instance_exists(oVictoryScreen2) || instance_exists(oGameOverScreen2)){
	draw_set_font(fnt8Bit);//Should be 8-bit, see part 10 on YouTube series.
	//draw_set_font(global.font2);
	var _wx = display_get_gui_width();
	var _wy = display_get_gui_height();

	//Draw HP
	var _healthPercent = oPlayer.hp / oPlayer.maxHp;
	var _hpImage = _healthPercent * (sprite_get_number(sPlayerHealth) - 1);
	//draw_sprite_ext(sPlayerHealth, _hpImage, x, y - sprite_height - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(sPlayerHealth, _hpImage, _wx/2 + (dx * 3), _wy/2 + (dy * 3) - (sprite_height * 3) - 3, image_xscale * 3, image_yscale * 3, image_angle, image_blend, image_alpha);

	//draw_sprite_ext(sPlayerHealth, _hpImage, oPlayer.x, _wy/2 - (sprite_height * 3) - 3, image_xscale * 3, image_yscale * 3, image_angle, image_blend, image_alpha);
	draw_set_halign(fa_center);
	//draw_text_transformed(x, y - sprite_height - 12, string(hp), .6, .6, 0);
	draw_text_transformed(_wx/2 + (dx * 3), _wy/2 + (dy * 3) - (sprite_height * 3) - (12 * 3), string(hp), (.6 * 3), (.6 * 3), 0);
	//draw_set_halign(fa_left);
	
	//ammo for current weapon
	draw_set_font(global.fontHUD);
	var _ammoX = _wx/2 + (dx * 3);
	var _ammoY= _wy/2 + (dy * 3) + (3 * 3);
	var _color = c_white;
	
	/*
	if(global.PlayerAmmo[oPlayer.selectedWeapon] == 0){
		_color = c_red;
	}else{
		_color = c_white;
	}
	draw_text_transformed_color(_ammoX, _ammoY, "Ammo: " + string(global.PlayerAmmo[oPlayer.selectedWeapon]), 2, 2, 0, _color, _color, _color, _color, 1);
	*/
	
	if(oPlayer.selectedWeapon == 0) {
		//Any pistol variant will be at index 0 → unlimited ammo
		ammoText = "Ammo: Unlimited";
	}else {
	    //Non‐pistol weapons → show actual ammo
	    var ammoCount = global.PlayerAmmo[oPlayer.selectedWeapon];
	    if(ammoCount == 0) {
	        _color = c_red;
	    }
	    ammoText = "Ammo: " + string(ammoCount);
	}

	draw_text_transformed_color(_ammoX, _ammoY, ammoText, 2, 2, 0, _color, _color, _color, _color, 1);
	
	//draw_text_transformed_color(_ammoX, _ammoY, "Ammo: " + string(global.PlayerAmmo[oPlayer.selectedWeapon]), 2, 2, 0, _color, _color, _color, _color, 1);
	//draw_text_transformed(_ammoX, _ammoY, "Ammo: " + string(global.PlayerAmmo[oPlayer.selectedWeapon]), 2, 2, 0);
	draw_set_halign(fa_left);
}