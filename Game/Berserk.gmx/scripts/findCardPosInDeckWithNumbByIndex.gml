///findCardPosInDeckWithNumbByIndex(CARDS ind, Deck* d)
var dd = argument1;
if (ds_list_empty(dd))
    return -1;
for (var k = 0, c = ds_list_size(dd) / 2; k < c; k++)
{
    var card = dd[| k * 2];
    if (card == argument0)
    {
        return k * 2;
    }   
}   
return -1;
