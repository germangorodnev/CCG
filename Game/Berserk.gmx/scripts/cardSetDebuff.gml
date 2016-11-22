///cardSetDebuff(ds_list* l)
switch (argument0[| 0])
{
case DEBUFFS.POISON:
    var emptyLs = ds_list_create();
    ds_list_copy(emptyLs, argument0);
    ds_list_add(debuffs, emptyLs);
    ds_list_mark_as_list(debuffs, ds_list_size(debuffs) - 1);
    break;
case DEBUFFS.STUN:
    var emptyLs = ds_list_create();
    ds_list_copy(emptyLs, argument0);
    ds_list_add(debuffs, emptyLs);
    ds_list_mark_as_list(debuffs, ds_list_size(debuffs) - 1);
    canTurn = false;
    if (ds_list_size(actions) > 0)
    {
        cardDone();
        ds_list_clear(actions);
    }
    break;
}





