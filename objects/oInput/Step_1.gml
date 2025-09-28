///oInput Begin Step Event
/*This object represents an input object.*/
//This event is responsible for handling input object begin step event behavior.

//Get inputs
if global.controllerMode == 0{//If set to keyboard and mouse mode.
	global.rightKey = keyboard_check(ord("D")) || keyboard_check_pressed(vk_right);
	global.leftKey = keyboard_check(ord("A")) || keyboard_check_pressed(vk_left);
	global.upKey = keyboard_check(ord("W")) || keyboard_check_pressed(vk_up);
	global.downKey = keyboard_check(ord("S")) || keyboard_check_pressed(vk_down);

	global.xaxisLeft = global.rightKey - global.leftKey;
	global.yaxisLeft = global.downKey - global.upKey;

	global.shootKey = mouse_check_button(mb_left);
	global.swapKeyPressed = mouse_check_button_pressed(mb_right);
	global.upSwapKeyPressed = mouse_wheel_up();
	global.downSwapKeyPressed = mouse_wheel_down();

	global.startKeyPressed = keyboard_check_pressed(vk_enter);
	//Toggle scoreboard with I
	global.selectKeyPressed = keyboard_check_pressed(ord("I"));
	//if(keyboard_check_pressed(ord("I"))) {
	//	global.selectKeyPressed = !global.selectKeyPressed;
	//}
}

if global.controllerMode == 1{//Controller Mode
	var _gamePad = 0;
	if gamepad_is_connected(_gamePad){//If controller is connected...
		gamepad_set_axis_deadzone(_gamePad, .2);
		
		global.rightKey = gamepad_button_check(_gamePad, gp_padr);
		global.leftKey = gamepad_button_check(_gamePad, gp_padl);
		global.upKey = gamepad_button_check(_gamePad, gp_padu);
		global.downKey = gamepad_button_check(_gamePad, gp_padd);

		//global.rightKeyPressed = gamepad_button_check_pressed(_gamePad, gp_padr);

		//global.xaxisLeft = global.rightKey - global.leftKey;
		//global.yaxisLeft = global.downKey - global.upKey;
		global.xaxisLeft = gamepad_axis_value(_gamePad, gp_axislh) + (global.rightKey - global.leftKey);
		global.yaxisLeft = gamepad_axis_value(_gamePad, gp_axislv) + (global.downKey - global.upKey);
		global.xaxisLeft = clamp(global.xaxisLeft, -1, 1);
		global.yaxisLeft = clamp(global.yaxisLeft, -1, 1);
		
		//Key pressed for analogue sticks
		//*may not need this set of code
		/*var _leftStickDir = point_direction(0, 0, global.xaxisLeft, global.yaxisLeft);
		var _buttonPressDeadzone = 0;
		if controllerRightKeyPressed == 0 && global.xaxisLeft > _buttonPressDeadzone && (_leftStickDir <= 45 || _leftStickDir >= 315){
			//Stop code from running again by resetting variable
			controllerRightKeyPressed = 1;
			//Trigger the button press
			global.rightKeyPressed = 1;
		}
		//Reset the resetter variable
		if !(global.xaxisLeft >= _buttonPressDeadzone){
			controllerRightKeyPressed = 0;
		}*/

		global.xaxisRight = gamepad_axis_value(_gamePad, gp_axisrh);
		global.yaxisRight = gamepad_axis_value(_gamePad, gp_axisrv);

		global.shootKey = gamepad_button_check(_gamePad, gp_shoulderrb);
		global.swapKeyPressed = gamepad_button_check_pressed(_gamePad, gp_shoulderlb);
		global.upSwapKeyPressed = gamepad_button_check_pressed(_gamePad, gp_shoulderr);
		global.downSwapKeyPressed = gamepad_button_check_pressed(_gamePad, gp_shoulderl);

		global.startKeyPressed = gamepad_button_check_pressed(_gamePad, gp_start);
		global.selectKeyPressed = gamepad_button_check_pressed(_gamePad, gp_select);
		//if(gamepad_button_check_pressed(_gamePad, gp_select)) {
		//	global.selectKeyPressed = !global.selectKeyPressed;
		//}
	}
}