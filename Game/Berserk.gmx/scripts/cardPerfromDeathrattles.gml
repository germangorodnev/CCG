///cardPerformDeathrattles(bool clear)

for (var i = 0, c = ds_list_size(deathrattles); i < c; i++)
{
    var dt = deathrattles[| i];
    switch (dt)
    {
    case DEATHRATTLES.CORRUPTION:
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
        break;
    case DEATHRATTLES.KONCHA_MUSHROOMS:
        var m = instance_create(x, y, oCard);
        m.player = player;
        if (!cardHasDeathrattle(DEATHRATTLES.CORRUPTION))
        {
            m.type = CARDS.MUSHROOMS;
        }
        else
        {
            // cretae corrupted mushrooms
            m.type = CARDS.CORRUPTED_MUSHROOMS;
        }
        with (m)
        {
            cardInit();
        }
        var myg = cardGetGroup();
        var p = ds_list_find_index(myg, id);
        ds_list_replace(myg, p, m);  
        break;
    case DEATHRATTLES.GOLEM_B_TO_M:
        // cretae a FUCKING MOM
        var mom = instance_create(x, y, oCard);
        mom.player = player;
        mom.type = CARDS.GOLEM_MATYA;
        with (mom)
            cardInit();
        var myg = cardGetGroup();
        var p = ds_list_find_index(myg, id);
        ds_list_replace(myg, p, mom);  
        if (argument0)
        {
            ds_list_clear(deathrattles);
            c = 0;
        }    
        break;
    case DEATHRATTLES.GOLEM_M_TO_S:
        // cretae a FUCKING SON
        var son = instance_create(x, y, oCard);
        son.player = player;
        son.type = CARDS.GOLEM_SON;
        with (son)
            cardInit();
        var myg = cardGetGroup();
        var p = ds_list_find_index(myg, id);
        ds_list_replace(myg, p, son);          
        if (argument0)
        {
            ds_list_clear(deathrattles);
            c = 0;
        }    
        break;
    }
}
if (argument0)
    ds_list_clear(deathrattles);
