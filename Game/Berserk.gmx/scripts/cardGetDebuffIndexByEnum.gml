///cardGetDebuffIndexByEnum(DEBUFFS v)
switch (argument0)
{
case DEBUFFS.POISON:    
    return sDebuffPoison;
    break;
case DEBUFFS.STUN:
    return sDebuffStun;
    break;
case DEBUFFS.MECHANIC_ATTACK:
    return sDebuffMech;
    break;
default:
    return sNoone;
    break;
}
