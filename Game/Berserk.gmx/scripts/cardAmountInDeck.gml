///cardAmountInDeck(CARDS type, Deck* deck) 
// deck is INDEX, AMOUNT format
var d = argument1;
for (var i = 0, c = ds_list_size(d); i < c; i++)
{
    if (d[| i * 2] == argument0)
        return (d[| i * 2 + 1]);
}
return 0;
