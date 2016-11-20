///cardGetFreePlace(player where)
// iterate over global.opCards and find a place
var w = global.cardsOnBoard / 2,
    xB = CARD_X - (w - 5) * 64;
if (argument0 == 0)
{
    yB = CARD_Y;
    s = 1;
}
else
{
    yB = room_height - CARD_Y;
    s = -1;
}
    
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var xp = xB + (i % w) * 128,
        yp = yB + ((i div w) * 128) * s;
    var card = instance_position(xp, yp, oCardBase);
    if (card == noone)
    {
        card = instance_position(xp, yp, oPlaceNotFree);
        if (card == noone)
            return i;
    }
}
return -1;
