///cardAttack(index where, list* whichList, int dmg, int speed, list* debuffs) returns the id of the shot
var a = instance_create(x, y, oAttack);
var t = argument1[| argument0]; 
if (!is_undefined(t))
    a.target = t;
else
    a.target = noone;
a.parent = id;
a.dmg = argument2;
a.speed = argument3;
a.spd = a.speed; 
if (argument4 != -1)
{
    ds_list_copy(a.debuffs, argument4);
    ds_list_destroy(argument4);
}
return a;
