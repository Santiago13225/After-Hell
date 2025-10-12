///oInfoSign Create Event
/*This object represents an info sign.*/
//This event is responsible for setting the info sign's depth.
depth = -bbox_top;

//Store the original image_index in case we need to restore it
var _frame = image_index;

//Check control mode and set the correct sprite
if(global.controllerMode == 0) {
    sprite_index = sInfoSign;
}else if(global.controllerMode == 1) {
    sprite_index = sInfoSign2;
}

//Restore frame position so the correct hint appears
image_index = _frame;