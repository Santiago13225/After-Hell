///oIntro Step Event
/*This object represents an intro object.*/
//This event is responsible for handling intro object behavior.

if(oControllerIndicator.controller_count == 0) {
    global.controllerMode = 0;//force keyboard if no controller
}

if(skipTimer > 0) {
    skipTimer -= 1;
}else {
    //If 30 seconds have elapsed, automatically trigger skip.
    fadeout = 1;
}

camera_set_view_pos(view_camera[1], xpos, 0);
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

if (keyboard_check_direct(vk_space)) xor ((global.controllerMode == 1) && gamepad_button_check(0, gp_face1)){
	holdspace++;
}

if (holdspace > 80) || (xpos < 100) fadeout = 1;

if(a == 1) && (fadeout == 1){
	global.dialog_active = false;//Disable silhouette drawing.
	TransitionStart(rm_Tutorial_Level, sqFadeOut, sqFadeIn);
}

//Controller skip input (like Key Press Any for controller)
if(global.controllerMode == 1 && gamepad_is_connected(0)) {
	var anyButton =
		gamepad_button_check_pressed(0, gp_face1) ||
		gamepad_button_check_pressed(0, gp_face2) ||
		gamepad_button_check_pressed(0, gp_face3) ||
		gamepad_button_check_pressed(0, gp_face4) ||
		gamepad_button_check_pressed(0, gp_start) ||
		gamepad_button_check_pressed(0, gp_select) ||
		gamepad_button_check_pressed(0, gp_shoulderlb) ||
		gamepad_button_check_pressed(0, gp_shoulderrb) ||
		gamepad_button_check_pressed(0, gp_shoulderl) ||
		gamepad_button_check_pressed(0, gp_shoulderr) ||
		gamepad_button_check_pressed(0, gp_stickl) ||
		gamepad_button_check_pressed(0, gp_stickr) ||
		gamepad_button_check_pressed(0, gp_padu) ||
		gamepad_button_check_pressed(0, gp_padd) ||
		gamepad_button_check_pressed(0, gp_padl) ||
		gamepad_button_check_pressed(0, gp_padr);

	//Analog stick movement (deadzone 0.2)
	var lx = gamepad_axis_value(0, gp_axislh);
	var ly = gamepad_axis_value(0, gp_axislv);
	var rx = gamepad_axis_value(0, gp_axisrh);
	var ry = gamepad_axis_value(0, gp_axisrv);
	var anyStick = (abs(lx) > 0.2) || (abs(ly) > 0.2) || (abs(rx) > 0.2) || (abs(ry) > 0.2);

	if(anyButton || anyStick) {
		if(holdspace == 0) holdspace++;
	}
}