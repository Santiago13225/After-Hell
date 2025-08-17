/// oScoreboard Step Event

// Only update stats if scoreboard is visible
if global.showScoreboard {

    var _p = instance_find(oPlayer, 0);
    if _p != noone {
        kills = _p.playerKills;
        maxMoney = _p.playerMaxMoney;
        totalMoney = _p.playerTotalMoney;
        wave = _p.playerWave;
        time = _p.playerTime;
    }

    // Future multiplayer example (pseudo-code)
    /*
    for (var i = 0; i < 4; i++) {
        var _player = instance_find(oPlayer, i);
        if (_player != noone) {
            playerStats[i] = {
                kills: _player.playerKills,
                maxMoney: _player.playerMaxMoney,
                totalMoney: _player.playerTotalMoney,
                wave: _player.playerWave,
                time: _player.playerTime
            };
        }
    }
    */
}
