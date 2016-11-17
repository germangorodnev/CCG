///makeDeckWithRepeatFromCopyCount(Deck* to, Deck* source)
var from = argument1,
    to = argument0;
for (var i = 0, c = ds_list_size(from) / 2; i < c; i++)
{
    var card = from[| i * 2],
        amount = from[| i * 2 + 1];
    repeat(amount)
    {
        ds_list_add(to, card);
    }
}

