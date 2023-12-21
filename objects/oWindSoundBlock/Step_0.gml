///oWindSoundBlock Create Event
/*This object represents the wind sound block object.*/
//This event is responsible for setting some variables for the wind sound block object.
if place_meeting(x, y, oPlayer){//If in contact with player.
	oSFX.beachSndLoop = true;//Play the beach sound loop.
}