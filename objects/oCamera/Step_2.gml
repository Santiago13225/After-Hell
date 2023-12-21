///oCamera End Step Event
/*This object represents a camera.*/
//This event is responsible for handling camera behavior.

var _camW = camera_get_view_width(view_camera[0]);//Get the camera's width.
var _camH = camera_get_view_height(view_camera[0]);//Get the camera's height.

//var _lay = layer_create(-50000, "transition");
//global.sequenceLayer = layer_sequence_create(_lay, 0, 0, sqSlideOut);

//Center on the Player
if instance_exists(oPlayer){//If the player object exists...
	x = oPlayer.x - _camW/2;//Set x to player's x coordinate.
	y = oPlayer.centerY - _camH/2;//Set x to player's y coordinate.
}

//Camera Shaking
//x shake
if xShakeAmount > 0{
	xShakeDir += xShakeDirSpd;
	xShakeAmount -= xShakeAmountSpd;
} else {
	xShakeAmount = 0;
	xShakeDir = 0;
}
xShake = dsin(xShakeDir) * xShakeAmount;

//y shake
if yShakeAmount > 0{
	yShakeDir += yShakeDirSpd;
	yShakeAmount -= yShakeAmountSpd;
} else {
	yShakeAmount = 0;
	yShakeDir = 0;
}
yShake = dsin(yShakeDir) * yShakeAmount;

//Add in the camera shake
x += xShake;
y += yShake;

//Clamp cam position to room borders
x = clamp(x, 0, room_width - _camW);
y = clamp(y, 0, room_height - _camH);

camera_set_view_pos(view_camera[0], x, y);//Set the camera position.