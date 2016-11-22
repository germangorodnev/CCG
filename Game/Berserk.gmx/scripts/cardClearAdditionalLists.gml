switch (type)
{
case CARDS.GOLEM_MENTOR:
    for (var i = 0, c = ds_list_size(ls1); i < c; i++)
    {
        if (ls1[| i] != noone)
        {
            var myid = id;
            with (ls1[| i])
            {
                cardDeleteImpact(myid);
            }
        }
    }
    ds_list_destroy(ls1);
    break;
}

