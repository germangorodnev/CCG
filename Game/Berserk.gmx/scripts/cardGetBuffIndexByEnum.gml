///cardGetBuffIndexByEnum(BUFFS v)
switch (argument0)
{
case BUFFS.BLOCK:
    return sBuffBlock;
    break;
case BUFFS.INVISIBILITY:
    return sInvis;
    break;
default:
    return sCursor;
    break;
}
