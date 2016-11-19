///cardGetCountOnBoard(CARDS ind, Ds* group)
var am = 0, 
    ls = argument1;
for(var i = 0, c = ds_list_size(ls); i < c; i++)
{
    if (ls[| i].type == argument0)
        am++;
}
return am;
