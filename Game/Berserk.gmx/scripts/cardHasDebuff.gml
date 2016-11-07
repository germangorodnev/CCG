///cardHasDebuff(DEBUFFS d, oCardBase c)
with (argument1)
{
    for (var i = 0, c = ds_list_size(debuffs); i < c; i++)
    {
        var l = debuffs[| i];
        if (l[| 0] == argument0)
        {
            // we've got such buff
            return i;
        }   
    }
    return -1;
}

