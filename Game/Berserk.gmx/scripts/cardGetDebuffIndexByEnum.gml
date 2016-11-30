///cardGetDebuffIndexByEnum(DEBUFFS v)
switch (argument0)
{
case DEBUFFS.POISON:    
    return sDebuffPoison;
    break;
case DEBUFFS.STUN:
    return sDebuffStun;
    break;
default:
    return sNoone;
    break;
}
