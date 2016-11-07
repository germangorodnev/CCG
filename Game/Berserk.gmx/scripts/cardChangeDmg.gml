///cardChangeDmg(int rel)
var o = dmg;
dmg = clamp(dmg + argument0, 0, _dmg);
if (o != dmg)
    dmgSc = 2;
