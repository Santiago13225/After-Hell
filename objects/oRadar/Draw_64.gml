//Redeclare variables to be used in local scope so you can use them in the "with" statement below
var _guiwidth = guiwidth;
var _guiheight = guiheight;
var _centerx = x;
var _centery = y;
var _radarsize = radarsize;
//var _radar_scale = radarscale / (radarsize); // local var for use in with()
var _radar_scale = radar_scale;

if(instance_exists(oPlayer)){
	//1. REBUILD SURFACE (ONLY WHEN NEEDED)
	if(global.radar_dirty || !surface_exists(radar_surface)) {
		if(surface_exists(radar_surface)) {
			surface_free(radar_surface);
		}

		//Surface covers the whole room in radar space
        var _surf_w = room_width * _radar_scale;
        var _surf_h = room_height * _radar_scale;

		radar_surface = surface_create(_surf_w, _surf_h);
		surface_set_target(radar_surface);
		draw_clear_alpha(c_black, 0);

		with(oWall) {//MOVE YOUR WALL DRAWING HERE (ONLY RUNS RARELY)
			var cell = 8;

			var x1 = bbox_left;
			var y1 = bbox_top;
			var x2 = bbox_right;
			var y2 = bbox_bottom;

			for(var wx = x1; wx < x2; wx += cell) {
				for(var wy = y1; wy < y2; wy += cell) {
					//var rx = (wx / room_width * _guiwidth);
					//var ry = (wy / room_height * _guiheight);
					//draw_rectangle(rx, ry, rx + cell * 0.5, ry + cell * 0.5, false);
					var rx = wx * _radar_scale;
                    var ry = wy * _radar_scale;
                    draw_rectangle(rx, ry, rx + cell * _radar_scale, ry + cell * _radar_scale, false);
				}
			}
		}
		surface_reset_target();
		global.radar_dirty = false;
	}

//draw radar outline circle
draw_set_alpha(0.5);
draw_circle_color(_centerx, _centery, _radarsize, c_lime, c_lime, 0);
draw_set_alpha(1);

/*with(oWall) {//Draw all wall-type objects on radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x / room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y / room_height * _guiheight);

	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_rectangle(xx - 1, yy - 1, xx + 1, yy + 1, false);
	}
}*/

/*with(oWall){
	//Convert object bounding box into radar space
	var x1 = bbox_left;
	var y1 = bbox_top;
	var x2 = bbox_right;
	var y2 = bbox_bottom;

	var rx1 = _centerx + (x1 / room_width * _guiwidth) - (oPlayer.x / room_width * _guiwidth);
	var ry1 = _centery + (y1 / room_height * _guiheight) - (oPlayer.y / room_height * _guiheight);

	var rx2 = _centerx + (x2 / room_width * _guiwidth) - (oPlayer.x / room_width * _guiwidth);
	var ry2 = _centery + (y2 / room_height * _guiheight) - (oPlayer.y / room_height * _guiheight);

	if(point_in_circle((rx1+rx2) * 0.5, (ry1+ry2) * 0.5, _centerx, _centery, _radarsize)) {
		draw_rectangle(rx1, ry1, rx2, ry2, false);
	}
}*/

/*with(oWall) {
	var cell = 8;//radar detail resolution (smaller = smoother walls)

	var x1 = bbox_left;
	var y1 = bbox_top;
	var x2 = bbox_right;
	var y2 = bbox_bottom;

	for(var wx = x1; wx < x2; wx += cell) {
		for(var wy = y1; wy < y2; wy += cell) {

			var rx = _centerx + (wx / room_width * _guiwidth) - (oPlayer.x / room_width * _guiwidth);
			var ry = _centery + (wy / room_height * _guiheight) - (oPlayer.y / room_height * _guiheight);

			if(point_in_circle(rx, ry, _centerx, _centery, _radarsize)) {
				draw_rectangle(rx, ry, rx + cell * 0.5, ry + cell * 0.5, false);
			}
		}
	}
}*/

// 3. DRAW WALL SURFACE (OFFSET TO PLAYER)
/*var px = oPlayer.x / room_width * _guiwidth;
var py = oPlayer.y / room_height * _guiheight;

draw_surface_part(
	radar_surface,
	px - _radarsize,
	py - _radarsize,
	_radarsize * 2,
	_radarsize * 2,
	_centerx - _radarsize,
	_centery - _radarsize
);*/
//draw_surface(radar_surface, 0, 0);

//====================================================
// DRAW RADAR TO MASK SURFACE
//====================================================
if(!surface_exists(radar_mask_surface)) {
	radar_mask_surface = surface_create(_radarsize * 2, _radarsize * 2);
}

surface_set_target(radar_mask_surface);
draw_clear_alpha(c_black, 0);

//----------------------------------------------------
// 1. DRAW SOLID WHITE CIRCLE
//----------------------------------------------------
draw_set_color(c_white);
draw_circle(_radarsize, _radarsize, _radarsize, false);

//----------------------------------------------------
// 2. KEEP ONLY PIXELS INSIDE CIRCLE
//----------------------------------------------------
gpu_set_blendmode_ext(bm_dest_color, bm_zero);

//Player position on radar texture
//var px = oPlayer.x / room_width * _guiwidth;
//var py = oPlayer.y / room_height * _guiheight;
var px = oPlayer.x * _radar_scale;
var py = oPlayer.y * _radar_scale;

//Draw radar map INTO the circle
draw_surface_part(
	radar_surface,
	px - _radarsize,
	py - _radarsize,
	_radarsize * 2,
	_radarsize * 2,
	0,
	0
);

gpu_set_blendmode(bm_normal);

surface_reset_target();

//----------------------------------------------------
// 3. DRAW FINISHED RADAR
//----------------------------------------------------
draw_surface(
	radar_mask_surface,
	_centerx - _radarsize,
	_centery - _radarsize
);

with(oMusicBlockHouse){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oMusicBlockFacility){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oMusicBlockTemple){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oMusicBlockOverlook){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oMusicBlockTestLevel){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sMusicBlockTile, 5, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oAssaultWallbuy2){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sAssaultWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oBazookaWallbuy2){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sBazookaWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oLMGWallbuy2){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sLMGWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oRaygunWallbuy2){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sRaygunWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oShotgunWallbuy2){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sShotgunWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oSMGWallbuy2){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);	
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sSMGWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oSniperWallbuy2){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sSniperWallbuy2, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oMedkitWallbuy3){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sMedkitWallbuy, 1, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oArmoryAugmentor2){
	//Get the wall position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;

	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		//draw_sprite_ext(sBanner3, 0, xx, yy, 1, 1 , 0, c_white, 1);
		draw_sprite_ext(sArmoryAugmentor2, 1, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oEnemyParent){
	//Get the enemy position to draw on the radar
	//var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	//var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	var xx = _centerx + (x - oPlayer.x) * _radar_scale;
	var yy = _centery + (y - oPlayer.y) * _radar_scale;
	
	//Draw the enemies within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_circle_color(xx, yy, 7.5, c_red, c_red, 0);
	}
}

