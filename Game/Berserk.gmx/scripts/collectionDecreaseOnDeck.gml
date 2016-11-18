///collectionDecreaseOnDeck(Collection, Deck)
var col = argument0,
    d = argument1;
for (var i = 0, c = ds_list_size(d) / 2; i < c; i++)
{
    var card = d[| i * 2];
    var pos = findCardPosInDeckWithNumbByIndex(card, col);
    col[| pos + 1] -= d[|i * 2 + 1];
}
