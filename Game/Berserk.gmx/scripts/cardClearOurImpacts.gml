if (hasImpact)
{
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
    ds_list_clear(ls1);
}   
