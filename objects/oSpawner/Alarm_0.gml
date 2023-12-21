//instance_create(x, y, oSpawner.chooseZombieType());
instance_create_depth(x, y, depth, oSpawner.chooseZombieType());

alarm[0] = spawnTime + random(time_dif);