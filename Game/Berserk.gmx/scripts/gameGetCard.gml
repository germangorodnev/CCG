///gameGetCard(bool playable, 0\1\2\3 rarity)
var playable = argument0,
    rarity = argument1;
var c = -1;
if (argument1 < 3)
{
    c = irandom(CARDS.CARDS_COUNT - 1);
    while (!cardIsPlayable(c) || cardGetRarity(c) != rar)
    {
        c = irandom(CARDS.CARDS_COUNT - 1);
    }
}
else
{
    c = irandom(CARDS.CARDS_COUNT - 1);
    while (!cardIsPlayable(c))
    {
        c = irandom(CARDS.CARDS_COUNT - 1);
    }
}
return c;

