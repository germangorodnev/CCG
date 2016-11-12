switch (global.gameState)
{
case GAME_STATES.PERFORM_ACTIONS:
    gameCheckWin();
    break;
case GAME_STATES.CHOOSE_ACTIONS:
    if (global.clientState == CLIENT_STATES.CHOOSING_TARGET)
    {
        if (mouse_check_button_released(mb_right))
        {
            with(global.choosenCard)
            {
                cardSetState(CARD_STATES.WAIT_FOR_ACTION);
                ds_list_clear(actions);
            }
            clientSetState(CLIENT_STATES.CHOOSING_CARD);
        }
        if (mouse_check_button_released(mb_left))
        {
            var c = 0;
            with (oCardBase)
            {
                if (mouseOnUs())
                    c++;
            }
            if (!c)
            {
                with(global.choosenCard)
                {
                    cardSetState(CARD_STATES.WAIT_FOR_ACTION);
                    ds_list_clear(actions);
                }
                clientSetState(CLIENT_STATES.CHOOSING_CARD);
            }
        }
        }
    break;
}

