cardClearAdditionalLists();

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

// CLEARING BUFFS
for (var i = 0, c = ds_list_size(buffs); i < c; i++)
{
    var l = buffs[| i];
    cardDeleteBuff(l[| 0]);
}

if (ds_exists(actions, ds_type_list))
    ds_list_destroy(actions);
if (ds_exists(resists, ds_type_list))
    ds_list_destroy(resists);
if (ds_exists(debuffs, ds_type_list))
    ds_list_destroy(debuffs);
if (ds_exists(buffs, ds_type_list))
    ds_list_destroy(buffs);
if (ds_exists(deathrattles, ds_type_list))
    ds_list_destroy(deathrattles);
if (ds_exists(impacts, ds_type_list))
    ds_list_destroy(impacts);
if (ds_exists(cbuffs, ds_type_list))
    ds_list_destroy(cbuffs);
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
