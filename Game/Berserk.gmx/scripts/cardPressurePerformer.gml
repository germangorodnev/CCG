///cardPressurePerformer(oCardBase* c)
var c = argument0,
    d = dmg;
with (c)
{
    if (armor > dmg) // just block that shit
        exit;
    if (armor > 0)
    {
        cardChangeHp(-(d - armor));
        exit;
    }
    else
    {
        cardChangeHp(-d);
    }
}

