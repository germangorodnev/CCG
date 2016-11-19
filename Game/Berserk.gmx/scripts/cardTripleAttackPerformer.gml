///cardAttackPerformer(oCardBase* c)
var c = argument0,
    d = dmg;
with (c)
{
    cardDealDamage(d, false);
}
// create two swords

var a = instance_create(c.x, c.y, oAttack);
a.target = instance_position(a.x - 110, a.y, oCardBase);
a.direction = 180;
a.parent = parent;
a.pl = pl;
a.dmg = ceil(dmg / 2);
a.speed = speed;
a.spd = spd;
 
a = instance_create(c.x, c.y, oAttack);
a.target = instance_position(a.x + 100, a.y, oCardBase);
a.parent = parent;
a.pl = pl;
a.dmg = ceil(dmg / 2);
a.speed = speed;
a.spd = spd;
