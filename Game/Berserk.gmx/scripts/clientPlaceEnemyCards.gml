///clientPlaceEnemyCards()
var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64;
var yB = room_height - CARD_Y;

// first placing enemy's cards on the top
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var type = global.opCards[| i];
    var a = instance_create(xB + (i % w) * 128, yB - (i div w) * 128, oCard);
    a.type = type;
    a.player = 1; // enemy
    a.ind = i;
    with (a)
        cardInit();
    ds_list_replace(global.opCards, i, a);
}
