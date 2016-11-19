///cardGetDebuffIndexByEnum(DEBUFFS v)
switch (argument0)
{
case DEBUFFS.POISON:    
    return sDebuffPoison;
    break;
case DEBUFFS.STUN:
    return sDebuffStun;
    break;
case DEBUFFS.VISIBILITY:
    return sVisible;
    break;
default:
    return sDebuffStun;
    break;
}
