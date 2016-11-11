///cardAttackPerformer(oCardBase* c)
var c = argument0,
    dbf = debuffs,
    d = dmg,
    a = absolute,
    brA= breakArmor;
with (c)
{
    cardDealDamage(d, a);
    if (hp <= 0)
        exit;
    cardSetDebuffs(dbf);
    if (brA)
        cardChangeArmor(-armor);
}

