///setGameState(GAME_STATES new)
switch (argument0)
{
case GAME_STATES.ZERO_TURN: // need to perform battlecries on all the cards
    with (oCardBase)
    {
        cardPerformBattlecry(false);
        if (!ds_list_empty(actions))
        {
            cardSetState(CARD_STATES.ACTION_CHOOSEN);
        }
        else
        {
            cardSetAction(ACTIONS.PASS_THE_TURN, -1, -1);
            cardSetState(CARD_STATES.ACTION_CHOOSEN);
        }
    }
    if (global.gameState == GAME_STATES.ZERO_TURN)
        clientEndTurn();
    break;
case GAME_STATES.CHOOSE_ACTIONS:
    break;
case GAME_STATES.WAIT_OTHER_PLAYER:
    break;
case GAME_STATES.PERFORM_ACTIONS:
    // begin to perform
    with (oCardBase)
    {
        cardSetState(CARD_STATES.PERFORM_ACTION);
    }
    alarm[1] = 3 * room_speed;
    break;
}

