//Redeclare variables to be used in local scope so you can use them in the "with" statement below
var _guiwidth = guiwidth;
var _guiheight = guiheight;
var _centerx = x;
var _centery = y;
var _radarsize = radarsize;

if(instance_exists(oPlayer)){
//draw radar outline circle
draw_set_alpha(0.5);
draw_circle_color(_centerx, _centery, _radarsize, c_lime, c_lime, 0);
draw_set_alpha(1);

//draw center player position
draw_circle_color(_centerx, _centery, 10, c_blue, c_blue, 0);

with(oEnemyParent){
	//Get the enemy position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the enemies within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_circle_color(xx, yy, 10, c_red, c_red, 0);
	}
}

with(oAssaultWallbuy2){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sAssaultWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oBazookaWallbuy2){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sBazookaWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oLMGWallbuy2){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sLMGWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oRaygunWallbuy2){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sRaygunWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oShotgunWallbuy2){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sShotgunWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oSMGWallbuy2){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sSMGWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oSniperWallbuy2){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sSniperWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oMedkitWallbuy3){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sMedkit, 0, xx, yy, 3, 3 , 0, c_white, 1);
	}
}

with(oArmoryAugmentor2){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sBanner3, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

}