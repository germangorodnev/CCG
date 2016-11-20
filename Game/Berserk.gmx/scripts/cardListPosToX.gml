///cardListPosToX(player which list, int pos)
var pl = argument0, 
    pos = argument1;
var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64;
if (pl == 0)
{
    s = 1;
}
else
{
    s = -1;
}
return xB + (pos % w) * 128;

