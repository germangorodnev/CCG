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
case ACTIONS.JOJN_IMPACT_OF_THE_DIVINE:
    global.attackTypeIndex = 2;
    global.attackTypeCol = c_blue;  
    break;
case ACTIONS.ARTONIX_AUTOMAT_FIRE:  
    global.attackTypeIndex = 3;
    global.attackTypeCol = c_red;
    break;  
case ACTIONS.MIMIC_WILD_STUN:
    global.attackTypeIndex = 4;
    global.attackTypeCol = c_blue;
    break;
case ACTIONS.PORCHANKA_CORRUPTION:
case ACTIONS.KONCHA_POISON:
    global.attackTypeIndex = 5;
    global.attackTypeCol = c_blue;
    break;
case ACTIONS.SMEMS_FIREBALL:
    global.attackTypeIndex = 6;
    global.attackTypeCol = c_red;
    break;    
default:
    global.attackTypeIndex = 0;
    global.attackTypeCol = c_blue;
    break;    
}    
