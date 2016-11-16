///cardDevourPerformer(oCardBase* c, Cookie* par, int damage, int heal)
var c = argument0,
    par = argument1,
    dmg = argument2,
    heal = argument3;
with (c)
{
    if (hp <= dmg) // 0 dmg
    {
        cardDealDamage(dmg, false);
        if (hp <= 0)
        {
            // oops heal the cookie
            if (instance_exists(par))
                with (par)
                    cardChangeHp(heal);
        }
    }
}
cardAttackDestroy();
