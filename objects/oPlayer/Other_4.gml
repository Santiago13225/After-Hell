///oPlayer Room Start Event
/*This object represents the player object.*/
//This event is responsible for handling player object room start behavior.

audio_play_sound(sndLaugh, 8, false);
//global.rm[0]
//if room_exists(rm_House_Level1){
if room == rm_Level1{
	audio_play_sound(sndTestLevelTheme, 8, true);
}else if room == rm_House_Level1{
	audio_play_sound(sndHouseTheme1, 8, true);
}else if room == rm_Facility_Level{
	audio_play_sound(sndFacilityTheme1, 8, true);
}else if (room == rm_Temple_Level1){
	audio_play_sound(sndTempleTheme1, 8, true);
}else if (room == rm_Overlook_Level4){
	audio_play_sound(sndOverlookTheme1, 8, true);
}else if (room == rm_Labyrinth_Level){
	audio_play_sound(sndLabyrinthTheme, 8, true);
}else if (room == rm_Casino_Level1 || room == rm_Casino_Level2 || room == rm_Casino_Level3){
	audio_play_sound(sndCasinoTheme, 8, true);
}else if (room == rm_Graveyard_Level){
	audio_play_sound(sndGraveyardTheme, 8, true);
}else if (room == rm_Island_Level1){
	audio_play_sound(sndIslandTheme, 8, true);
}else if (room == rm_WaterStation_Level1){
	audio_play_sound(sndWaterStationTheme1, 8, true);
}else if (room == rm_CityBlock_Level1){
	audio_play_sound(sndCityBlockTheme, 8, true);
}else if (room == rm_Yard_Level1){
	audio_play_sound(sndYardTheme, 8, true);
}else if (room == rm_Museum_Level1){
	audio_play_sound(sndMuseumTheme, 8, true);
}else if (room == rm_Supermarket_Level){
	audio_play_sound(sndSupermarketTheme, 8, true);
}else if (room == rm_Tutorial_Level){
	audio_play_sound(sndTutorialTheme, 8, true);
}else {
	audio_play_sound(sndTestLevelTheme, 8, true);
}