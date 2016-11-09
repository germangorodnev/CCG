///cardSetDebuffs(ds_list* debuffs)
// add an debuff
for (var i = 0, c = ds_list_size(argument0); i < c; i++)
{
    var l = argument0[| i]; // list
    var db = l[| 0];
    if (ds_list_find_index(resists, db) != -1)
    {
        // we've got immunity, dont even care
        continue;
    }
    var pos = cardHasDebuff(db, id);
    if (pos != -1)
    {
        // we already have it, just update
        switch (db)
        {
        case DEBUFFS.POISON:
            var ls = debuffs[| pos];
            ls[| 1] = l[| 1];            
            break;
        case DEBUFFS.STUN:
            var ls = debuffs[| pos];
            ls[| 1] = l[| 1];
            canTurn = false;
            break;
        }
    }
    else
    {
        cardSetDebuff(l);
    }
}
ds_list_destroy(argument0);
