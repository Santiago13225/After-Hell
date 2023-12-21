///oIntroTM2 Step Event
/*This object represents an introTM2 object.*/
//This event is responsible for handling introTM2 object behavior.
camera_set_view_pos(view_camera[1], xpos, 840);
xpos = max(xpos - 0.3, 0);

if(!fadeout){
	a = max(a - 0.005, 0.25); 
}else {
	a = min(a + 0.005, 1);
}

l += 0.5;
print = string_copy(str, 1, l);

if(l > string_length(str) + 100) && (next < array_length_1d(strings) - 1){
	l = 0;
	next++;
	if (next == array_length_1d(strings) - 1){
		holdspace++;
	}
}

str = strings[next];

if (keyboard_check_direct(vk_space)) xor ((global.controllerMode == 1) && gamepad_button_check(0, gp_face3)){
	holdspace++;
}

if (holdspace > 80) || (xpos < 100) fadeout = 1;

if(a == 1) && (fadeout == 1){
	TransitionStart(rm_Graveyard_Level, sqFadeOut, sqFadeIn);
}