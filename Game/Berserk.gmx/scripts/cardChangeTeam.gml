var ls = argument0, // new group
    otherLs = argument1, // current team
    pos = argument2; // position in list
ds_list_insert(ls, pos, id);

var pos = ds_list_find_index(otherLs, id);
ds_list_delete(otherLs, pos);

player = 1 * (player == 0);

// check all the impacts and reset
// WARNING
cardClearImpacts();
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
