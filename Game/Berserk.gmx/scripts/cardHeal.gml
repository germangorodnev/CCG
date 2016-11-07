///cardHeal(index who, ds_list* whichList, int power)
var t = argument1[| argument0]; 
var a = instance_create(t.x, t.y, oHeal);
with (t)
{
    cardChangeHp(argument2);
}
return a;

