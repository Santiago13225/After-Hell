//Navigate presets
if(keyboard_check_pressed(vk_right)) {
    selected -= 1;
    arrowRightAnim = 1;
}else if(keyboard_check_pressed(vk_left)) {
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