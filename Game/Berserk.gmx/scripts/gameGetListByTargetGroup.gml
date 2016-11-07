///gameGetListByTargetGroup(TARGET_GROUPS n, OPTIONAL targetIndex = -1)
switch (argument0)
{
case TARGET_GROUPS.ANY_CARD:
    // WARNING
    if (!is_undefined(global.cards[| argument1]))
        return global.cards;
    else if (!is_undefined(global.opCards[| argument1]))
        return global.opCards;
    break;
case TARGET_GROUPS.ENEMY_CARDS:
    if (player == 0)
        return global.opCards;
    else
        return global.cards;
    break;
case TARGET_GROUPS.ALLY_CARDS:
    if (player == 0)
        return global.cards;
    else
        return global.opCards;
    break;
}

