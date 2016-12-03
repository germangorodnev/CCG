///cardSetAction(ACTIONS act, OPTIONAL int index = -1, OPTIONAL TARGET_GROUPS whereIndexIs = -1)
// we replace the action with the new one
ds_list_clear(actions);
/*0*/ ds_list_add(actions, argument0); // that is the type
/*1*/ ds_list_add(actions, true); // that is the success
if (argument1 != -1)
{
/*2*/ ds_list_add(actions, argument1); // target index
/*3*/ ds_list_add(actions, argument2); // target group
}
// decrease the AP
if (argument0 != ACTIONS.PASS_THE_TURN)
    changeAP(-AP);
/*var pos = cardGetArrIndexByEnum(argument0);
if (pos != -1)
{
    // decrease the mana 
    if (player == 0)
        cardChangeMana(-actionsMana[pos]);
}

