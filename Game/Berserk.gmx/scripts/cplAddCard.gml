///cplAddCard(type, oPlaceHolder* id)
var xp = argument1.x,
    yp = argument1.y,
    i = argument1.ind,
    w = global.cardsOnBoard / 2;
var xB = CARD_X - (w - 5) * 64;

var a = instance_create(xB + (i % w) * 128, CARD_Y + (i div w) * 128, oCard);
a.type = argument0;
a.player = 0; // our
a.ind = i;
with (a)
    cardInit();
ds_list_add(global.cards, a); // from the top left to the bottom right
with (argument1)
    instance_destroy();
