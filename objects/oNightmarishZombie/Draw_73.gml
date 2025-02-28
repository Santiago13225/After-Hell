if(global.dialog_active == false) {
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);

	//Draw Silhouette
	gpu_set_fog(true, merge_color(c_black, c_red, 0.5), 0, 1);
	//gpu_set_fog(true, c_red, 0, 1);
	draw_self();
	//draw_sprite_ext(sprite_index, image_index, x, y, face, image_yscale, image_angle, image_blend, image_alpha);
	gpu_set_fog(false, c_white, 0, 0);

	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);
}