///cardSetState(CARD_STATES new)
state = argument0;
cursor_sprite = sCursor;

switch (state)
{
case CARD_STATES.WAIT_FOR_ACTION: // begin
    break;
case CARD_STATES.CHOOSE_TARGET:
    cursor_sprite = sCursorTarget;
    global.choosenCard = id;
    break;
case CARD_STATES.ACTION_CHOOSEN:
    choosen = false;
    break;
case CARD_STATES.PERFORM_ACTION:
    cardPerformAction();
    break;
case CARD_STATES.DESTROY:
    cardPerfromDeathrattles(true);
    break;
}




