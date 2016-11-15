///gameAddCardToCollection(CARDS index, int amount)
var p = -1,
    l = -1;
for (var i = 0, c = ds_list_size(global.collection); i < c; i++)
{
    l = global.collection[| i]; // list of current card
    if (!ds_exists(l, ds_type_list))
        continue;
    if (l[| 0] == argument0) // we've got it
    {
        p = i;
        break;
    }
}
if (p != -1) // we do already have such card, just increase the amount
{
    l[| 1] += argument1;
}
else
{
    // add new list
    var newList = ds_list_create();
    ds_list_add(newList, argument0, argument1);
    ds_list_add(global.collection, newList);
}

