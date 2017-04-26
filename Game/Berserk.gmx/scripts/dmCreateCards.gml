/// delete curret one and create new from iMin to iMax
with (oCardDeck)
{
    if (inDeck == false)
        instance_destroy();
}
var pos = 0;
// getting all the cards from collection
if (ds_list_empty(localCol))
    exit;
    
for (var i = iMin; i < iMax; i++)
{
    var cardId = localCol[| i * 2],
        count = localCol[| i * 2 + 1];
    if (is_undefined(cardId) || is_undefined(count))
        continue;
    if (!cardIsPlayable(cardId) || count == 0)
    {
        continue;
    }
    var xp = ccx + ccbetw * (pos mod crow),
        yp = ccy + ccbetwy * (pos div crow);
    // creating the card
    var c = instance_create(xp, yp, oCardDeck);
    c.type = cardId;
    c.drawCount = true;
    c.copyCount = count;
    with (c)
    {
        dmCardInit();
    }
    pos++;
}

