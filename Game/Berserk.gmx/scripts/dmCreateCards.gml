/// delete curret one and create new from iMin to iMax
with (oCardDeck)
    instance_destroy();
var pos = 0;
// getting all the cards from collection
iMin = 0;
iMax = min(crow *2 , ds_list_size(global.collection));
if (ds_list_empty(global.collection))
    exit;
for (var i = iMin; i < iMax; i += 2)
{
    var cardId = global.collection[| i];
    if (!cardIsPlayable(cardId))
    {
        continue;
    }
    var xp = ccx + ccbetw * (pos mod crow),
        yp = ccy + ccbetwy * (pos div crow);
    // creating the card
    var c = instance_create(xp, yp, oCardDeck);
    c.type = cardId;
    with (c)
    {
        dmCardInit();
    }
    pos++;
}
