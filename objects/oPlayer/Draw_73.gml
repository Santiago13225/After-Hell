var _healthPercent = oPlayer.hp / oPlayer.maxHp;

if(global.dialog_active == false) {
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);

	//Draw Player Silhouette
	gpu_set_fog(true, c_blue, 0, 1);
	//gpu_set_fog(true, c_blue, 0, 1);
	draw_self();
	draw_my_weapon();
	gpu_set_fog(false, c_white, 0, 0);

	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);
}