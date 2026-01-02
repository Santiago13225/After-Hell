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

//change the selection based on the left and right arrow keys
if(right_key){
	selected -= 1;
	arrowRightAnim = 1;//set full animation effect when right is pressed
}else if(left_key){
	selected += 1;
	arrowLeftAnim = 1;//set full animation effect when left is pressed
}

//Decay the animation variables over time (adjust the decay rate as needed)
arrowLeftAnim = max(arrowLeftAnim - 0.05, 0);
arrowRightAnim = max(arrowRightAnim - 0.05, 0);

//rotate towards the selection
//rot -= angle_difference(rot, selected * (360/image_number))/(0.2 * room_speed);
rot -= angle_difference(rot, selected * (360/image_number))/13;

//setting the item variable to image index
item = -selected mod image_number;
if(item < 0){
	item += image_number;
}

if(accept_key){
	//Store the selected map sprite in a global variable for the HUD/scoreboard
	global.selectedMapSprite = item;//Use the sprite you are displaying in the carousel
	//global.selectedMapName = text;//Store the map name for text display if needed

	switch(global.selectedMapSprite){
		case 0:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM1_2, sqFadeOut, sqFadeIn);
			break;
		case 1:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM2_2, sqFadeOut, sqFadeIn);
			break;
		case 2:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM3_2, sqFadeOut, sqFadeIn);
			break;
		case 3:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM4_2, sqFadeOut, sqFadeIn);
			break;
		case 4:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM5_2, sqFadeOut, sqFadeIn);
			break;
		case 5:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM6_2, sqFadeOut, sqFadeIn);
			break;
		case 6://Labyrinth
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_Labyrinth_Level2, sqFadeOut, sqFadeIn);
			//TransitionStart(rm_TM7_2, sqFadeOut, sqFadeIn);
			break;
		case 7:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM8_2, sqFadeOut, sqFadeIn);
			break;
		case 8:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM9_2, sqFadeOut, sqFadeIn);
			break;
		case 9:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM10_2, sqFadeOut, sqFadeIn);
			break;
		case 10:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM11_2, sqFadeOut, sqFadeIn);
			break;
		case 11:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM12_2, sqFadeOut, sqFadeIn);
			break;
		case 12:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_Supermarket_Level, sqFadeOut, sqFadeIn);
			//TransitionStart(rm_TM13_2, sqFadeOut, sqFadeIn);
			break;
		case 13:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_Subway_Station_Level, sqFadeOut, sqFadeIn);
			break;
		case 14:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_Gas_Station_Level, sqFadeOut, sqFadeIn);
			break;
		case 15:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_Cathedral_Level, sqFadeOut, sqFadeIn);
			break;
		case 16:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_Void_Level, sqFadeOut, sqFadeIn);
			break;
		case 17:
			//global.screenShake = true;
			//oHUD2.playerTotalScore = 500;
			//TransitionStart(rm_Supermarket_Level, sqFadeOut, sqFadeIn);
			break;
		case 18:
			//global.screenShake = true;
			//oHUD2.playerTotalScore = 500;
			//TransitionStart(rm_Supermarket_Level, sqFadeOut, sqFadeIn);
			break;
		case 19:
			global.screenShake = true;
			oHUD2.playerTotalScore = 500;
			TransitionStart(rm_TM13_2, sqFadeOut, sqFadeIn);
			break;
	}
}

if(back_key){
	instance_destroy();
	//instance_create_layer(0, 0, "Instances", oTitleMenu2);
	//instance_create_layer(0, 0, "Instances", oSettingsCarouselMenu);
	instance_create_layer(0, 0, "Instances", oPerkCarouselMenu);
}

