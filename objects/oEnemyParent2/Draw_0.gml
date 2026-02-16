///oEnemyParent Draw Event
/*This object represents an enemy parent.*/
//This event is responsible for handling some drawing.
draw_self();//Draw itself.

draw_text(x, y, string(hp));//Draw hp in string format.

draw_text(x, y - 32, string(ds_list_size(damageList)));//Check the size of the damage list.