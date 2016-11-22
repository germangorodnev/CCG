///cardDeleteBuff(BUFFS ind)
var b = argument0;
for (var i = 0, c = ds_list_size(buffs); i < c; i++)
{
    var ls = buffs[| i];
    if (ls[| 0] == b)
    {
        switch (b)
        {
        case BUFFS.INVISIBILITY:
            // visible now
            image_alpha = 1;
            break;
        }
        ds_list_destroy(ls);
        ds_list_delete(buffs, i);
        exit; 
    }
}
