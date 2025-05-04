///oLowHealthScreen Create Event
/*This object represents a low health screen.*/
//This event is responsible for setting some variables for the low health screen.
depth = -8000;

//Fade out control
//alpha = .65;
//alphaSpd = alpha/20;
alpha    = 0;            // starting transparency
pulseSpd = 0.1;          // speed of pulsing
pulseAmt = 0.5;          // max alpha variation (0–1)
time     = 0;            // internal timer