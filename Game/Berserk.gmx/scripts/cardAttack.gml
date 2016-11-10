///cardAttack(index where, list* whichList, int dmg, int speed, list* debuffs) returns the id of the shot
var a = instance_create(x, y, oAttack);
var t = argument1[| argument0]; 
a.parent = id;
a.pl = player;
with (a)
{
    if (!is_undefined(t))
        target = t;
    else
        target = noone;
    dmg = argument2;
    speed = argument3;
    spd = speed; 
    startPl = pl;
    if (argument4 != -1)
    {
        ds_list_copy(debuffs, argument4);
        ds_list_destroy(argument4);
    }
    if (argument3 == -1) // instant
    {
        spd = 0;
        if (target != noone)
        {
            x = target.x;
            y = target.y
        }
    }   
}
return a;
