//change the selection based on the left and right arrow keys
if(keyboard_check_pressed(vk_right)){
	selected -= 1;
	arrowRightAnim = 1;  // set full animation effect when left is pressed
}else if(keyboard_check_pressed(vk_left)){
	selected += 1;
	arrowLeftAnim = 1;  // set full animation effect when right is pressed
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
