if (state == CARD_STATES.DESTROY)
    return false;
if (ds_list_empty(actions))
    return false;
var pos = cardGetArrIndexByEnum(actions[| 0]);
if (pos != -1)
{
    return actionsInstant[pos];
}
return false;
