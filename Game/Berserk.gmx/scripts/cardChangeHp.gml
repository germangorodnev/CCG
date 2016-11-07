///cardChangeHp(int rel)
var o = hp;
hp = clamp(hp + argument0, 0, _hp);
if (hp < _hp)
{
    hpCol = lessCol;
}
else if (hp > __hp)
{
    hpCol = moreCol;
}
else
{
    hpCol = _hpCol;
}

if (o != hp)
    hpSc = 2;

