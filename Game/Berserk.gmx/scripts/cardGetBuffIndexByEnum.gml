///cardGetBuffIndexByEnum(BUFFS v)
switch (argument0)
{
case BUFFS.BLOCK:
    return sBuffBlock;
    break;
case BUFFS.INVISIBILITY:
    return sInvis;
    break;
case BUFFS.GREAT_HEAL:
    return sGrH;
    break;
default:
    return sNoone;
    break;
}
