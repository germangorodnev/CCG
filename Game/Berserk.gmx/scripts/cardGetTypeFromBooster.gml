///cardGetTypeFromBooster(int rarity)
var rar = argument0;
var c = irandom(CARDS.CARDS_COUNT - 1);
while (!cardIsPlayable(c) || cardGetRarity(c) != rar)
{
    c = irandom(CARDS.CARDS_COUNT - 1);
}
return c;
