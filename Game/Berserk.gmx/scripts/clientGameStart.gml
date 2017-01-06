///clientGameStart(buffer*)
var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64;
var yB = room_height - CARD_Y;

// first placing enemy's cards on the top
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var type = buffer_read(argument0, buffer_u16);
    var a = instance_create(xB + (i % w) * 128, yB - (i div w) * 128, oCard);
    a.type = type;
    a.player = 1; // enemy
    a.ind = i;
    with (a)
        cardInit();
    ds_list_add(global.opCards, a); // from the bottom left to the top right
}

// now getting our cards TO THE BOTTOM
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var type = buffer_read(argument0, buffer_u16);
    var a = instance_create(xB + (i % w) * 128, CARD_Y + (i div w) * 128, oCard);
    a.type = type;
    a.player = 0; // us
    a.ind = i;
    with (a)
        cardInit();
    ds_list_add(global.cards, a); // from the top left to the bottom right
}

