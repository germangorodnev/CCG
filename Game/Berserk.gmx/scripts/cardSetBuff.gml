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
}   


