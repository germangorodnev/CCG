cardClearAdditionalLists();
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

