///cardGetIconIndexByAttackIndex(ACTIOS index)
// WARNING
switch (argument0)
{
case ACTIONS.ATTACK:
    global.attackTypeIndex = 0;
    global.attackTypeCol = c_red;
    break;
case ACTIONS.KONCHA_HEAL:
    global.attackTypeIndex = 1;
    global.attackTypeCol = c_green;
    break;
default:
    global.attackTypeIndex = 0;
    global.attackTypeCol = c_blue;
    break;    
}    
