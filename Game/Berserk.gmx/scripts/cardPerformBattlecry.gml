///cardPerformBattlecry(bool perform)
ds_list_clear(actions);

switch (type)
{
case CARDS.MIMIC_WILD: // attack the random card in 1 row
    cardSetAction(ACTIONS.MIMIC_WILD_BATTLECRY, irandom((ds_list_size(global.opCards) div 2) - 1), TARGET_GROUPS.ENEMY_CARDS);
    break;
case CARDS.MIMIC_TOWN: // attack the random card in 1 row
    cardSetAction(ACTIONS.MIMIC_TOWN_BATTLECRY, irandom((ds_list_size(global.opCards) div 2) - 1), TARGET_GROUPS.ENEMY_CARDS);
    break;
case CARDS.VAPE:
    cardSetAction(ACTIONS.VAPE_BATTLECRY, -1, -1);
    break;  
/*default: // dont have an battlecry
    cardSetAction(ACTIONS.PASS_THE_TURN, -1, -1);
    cardPerformAction();
    //cardSetState(CARD_STATES.ACTION_CHOOSEN);
    break;*/
}

if (argument0)
{
    cardPerformAction();
}
else
{
    cardSetState(CARD_STATES.ACTION_CHOOSEN);
}

