///oHellHoundElite Draw Event
/*This object represents a Hellhound Zombie.*/
//This event is responsible for drawing the zombie.

draw_sprite_ext(sprite_index, image_index, x, y, face, image_yscale, image_angle, image_blend, image_alpha);//Draw zombie flipped the right way.

//Draw hp
var _healthPercent = hp / maxHp;//Grab percent of health as a variable.
var _hpImage = _healthPercent * (sprite_get_number(sEnemyHealth) - 1);//Grab health as an integer.
draw_sprite_ext(sEnemyHealth, _hpImage, x, y - sprite_height - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);//Draw health bar based on zombie health.

//draw_text(x, y, string(hp));//Draw zombie HP as text.
if instance_exists(path){
	draw_path(path, x, y, 1);//Draw zombie path.
}