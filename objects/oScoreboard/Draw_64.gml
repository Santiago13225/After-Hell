/// oScoreboard Draw Event

if global.showScoreboard {

    draw_set_alpha(alpha);

    // Background
    draw_set_color(c_black);
    draw_rectangle(x, y, x + width, y + height, false);

    // Border
    draw_set_color(c_white);
    draw_rectangle(x, y, x + width, y + height, true);

    draw_set_alpha(1);
    draw_set_color(c_white);

    // Draw stats for single player
    draw_text(x + 10, y + 10, "Kills: " + string(kills));
    draw_text(x + 10, y + 30, "Max Money: " + string(maxMoney));
    draw_text(x + 10, y + 50, "Total Money: " + string(totalMoney));
    draw_text(x + 10, y + 70, "Wave: " + string(wave));
    draw_text(x + 10, y + 90, "Time: " + string(floor(time / 60)) + "s");

    // Multiplayer example (commented for now)
    /*
    for (var i = 0; i < 4; i++) {
        if playerStats[i] != 0 {
            draw_text(x + 10, y + 110 + i*40, "P" + string(i+1) + 
                      " K:" + string(playerStats[i].kills) + 
                      " M:" + string(playerStats[i].maxMoney));
        }
    }
    */
}
