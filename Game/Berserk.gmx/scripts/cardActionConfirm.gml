/// set the randomness and all that stuff, call before the sending
switch (actions[| 0])
{
case ACTIONS.MIMIC_WILD_BATTLECRY:
    // 50% chance
    actions[| 1] = choose(true, false);
    break;
case ACTIONS.MIMIC_TOWN_BATTLECRY:
    // 50% chance
    actions[| 1] = choose(true, false);
    break;
    
case ACTIONS.JOJN_SWORD_STRIKE:
    ds_list_add(actions, choose(0, 0, 1, 2));
    break;
    
case ACTIONS.CHEMIST_INVENTOR_TRANSFORM:
    // initila chance - 25 %
    var chance = 75 + cardGetCountOnBoard(CARDS.MINI_BOT, cardGetGroup()) * 10;
    var rng = random_range(0.0, 100.0);
    if (rng <= chance)
    {
        actions[| 1] = true;
        ds_list_add(actions, gameGetCard(false, 3));
    }
    else
        actions[| 1] = false;
    break;
    
case ACTIONS.GRAVER_GRAVE:
    var size = ds_list_size(oGameLists.died);
    if (size > 0)
        ds_list_add(actions, oGameLists.died[| irandom(size - 1)]);
    else
        ds_list_add(actions, -1);
    break;    
    
case ACTIONS.HELI_HELP:
    ds_list_add(actions, gameGetCard(true, 0));
    break;
}

// WARNING
switch (type)
{
case CARDS.MUSHROOMS: // random target
case CARDS.CORRUPTED_MUSHROOMS:
    if (ds_list_empty(actions))
    {
         // set the random poison
         var obj = global.opCards[| irandom(ds_list_size(global.opCards) - 1)];
         var pos = cardPosToIndex(obj.x, obj.y);
         cardSetAction(ACTIONS.MUSHROOMS_POISON_PASSIVE, pos, TARGET_GROUPS.ENEMY_CARDS);
         global.AP += AP;
    }
    break;
}
