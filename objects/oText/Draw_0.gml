//draw_set_font(global.fontHUD);
if(global.controllerMode == 1) {
    draw_set_font(global.fontController);
}else {
    draw_set_font(global.font_main);
}
draw_text(x, y, text);
draw_set_font(global.font_main);