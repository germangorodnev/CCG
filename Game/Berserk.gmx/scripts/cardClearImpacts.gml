for (var i = 0, c = ds_list_size(impacts) / THINGS_IN.IMPACT; i < c; i++)
{
    var ind = impacts[| i * 2 + 1];
    cardDeleteImpact(ind);
}
ds_list_clear(impacts);
