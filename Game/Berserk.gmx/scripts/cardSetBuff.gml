///cardSetBuff(BUFFS buff, int turns, ...)
var b = argument0;
var pos = cardHasBuff(b, id);
if (pos != -1)
{
    // we already have it, just update
    var l = buffs[| pos];
    l[| 1] = argument1;
}
else
{
    // add
    var newL = ds_list_create();
    ds_list_add(newL, argument0, argument1);
    ds_list_add(buffs, newL);
    ds_list_mark_as_list(buffs, 0);
}   

switch (b)
{
case BUFFS.INVISIBILITY:
    image_alpha = 0.5;
    break;
case BUFFS.FIRE_ARROWS:
    cardChangeDmg(2);
    break;
}
