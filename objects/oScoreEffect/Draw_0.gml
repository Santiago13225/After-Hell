///oScoreEffect Draw Event
/*This object represents a score effect object.*/
//This event is responsible for handling score effect drawing.
draw_set_color(c_white);//Set text color to white.

//Define the position (x, y) for the score effect
var drawX = x;
var drawY = y - 10;//Adjust the Y position as needed.

global.fontHUD = font_add_sprite(sHUDFont, 32, true, 1);
draw_set_font(global.fontHUD);
//Draw the score as text
draw_text(drawX, drawY, "+ " + string(scoreValue));