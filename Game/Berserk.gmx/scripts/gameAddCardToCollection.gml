///gameAddCardToCollection(CARDS index, int amount)
var p = -1,
    l = -1;
var col = global.collection;
for (var i = 0, c = ds_list_size(global.collection); i < c; i += 2)
{
    if (col[| i] == argument0) // we've got it
    {
        p = i;
        break;
    }
}
if (p != -1) // we do already have such card, just increase the amount
{
    col[| p + 1] += argument1;
}
else
{
    ds_list_add(global.collection, argument0, argument1);
}

