draw_self();
gpu_set_blendenable(false);
gpu_set_colorwriteenable(false, false, false, true);
draw_set_alpha(0);
var x1 = x-sprite_xoffset;
var y1 = y-sprite_yoffset;
draw_rectangle(x1, y1, x1 + sprite_width, y1 + sprite_height, false);
draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, true, true);
gpu_set_blendenable(true);


draw_set_color(c_white);
draw_text(32, 32, "Wave: " + string(waveNumber));
draw_text(32, 64, "Enemies Killed: " + string(enemiesKilledThisWave));
draw_text(32, 96, "Enemies Active: " + string(activeEnemies));
draw_text(32, 128, "Wave Target: " + string(waveEnemyTarget));
if (waveIntermission) draw_text(32, 160, "Intermission: " + string(ceil(intermissionTimer/room_speed)) + "s");