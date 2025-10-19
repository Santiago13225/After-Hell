function set_song_ingame(_song, _fadeOutCurrentSong = 0, _fadeIn = 0){
//_song = set to any song(including "noone" to stop or fade the track out) 
//_fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
//_fadeIn = time (in frames) the target song (if not "noone") will take to fade in 

	with(oMusicManager){
		targetSongAsset = _song;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeIn;
	}
}