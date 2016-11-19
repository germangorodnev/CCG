///cardChangeMana(int rel)
var o = mana;
mana = clamp(mana + argument0, 0, 10);
if (o != mana)
    manaSc = 2;
if (mana < _mana)
{
    manaCol = lessCol;
}
else
{
    manaCol = _manaCol;
}

