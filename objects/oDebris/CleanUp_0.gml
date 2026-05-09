/// oDebris Clean Up Event

// grid cleanup (if needed here or already elsewhere)
var _setup = instance_find(oSetupPathway, 0);
if (_setup != noone) {
    var _grid = _setup.grid;

    var cell_size = 16;

    var x1 = bbox_left div cell_size;
    var y1 = bbox_top div cell_size;
    var x2 = bbox_right div cell_size;
    var y2 = bbox_bottom div cell_size;

    for (var gx = x1; gx <= x2; gx++) {
        for (var gy = y1; gy <= y2; gy++) {
            mp_grid_clear_cell(_grid, gx, gy);
        }
    }
}

// IMPORTANT: force radar rebuild AFTER removal
global.radar_dirty = true;
