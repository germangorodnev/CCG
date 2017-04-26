///cardGetBuffIndexByEnum(BUFFS v, int turns untilEnd)
switch (argument0)
{
case BUFFS.BLOCK:
    return sBuffBlock;
    break;
case BUFFS.INVISIBILITY:
    return sInvis;
    break;
case BUFFS.GREAT_HEAL:
    return asset_get_index("sGrH" + string(median(1, argument1, 3)));
    break;
default:
    return sNoone;
    break;
}
