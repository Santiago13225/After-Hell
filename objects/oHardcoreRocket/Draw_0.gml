draw_self();

gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);

//carve out a circle centered on the rocket
//radius should be at least half the sprite’s diagonal:
var w = sprite_width  * image_xscale;
var h = sprite_height * image_yscale;
var radius = (sqrt(sqr(w) + sqr(h))) + 8;//+8 for a little padding

draw_circle(x, y, radius, false);

draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);