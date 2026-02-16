/// oEnemyParent Step Event
get_damage(oDamageEnemy);

var waveCompletionMessageShown = false;

// Hit feedback
if(place_meeting(x, y, oUnstableBullet)){
    image_blend = c_red;
} else {
    image_blend = c_white;
}

// Death
if(hp <= 0){
    if(instance_exists(oHUD2)){
        if(!instance_exists(oScoreEffect)){
            var zombieScoreValue = 100;
            var _scoreInst = instance_create_depth(x, y, -3000, oScoreEffect);
            if(_scoreInst){
                _scoreInst.scoreValue = zombieScoreValue;
                _scoreInst.ShowEffect(zombieScoreValue, x, y);
            }
        }
        oHUD2.playerScore += 100;
    }
    
    global.enemyKillCount++;
    oInvisibleSpawner2.zombiesKilledThisWave++;
    
    if(oInvisibleSpawner2.zombiesKilledThisWave == oInvisibleSpawner2.activeEnemyMax && !waveCompletionMessageShown){
        audio_play_sound(sndRoundEnd1, 10, false);
        instance_create_depth(x, y, -8000, oWaveEndScreen);
        waveCompletionMessageShown = true;
        
        var _create_end = function(){
            audio_play_sound(sndRoundStart1, 10, false);
            instance_create_depth(x, y, -8000, oWaveStartScreen);
        }
        call_later(10, time_source_units_seconds, _create_end);
    }

    // Item drops
    var _dropAttempts = global.luck ? irandom_range(2,3) : 1;
    for(var i = 0; i < _dropAttempts; i++){
        var _chance = irandom(100);
        var dx = random_range(-4, 4);
        var dy = random_range(-4, 4);
        if(_chance <= 5) instance_create_depth(x + dx, y + dy, depth, oGreenbacks);
        else if(_chance <= 10) instance_create_depth(x + dx, y + dy, depth, oBluebacks);
        else if(_chance <= 15) instance_create_depth(x + dx, y + dy, depth, oRedbacks);
        else if(_chance <= 20) instance_create_depth(x + dx, y + dy, depth, oBronzebacks);
        else if(_chance <= 25) instance_create_depth(x + dx, y + dy, depth, oSilverbacks);
        else if(_chance <= 30) instance_create_depth(x + dx, y + dy, depth, oGoldbacks);
        else if(_chance <= 35) instance_create_depth(x + dx, y + dy, depth, oBlackbacks);
        else if(_chance <= 70){
            // Ammo drops
            if(array_contains(global.PlayerWeapons, global.WeaponList.smg)) instance_create_depth(x + dx, y + dy, depth, oLightAmmo);
            else if(array_contains(global.PlayerWeapons, global.WeaponList.shotgun)) instance_create_depth(x + dx, y + dy, depth, oShellAmmo);
            else if(array_contains(global.PlayerWeapons, global.WeaponList.assault)) instance_create_depth(x + dx, y + dy, depth, oRifleAmmo);
            else if(array_contains(global.PlayerWeapons, global.WeaponList.sniper)) instance_create_depth(x + dx, y + dy, depth, oSniperAmmo);
            else if(array_contains(global.PlayerWeapons, global.WeaponList.lmg)) instance_create_depth(x + dx, y + dy, depth, oHeavyAmmo);
            else if(array_contains(global.PlayerWeapons, global.WeaponList.bazooka)) instance_create_depth(x + dx, y + dy, depth, oRocketAmmo);
            else if(array_contains(global.PlayerWeapons, global.WeaponList.raygun)) instance_create_depth(x + dx, y + dy, depth, oColdCellAmmo);
            else instance_create_depth(x + dx, y + dy, depth, oMedkit);
        }
    }

    audio_play_sound(sndSplatter, 8, false);
    create_animated_vfx(sPoof, x, y, depth);
    instance_destroy();
}

// Area tracking and teleportation
if(instance_exists(oAreaMarker)){
    if(place_meeting(x, y, oAreaMarker)){
        var inst = instance_place(x, y, oAreaMarker);
        if(instance_exists(inst)) areaID = inst.areaID;
    }
    
    if(areaID != global.playerAreaID){
        var spawnList = [];
        with(oZombieAreaSpawn){
            if(areaID == global.playerAreaID) array_push(spawnList, id);
        }
        if(array_length(spawnList) > 0){
            var randomSpawn = spawnList[irandom(array_length(spawnList)-1)];
            x = randomSpawn.x;
            y = randomSpawn.y;
            areaID = global.playerAreaID;
            create_animated_vfx(sPoof, x, y, depth-50);
        }
    }
}