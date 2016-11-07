///cardHasBuff(BUFFS buffName, oCardBase id)
with (argument1)
{
    for (var i = 0, c = ds_list_size(buffs); i < c; i++)
    {
        var l = buffs[| i];
        if (l[| 0] == argument0)
        {
            // we've got such buff
            return i;
        }   
    }
    return -1;
}

