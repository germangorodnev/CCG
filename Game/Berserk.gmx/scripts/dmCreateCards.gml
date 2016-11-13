/// delete curret one and create new from iMin to iMax
with (oCardDeck)
    instance_destroy();
var pos = 0;
for (var i = iMin; i <= iMax; i++)
{
    if (!cardIsPlayable(i))
    {
        continue;
    }
    var xp = ccx + ccbetw * (pos mod crow),
        yp = ccy + ccbetwy * (pos div crow);
    // creating the card
    var c = instance_create(xp, yp, oCardDeck);
    c.type = i;
    with (c)
    {
        dmCardInit();
    }
    pos++;
}
