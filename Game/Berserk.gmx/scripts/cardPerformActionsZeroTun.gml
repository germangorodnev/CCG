ds_list_clear(actions);
if (player == 1)
    exit;
switch (type)
{
case CARDS.MIMIC_WILD: // attack the random card in 1 row
    cardSetAction(ACTIONS.MIMIC_WILD_BATTLECRY, irandom((ds_list_size(global.opCards) div 2) - 1), TARGET_GROUPS.ENEMY_CARDS);
    cardSetState(CARD_STATES.ACTION_CHOOSEN);
    break;
case CARDS.MIMIC_TOWN: // attack the random card in 1 row
    cardSetAction(ACTIONS.MIMIC_TOWN_BATTLECRY, irandom((ds_list_size(global.opCards) div 2) - 1), TARGET_GROUPS.ENEMY_CARDS);
    cardSetState(CARD_STATES.ACTION_CHOOSEN);
    break;
default: // dont have an battlecry
    cardSetAction(ACTIONS.PASS_THE_TURN, -1, -1);
    cardSetState(CARD_STATES.ACTION_CHOOSEN);
    break;
}
