//Get inputs
back_key = keyboard_check_pressed(vk_backspace);
accept_key = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);
left_key = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));

//Controller inputs
var _gamePad = 0;
var is_controller_connected = gamepad_is_connected(_gamePad);

if is_controller_connected{
	left_key |= gamepad_button_check_pressed(_gamePad, gp_padl);
	right_key |= gamepad_button_check_pressed(_gamePad, gp_padr);
	accept_key |= gamepad_button_check_pressed(_gamePad, gp_face1);
	back_key |= gamepad_button_check_pressed(_gamePad, gp_face2);
	
	//Stick settings
	var deadzone = 0.5;//threshold
	var delay_initial = 15;//delay before repeat starts
	var delay_repeat  = 6;//faster repeat after holding

	if(!variable_instance_exists(id, "stick_delay")) stick_delay = 0;
	if(!variable_instance_exists(id, "stick_held")) stick_held = false;

	//Stick input
	var lx = gamepad_axis_value(0, gp_axislh);
	var ly = gamepad_axis_value(0, gp_axislv);
	var moved = false;

	//Countdown
	if(stick_delay > 0) stick_delay--;

	//Check input
	if(stick_delay <= 0) {
		if(lx > deadzone) { right_key = true; audio_play_sound(sndClick, 10, false); moved = true; }
		else if(lx < -deadzone) { left_key = true; audio_play_sound(sndClick, 10, false); moved = true; }
		//else if(ly > deadzone) { down_key = true; audio_play_sound(sndClick, 10, false); moved = true; }
		//else if(ly < -deadzone) { up_key = true; audio_play_sound(sndClick, 10, false); moved = true; }

		if(moved) {
			if(!stick_held) {
				stick_delay = delay_initial;//first delay
				stick_held = true;
			}else {
				stick_delay = delay_repeat;//repeat delay
			}
		}else {
			stick_held = false;//reset if neutral
		}
	}
}

//Navigate presets
if(right_key) {
    selected -= 1;
    arrowRightAnim = 1;
}else if(left_key) {
    selected += 1;
    arrowLeftAnim = 1;
}

arrowLeftAnim = max(arrowLeftAnim - 0.05, 0);
arrowRightAnim = max(arrowRightAnim - 0.05, 0);

//Rotate carousel smoothly
rot -= angle_difference(rot, selected * (360 / image_number)) / 13;

//Wrap index
item = -selected mod image_number;
if (item < 0) item += image_number;

//(Optional) Apply the preset to game data
//global.currentMatchPreset = global.matchPresets[image_index];

if(accept_key){
	//Store selected match setting and go to map select
	//global.match_setting_index = item;
	global.matchPresetIndex = item;

	//Proceed to map selection carousel
	instance_destroy();
	//instance_create_layer(0, 0, "Instances", oCarouselMenu);
	instance_create_layer(0, 0, "Instances", oPerkCarouselMenu);
}

if(back_key){
	//Cancel and go back
	instance_destroy();
	instance_create_layer(0, 0, "Instances", oTitleMenu2);
}
