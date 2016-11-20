///cardReplace(CARDS type)
if (!canReplace)
    exit;
canReplace = false;
var newC = instance_create(x, y, oCard);
newC.type = argument0;
newC.player = player;
with (newC)
{
    cardInit();
}
var myg = cardGetGroup();
var p = ds_list_find_index(myg, id);
ds_list_replace(myg, p, newC);

