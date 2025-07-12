///oEnemyParent Clean Up Event
/*This object represents an enemy parent.*/
//This event is responsible for clearing some overhead.
get_damage_cleanup();//Free up memory if hp is no longer needed.

if path_exists(path) {
    path_end();
    path_delete(path);
}