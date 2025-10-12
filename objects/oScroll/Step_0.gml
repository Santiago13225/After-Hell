//Detect control mode changes mid-scroll
if(global.controllerMode != previousMode) {
    previousMode = global.controllerMode;

    //Destroy all currently scrolling text
    with (oText) instance_destroy();

    //Rebuild the correct scroll text array
    if(global.controllerMode == 1) {
        scroll = [
            "Hint:",
            "Use the left analog stick or D-Pad to navigate through the menu.",
            "Use [@] to select, and use [#] to go back in some menu pages.",
            "Use the left and right D-Pad buttons to set the volume in the settings page of the menu."
        ];
    }else {
        scroll = [
            "Hint:",
            "Use the \"WASD\" or arrow keys to navigate through the menu.",
            "Use [Space] to select, and use [Backspace] to go back in some menu pages.",
            "Use the left and right arrow keys to set the volume in the settings page of the menu.",
            "The controller mode option in the settings page of the menu is locked until you connect a Bluetooth controller to your device."
        ];
    }

    //Reset all scroll variables
    arraylength = array_length(scroll);
    line = 0;
    counter = 0;
}

if(counter < 0){
	inst = instance_create_layer(scrollX, scrollY, "Instances", oText);
	inst.text = scroll[line];
	
	counter = 30 + string_width(scroll[line]);
	line += 1;
	
	if(line >= arraylength){
		line = 0;
		counter += 100;
	}
}

counter -= 1;
