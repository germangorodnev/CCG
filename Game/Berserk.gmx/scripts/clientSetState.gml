///clientSetState(CLIENT_STATES new)
global.clientState = argument0;

switch (global.clientState)
{
case CLIENT_STATES.CHOOSING_CARD:
    with (oCard)
        choosen = false;
    global.choosenCard = noone;
    global.choosenCardIndex = -1;
    cursor_sprite = sCursor;
    break;
case CLIENT_STATES.CHOOSING_ACTION:
    break;
case CLIENT_STATES.CHOOSING_TARGET:
    global.choosenCard = noone;
    global.choosenCardIndex = -1;
    break;
}
