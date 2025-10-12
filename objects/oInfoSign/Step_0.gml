///oInfoSign Step Event
var _frame = image_index;

if(global.controllerMode == 0 && sprite_index != sInfoSign) {
    sprite_index = sInfoSign;
    image_index = _frame;
}else if(global.controllerMode == 1 && sprite_index != sInfoSign2) {
    sprite_index = sInfoSign2;
    image_index = _frame;
}
