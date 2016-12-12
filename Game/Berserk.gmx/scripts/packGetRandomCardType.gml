var chR = 10.0;
var chL = 0.01;
switch (argument0)
{
case 3: // just three jandom cards
    var r = random_range(0, 100);
    if (chL >= r) // LEGA
    {
        return cardGetTypeFromBooster(2);
    }
    else if (chR >= r) // RARE
    {
        return cardGetTypeFromBooster(1);
    }
    else
        return cardGetTypeFromBooster(0);
    break;
case 5:
    chR = 25;
    chL = 3;
    var r = random_range(0, 100);
    if (chL >= r) // LEGA
    {
        return cardGetTypeFromBooster(2);
    }
    else if (chR >= r) // RARE
    {
        return cardGetTypeFromBooster(1);
    }
    else
        return cardGetTypeFromBooster(0);
    break;
}
