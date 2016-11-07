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
}

// WARNING
switch (type)
{
case CARDS.MUSHROOMS: // random target
    if (ds_list_empty(actions))
    {
         // set the random poison
         cardSetAction(ACTIONS.MUSHROOMS_POISON_PASSIVE, irandom(ds_list_size(global.opCards) - 1), TARGET_GROUPS.ENEMY_CARDS);
         global.AP += AP;
    }
    break;
}
