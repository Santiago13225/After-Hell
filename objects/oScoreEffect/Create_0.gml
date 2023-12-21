///oScoreEffect Create Event
/*This object represents a score effect object.*/
//This event is responsible for setting some variables for the score effect object.

score = 0;//Initialize the score value.
speedY = -2;//Set the upward speed of the score effect.
lifetime = 10;//Set the number of frames the score effect should last (adjust as needed).
scoreValue = 0;//Initialize the scoreValue variable.

//Custom function to display the score effect
function ShowEffect(scoreValue, x, y) {
    //Set the position of the score effect
    self.x = x;
    self.y = y;

    //Set the score value to display
    self.scoreValue = scoreValue;

    //You can add any additional code to customize the appearance of the score effect here.
}