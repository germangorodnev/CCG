switch (type)
{
case CARDS.GOLEM_MENTOR:
    var hf = sprite_get_width(sprite_index);
    var l = instance_position(x - hf - 45, y, oCardBase),
        r = instance_position(x + hf + 45, y, oCardBase);
    var myid = id;
    if (l != noone && l != id)
    {
        if (l.player == player)
        if (round(l.image_xscale) == 1)
        {
            // if we haven't increased yet
            if (ds_list_find_index(ls1, l) == -1)
            {
                ds_list_add(ls1, l);
                with (l)
                {
                    cardAddImpact(CARDS.GOLEM_MENTOR, myid);
                    cardChangeDmg(2);
                }
            }
        }
    } 
    if (r != noone && r != id)
    {
        if (r.player == player)
        if (round(r.image_xscale) == 1)
        {
            if (ds_list_find_index(ls1, r) == -1)
            {
                ds_list_add(ls1, r);
                with (r)
                {
                    cardAddImpact(CARDS.GOLEM_MENTOR, myid);
                    cardChangeDmg(2);
                }
            }
        }
    }
    break;
}
