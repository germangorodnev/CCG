///cardJojnImpactPerformer(oCardBase* c, Jojn* jojn)
var c = argument0,
    jojn = argument1;
var yB = CARD_Y,
    s = 1,
    ls = global.cards,
    otherLs = global.opCards;
if (c.player == 0)
{
    ls = global.opCards;
    otherLs = global.cards;
    yB = room_height - CARD_Y;
    s = -1;
}
if (c.hp > 3 || c.mana > 3 || c.armor > 3 || c.dmg > 3)
{
    c.state = CARD_STATES.PERFORM_ACTION;
    with (c)
        cardAttack(ds_list_find_index(ls, jojn), ls, dmg, atkSpd, -1);
}
else
{
    // WE'RE STOLEN
    with (c)
    {
        var pos = cardTryToSteal();
        if (pos == -1) // cannot place the stolen card anywhere
        {
        } 
        else
        {
            // begin to steal
            state = CARD_STATES.PERFORM_ACTION;
            path_clear_points(cardPath);
            path_set_closed(cardPath, false);
            var w = global.cardsOnBoard / 2;
            var xB = CARD_X - (w - 5) * 64;
            path_add_point(cardPath, x, y, 100);
            path_add_point(cardPath, xB + (pos % w) * 128, yB + ((pos div w) * 128) * s, 100);
            path_start(cardPath, 5, path_action_stop, true);
            ds_list_insert(ls, pos, id);
            
            var pos = ds_list_find_index(otherLs, id);
            ds_list_delete(otherLs, pos);
            
            player = 1 * (player == 0);
        } 
    }
}






