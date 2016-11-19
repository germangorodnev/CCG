switch (type)
{
case CARDS.GOLEM_MENTOR:
    for (var i = 0, c = ds_list_size(ls1); i < c; i++)
    {
        if (ls1[| i] != noone)
        {
            var myid = id;
            with (ls1[| i])
            {
                cardDeleteImpact(myid);
            }
        }
    }
    ds_list_destroy(ls1);
    break;
}

///Need to clear our pos in the list
if (player == 0)
{
    var pos = ds_list_find_index(global.cards, id);
    ds_list_delete(global.cards, pos);
}
else
{
    var pos = ds_list_find_index(global.opCards, id);
    ds_list_delete(global.opCards, pos);
}

ds_list_destroy(actions);
ds_list_destroy(resists);
ds_list_destroy(debuffs);
ds_list_destroy(buffs);
ds_list_destroy(deathrattles);
ds_list_destroy(impacts);
if (path_exists(cardPath))
    path_delete(cardPath);
actionsNames = 0; // actual name of action
actionsIndex = 0; // index in ACTIONS enum
actionsMana = 0; // mana needed
actionsNeedTarget = 0;
actionsInstant = 0;
deathrattlesIcos = 0;
event = 0;


gameCheckWin();
