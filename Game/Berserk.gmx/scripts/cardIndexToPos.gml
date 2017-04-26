///cardIndexToPos(index 0 .. global.cardsOnBoard - 1, ds_list* where)
var _id = noone,
    index = argument0;
var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64;
var yB = CARD_Y;

if (argument1 == global.cards) 
{
    // get place in our side
    _id = instance_position(xB + (index % w) * 128, CARD_Y + (index div w) * 128, oCardBase);
}
else if (argument1 == global.opCards)
{
    // get place in enemy side
    yB = room_height - CARD_Y;
    _id = instance_position(xB + (index % w) * 128, yB - (index div w) * 128, oCardBase);
}
return _id;
