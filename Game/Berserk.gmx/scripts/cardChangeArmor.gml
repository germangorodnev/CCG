///cardChageArmor(int rel)
var o = armor;
armor = clamp(armor + argument0, 0, _armor);
if (o != armor)
    armorSc = 2;
