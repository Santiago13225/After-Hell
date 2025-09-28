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

//Navigation input
if(right_key) {
    selected -= 1;
    arrowRightAnim = 1;
}else if(left_key) {
    selected += 1;
    arrowLeftAnim = 1;
}

//Animate arrow scale
arrowLeftAnim = max(arrowLeftAnim - 0.05, 0);
arrowRightAnim = max(arrowRightAnim - 0.05, 0);

//Smooth rotation
rot -= angle_difference(rot, selected * (360 / image_number)) / 13;

//Wrap image index / Update selection
item = -selected mod image_number;
if (item < 0) item += image_number;


if(accept_key){
	//Save selected perk and go to map selection
	global.perkIndex = item;
	instance_destroy();
	instance_create_layer(0, 0, "Instances", oCarouselMenu);

	switch(global.perkIndex) {
	    case 0:
			break;//None
	    case 1:
			global.firerate = true;
			break;
		case 2:
			global.energyshield = true;
			break;
		case 3:
			global.juggernaut = true;
			break;
		case 4:
			global.speed = true;
			break;
		case 5:
			global.luck = true;
			break;
		case 6:
			global.flakjacket = true;
			break;
		case 7:
			global.firerate = true;
			global.energyshield = true;
			global.juggernaut = true;
			global.speed = true;
			global.luck = true;
			global.flakjacket = true;
			break;
		case 8:
			global.instakill = true;
			break;
		case 9:
			global.badluck = true;
			break;
		case 10:
			global.lowspeed = true;
			break;
		case 11:
			global.weakness = true;
			break;
		case 12:
			global.nomedkit = true;
			break;
		case 13:
			global.slowfirerate = true;
			break;
	    //future cases: global.perkShield = true, etc.
	}
}

if(back_key){
	//Return to match settings menu
	instance_destroy();
	instance_create_layer(0, 0, "Instances", oSettingsCarouselMenu);
}
