///cardListPosToY(player which list, int pos)
var pl = argument0, 
    pos = argument1;
var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64, 
    yB = 0,
    s = 1;
if (pl == 0)
{
    s = 1;
    yB = CARD_Y;
}
else
{
    s = -1;
    yB = room_height - CARD_Y;
}
return yB + ((pos div w) * 128) * s;
