var ls = argument0,
    d = argument1;
for (var i = 0, c = ds_list_size(argument1); i < c; i++)
{
    var card = d[| i];
    var p = findCardPosInDeckWithNumbByIndex(card, ls);
    if (p != -1)
    {
        ls[| (p + 1)] += 1;
    }   
    else
    {
        ds_list_add(ls, card, 1);
    }   
}

