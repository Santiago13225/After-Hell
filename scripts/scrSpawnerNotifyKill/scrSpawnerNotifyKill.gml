/// @description Call this from the enemy parent when it dies
/// spawnerNotifyKill(spawnerID)
function spawnerNotifyKill(_spawner) {
    if (instance_exists(_spawner)) {
        _spawner.enemiesKilledThisWave += 1;
        _spawner.activeEnemies -= 1;
    }
}