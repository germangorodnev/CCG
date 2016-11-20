///cardPerformDeathrattles(bool clear)

for (var i = 0, c = ds_list_size(deathrattles); i < c; i++)
{
    var dt = deathrattles[| i];
    switch (dt)
    {
    case DEATHRATTLES.CORRUPTION:
        // create a new card instead of us
        var gn = cardReplace(CARDS.PUS);
        break;
    case DEATHRATTLES.KONCHA_MUSHROOMS:
        var t = CARDS.MUSHROOMS;
        if (cardHasDeathrattle(DEATHRATTLES.CORRUPTION))
            t = CARDS.CORRUPTED_MUSHROOMS;
        cardReplace(t);
        break;
    case DEATHRATTLES.GOLEM_B_TO_M:
        // cretae a FUCKING MOM
        cardReplace(CARDS.GOLEM_MATYA);
        if (argument0)
        {
            ds_list_clear(deathrattles);
            c = 0;
        }    
        break;
    case DEATHRATTLES.GOLEM_M_TO_S:
        // cretae a FUCKING SON
        cardReplace(CARDS.GOLEM_SON);
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
