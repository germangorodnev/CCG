///cardAddDeathrattle(DEATHRATTLES enum)
var dt = argument0;
if (ds_list_find_index(deathrattles, dt) == -1)
{
    ds_list_add(deathrattles, dt);
    deathrattlesIcons[deathrattlesCnt++] = cardFindDeathrattleIcon(dt);
}
