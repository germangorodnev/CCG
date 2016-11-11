///cardCookieRutPerformer(oCardBase* c, Cookie* par)
var c = argument0,
    par = argument1;
with (c)
{
    cardDealDamage(1, false);
    if (hp <= 0)
    {
        // oops heal the cookie
        if (instance_exists(par))
            with (par)
                cardChangeHp(2);
    }
}
cardAttackDestroy();
