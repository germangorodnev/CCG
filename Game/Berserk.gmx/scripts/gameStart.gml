/// Choose random cards
global.gameState = GAME_STATES.CARD_PREPARE;
// temporary list
var d = ds_list_create();
ds_list_copy(d, global.deck);

// now get random cards on board
var w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64;

// Creating our own cards
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var cardInd = irandom_range(0, ds_list_size(d) - 1);
    var card = d[| cardInd];
    ds_list_delete(d, cardInd);
    var a = instance_create(xB + (i % w) * 128, CARD_Y + (i div w) * 128, oCard);
    a.type = card;
    a.player = 0; // our
    a.ind = i;
    with (a)
        cardInit();
    ds_list_add(global.cards, a); // from the top left to the bottom right
}


ds_list_clear(d);
ds_list_copy(d, opDeck);
// Creating the cards of our opponent
var yB = room_height - CARD_Y;
for (var i = 0; i < global.cardsOnBoard; i++)
{
    var cardInd = irandom_range(0, ds_list_size(d) - 1);
    var card = d[| cardInd];
    ds_list_delete(d, cardInd);
    var a = instance_create(xB + (i % w) * 128, yB - (i div w) * 128, oCard);
    a.type = card;
    a.player = 1; //!!!!
    a.ind = i;
    with (a)
        cardInit();
    ds_list_add(global.opCards, a); // from the bottom left to the top right
}

ds_list_destroy(d);
d = 0;


