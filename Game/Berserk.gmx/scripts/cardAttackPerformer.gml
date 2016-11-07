///cardAttackPerformer(oCardBase* c)
var c = argument0,
    dbf = debuffs,
    d = dmg,
    a = absolute,
    brA= breakArmor;
with (c)
{
    cardDealDamage(d, a);
    cardSetDebuffs(dbf);
    if (brA)
        cardChangeArmor(-armor);
}
if (parent != noone)
{
    if (instance_exists(parent))
    {
        with (parent)
            cardDone();
    }
}           
instance_destroy();

