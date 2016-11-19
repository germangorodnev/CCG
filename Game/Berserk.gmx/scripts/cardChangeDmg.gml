///cardChangeDmg(int rel)
var o = dmg;
dmg = clamp(dmg + argument0, 0, 1000);
if (o != dmg)
    dmgSc = 2;
if (dmg > _dmg)
{
    dmgCol = c_green;
}
else
    dmgCol = _dmgCol; 
