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
    // first of all - the insta actions
    var c = 0;
    for (var i = 0, cardsCnt = instance_number(oCardBase); i < c; i++)
    {
        with (instance_find(oCardBase, i))
        {
            if (cardGetActionInstant())
            {
                c++;
                cardPerformAction();
                cardDone();
            }        
        }
        c = instance_number(oCardBase);
    }
    if (c > 0)
        alarm[11] = 0.5 * room_speed;
    else   
        alarm[11] = 1;
    break;
}

