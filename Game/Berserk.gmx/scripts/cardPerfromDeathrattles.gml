///cardPerformDeathrattles(bool clear)

for (var i = 0, c = ds_list_size(deathrattles); i < c; i++)
{
    var dt = deathrattles[| i];
    switch (dt)
    {
    case DEATHRATTLES.CORRUPTION:
    {
        // create a new card instead of us
        var gn = instance_create(x, y, oCard);
        gn.type = CARDS.PUS;
        gn.player = player;
        with (gn)
        {
            cardInit();
        }
        var myg = cardGetGroup();
        var p = ds_list_find_index(myg, id);
        ds_list_replace(myg, p, gn);
    }
        break;
    case DEATHRATTLES.KONCHA_MUSHROOMS:
    {
        var m = instance_create(x, y, oCard);
        m.type = CARDS.MUSHROOMS;
        m.player = player;
        with (m)
        {
            cardInit();
        }
        var myg = cardGetGroup();
        var p = ds_list_find_index(myg, id);
        ds_list_replace(myg, p, m);  
    }  
        break;
    }
}
if (argument0)
    ds_list_clear(deathrattles);
