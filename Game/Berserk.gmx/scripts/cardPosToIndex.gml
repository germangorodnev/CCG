///cardPosToIndex(x, y)
var out = 0;
var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64,
    yB = CARD_Y,
    mult = 1;
if (player == 1)
{
    mult = -1;
    yB = room_height - CARD_Y;
} 
out += (argument0 - xB) / 128;
if (argument1 != median(yB - 50, argument1, yB + 50))
    out += w;
return out;


