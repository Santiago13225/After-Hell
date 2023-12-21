///oScoreEffect Step Event
/*This object represents a score effect object.*/
//This event is responsible for handling the score effect object's behavior.
y += speedY;//Move the score effect upwards.
lifetime -= 1;//Reduce the lifetime.

if (lifetime <= 0) {
    instance_destroy();//Remove the score effect when its lifetime reaches zero.
}