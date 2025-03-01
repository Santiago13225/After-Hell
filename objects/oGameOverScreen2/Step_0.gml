///oGameOverScreen Step Event
/*This object represents a game over screen.*/
//This event is responsible for handling game over screen behavior.

shootKey = global.shootKey;//Get the shoot key input.

//Fade in
alpha += alphaSpd;
alpha = clamp(alpha, 0, 1);

//Controller inputs
var _gamePad = 0;
var is_controller_connected = gamepad_is_connected(_gamePad);

if is_controller_connected{
    // Define the deadzone for analog stick inputs
    //var deadzone = 0.2;
    
    // Get analog stick inputs
	//gp_axisrv
    //var axis_vertical = gamepad_axis_value(_gamePad, gp_axisrv);
    //var axis_horizontal = gamepad_axis_value(_gamePad, gp_axislh);
    
    // Convert analog stick inputs to up and down key presses
    //up_key |= axis_vertical < -deadzone;
    //down_key |= axis_vertical > deadzone;
	//gamepad_button_check(_gamePad, gp_shoulderrb);
	//gp_padu
	up_key = gamepad_button_check_pressed(_gamePad, gp_padu);
	down_key = gamepad_button_check_pressed(_gamePad, gp_padd);
    //up_key = gamepad_button_check_pressed(_gamePad, gp_shoulderlb);
	//down_key = gamepad_button_check_pressed(_gamePad, gp_shoulderlb);
    // Convert analog stick inputs to left and right key presses
    // You can modify these conditions based on your controller's axis values
    // In this example, pushing the stick left gives "A" press and pushing right gives "D" press
    //left_key = axis_horizontal < -deadzone;
    //right_key = axis_horizontal > deadzone;
    
    // Convert controller button presses to accept_key
    accept_key |= gamepad_button_check_pressed(_gamePad, gp_face1);
}


//Restart
/*
if shootKey && alpha >= 1
{
	room_restart();
	//game_restart();//hard resets the entire game
}*/