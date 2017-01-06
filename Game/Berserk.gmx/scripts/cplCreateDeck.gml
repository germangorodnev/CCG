/// delete curret one and create new from dMin to dMax
with (oCardPlaceUI)
{
with (oCardDeck)
{
    instance_destroy();
}
var pos = 0;
// getting all the cards from collection
//if (ds_list_empty(localDeck))
//    exit;
    
for (var i = dMin; i < dMax; i++)
{
    var cardId = localDeck[| i * 2],
        count = localDeck[| i * 2 + 1];
    if (is_undefined(cardId) || is_undefined(count))
        continue;
    if (count == 0)
        continue;
    var xp = cdx + ccbetw * (pos mod crow),
        yp = cdy + ccbetwy * (pos div crow);
    // creating the card
    var c = instance_create(xp, yp, oCardDeck);
    c.type = cardId;
    c.mode = 4;
    c.drawCount = true;
    c.inDeck = true;
    c.copyCount = count;
    with (c)
    {
        dmCardInit();
    }
    pos++;
}
}

