///cardChageArmor(int rel)
var o = armor;
armor = clamp(armor + argument0, 0, 1000);
if (o != armor)
    armorSc = 2;