//draw center player position
draw_circle_color(_centerx, _centery, 7.5, c_blue, c_blue, 0);

#region
/*
with(oGreenbacks){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sGreenbacks, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oBluebacks){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sBluebacks, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oRedbacks){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sRedbacks, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oBronzebacks){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sBronzebacks, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oSilverbacks){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sSilverbacks, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oGoldbacks){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sGoldbacks, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oBlackbacks){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sBlackbacks, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oLightAmmo){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sLightAmmo, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oShellAmmo){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sShellAmmo, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oRifleAmmo){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sRifleAmmo, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oSniperAmmo){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sSniperAmmo, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oHeavyAmmo){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sHeavyAmmo, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oRocketAmmo){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sRocketAmmo, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}

with(oColdCellAmmo){
	//Get the wall position to draw on the radar
	var xx = _centerx + (x / room_width * _guiwidth) - (oPlayer.x/room_width * _guiwidth);
	var yy = _centery + (y / room_height * _guiheight) - (oPlayer.y/room_height * _guiheight);
	
	//Draw the walls within the radar circle
	if(point_in_circle(xx, yy, _centerx, _centery, _radarsize)){
		draw_sprite_ext(sColdCellAmmo, 0, xx, yy, 1, 1 , 0, c_white, 1);
	}
}
*/
#endregion
}