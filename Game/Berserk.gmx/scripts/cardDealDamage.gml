///cardDealDamage(int damage, bool trueDmg)
if (argument1 == false)
{
    if (armor >= argument0) // armor fully takes dmg
    {
        cardChangeArmor(-argument0);
        exit;
    }
    else
    {
        cardChangeHp(-(max(argument0 - armor, 1)));
        cardChangeArmor(-1);
    }
}
else
    cardChangeHp(-argument0);
