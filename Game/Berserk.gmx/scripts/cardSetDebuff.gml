///cardSetDebuff(ds_list* l)
switch (argument0[| 0])
{
case DEBUFFS.POISON:
    ds_list_add(debuffs, argument0);
    break;
case DEBUFFS.STUN:
    ds_list_add(debuffs, argument0);
    break;
}
