///oScoreEffect Step Event
/*This object represents a screen pause timed object.*/
//This event is responsible for handling the screen pause timed behavior.

if timer <= 0{
	instance_destroy();//Destroy self.
}

timer--;